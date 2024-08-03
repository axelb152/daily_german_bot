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
require "test_helper"

class VocabularyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
