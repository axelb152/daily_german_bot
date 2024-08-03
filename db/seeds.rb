require 'json'

file_path = Rails.root.join('db', 'seeds', 'German-words-5000-words.json')
puts "Reading JSON file..."
json_data = JSON.parse(File.read(file_path))

batch_size = 100
total_records = json_data.size
total_batches = (total_records / batch_size).ceil

puts "Processing #{total_records} records in #{total_batches} batches of #{batch_size} records each..."

json_data.each_slice(batch_size).with_index do |batch, index|
  Vocabulary.transaction do
    batch.each do |e|
      Vocabulary.create!(word: e['word'])
    end
  end
  puts "Processed batch #{index + 1} of #{total_batches}..."
end

puts "Seeding completed."