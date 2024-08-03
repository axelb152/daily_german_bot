class SeedVocabularyJob
  include Sidekiq::Job

  sidekiq_options retry: 5

  def perform(batch)
    retries = 0
    begin
      ActiveRecord::Base.connection_pool.with_connection do
        Vocabulary.transaction do
          batch.each do |entry|
            Vocabulary.find_or_create_by!(word: entry['word'])
          end
        end
      end
    rescue ActiveRecord::StatementInvalid => e
      if e.message =~ /database is locked/
        retries += 1
        if retries < 5
          sleep(0.5 * retries)
          retry
        else
          raise e
        end
      else
        raise e
      end
    end
  end
end