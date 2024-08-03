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
  before_create :fetch_translation

  private

  def fetch_translation
    self.translation = DeeplService.translate(self.word, 'EN')
  end
end
