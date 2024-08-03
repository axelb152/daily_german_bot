require 'json'

file_path = Rails.root.join('db/seeds/German-words-5000-words.json')
json_data = JSON.parse(File.read(file_path))

json_data.each do |entry|
  Vocabulary.create!(word: entry['word'])
end