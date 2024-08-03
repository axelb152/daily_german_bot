class CreateVocabularies < ActiveRecord::Migration[6.1]
  def change
    create_table :vocabularies do |t|
      t.string :word
      t.string :translation

      t.timestamps
    end
  end
end
