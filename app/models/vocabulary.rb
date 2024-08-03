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
  # validates :translation, allow_blank: true

  def fetch_translation
    return unless self.translation.blank?

    translated_text = DeeplService.translate(self.word, 'EN')
    self.update(translated: translated_text)

  end
end