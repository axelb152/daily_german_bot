class SeedVocabularyJob
  include Sidekiq::Job

  queue_as :default

  def perform(batch)
    Vocabulary.transaction do
      batch.each do |entry|
        Vocabulary.create!(word: entry['word'])
      end
    end
  end
end
