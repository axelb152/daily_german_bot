require 'http'

class DeeplService
  def self.translate(text, target_lang)
    response = HTTP.post(
      "https://api-free.deepl.com/v2/translate",
      headers: {
        "Authorization" => "DeepL-Auth-Key #{ENV['DEEPL_API_KEY']}"
      },
      form: {
        text: text,
        target_lang: target_lang
      }
    )
    response.parse["translations"][0]["text"]
  end
end