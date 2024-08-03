namespace :daily_reminder do
  desc "Send daily German vocab reminder via Whatsapp"

  task send: :environment do
    vocab = Vocabulary.find(Vocabulary.pluck(:id).sample)
    vocab.fetch_translation
    message = "Guten Tag!!! \nHier ist deine tägliche Vokabeln-Errinerung:\n🇩🇪  #{vocab.word}\n🇬🇧  #{vocab.translation}"
    user_phone_numbers = ENV['USER_PHONE_NUMBERS'].split(', ')

    user_phone_numbers.each do |number|
      TwilioService.send_whatsapp_message(number, message)
    end
    puts "Sent daily reminder: #{message}"
  end

end