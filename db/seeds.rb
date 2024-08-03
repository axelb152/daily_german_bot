require 'json'

file_path = Rails.root.join('db', 'seeds', 'German-words-5000-words.json')
puts "Reading JSON file..."
json_data = JSON.parse(File.read(file_path))
puts "Finished reading JSON file."

batch_size = 50  # Smaller batch size for Sidekiq
total_records = json_data.size
total_batches = (total_records / batch_size.to_f).ceil

puts "Processing #{total_records} records in #{total_batches} batches of #{batch_size} records each..."

json_data.each_slice(batch_size).with_index do |batch, index|
  SeedVocabularyJob.perform_async(batch)
  puts "Enqueued batch #{index + 1} of #{total_batches}..."
end

puts "Seeding jobs enqueued."