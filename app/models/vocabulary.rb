class Vocabulary < ApplicationRecord
  before_create :fetch_translation

  private

  def fetch_translation
    self.translation = DeepLService.translate(self.word, 'EN')
  end
end