# == Schema Information
#
# Table name: vocabularies
#
#  id          :integer          not null, primary key
#  word        :string
#  translation :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Vocabulary < ApplicationRecord
  validates :word, presence: true, uniqueness: true
  validates :translation, presence: true

  before_create :fetch_translation

  private

  def fetch_translation
    self.translation = DeepLService.translate(self.word, 'EN')
  end
end
