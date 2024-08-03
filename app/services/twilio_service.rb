require 'twilio-ruby'

class TwilioService
  def self.send_whatsapp_message(to, body)
    client = Twilio::REST::Client::new
    client.messages.create(
      from: "whatsapp:#{ENV['TWILIO_PHONE_NUMBER']}",
      to: "whatsapp:#{to}",
      body: body
    )
  end
end