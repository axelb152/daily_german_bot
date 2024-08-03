# README

## License

This project is licensed under the terms of the GNU General Public License v3.0. See the [LICENSE](./LICENSE) file for details.

## Resources
Shoutout to @Jonny-exe for his JSON file of 5000 random german words: https://github.com/Jonny-exe/German-Words-Library

Maybe https://github.com/eymenefealtun/all-words-in-all-languages?tab=readme-ov-file could be used for building a bigger project, but looks like overkill to me right now.

This project uses the Deepl free API and also uses Twilio (premium account for the whatsapp messaging service)

You will need both of these and their respective API keys for your `.env` file if you want to make the rake task exectuable. Both have great documentation.

# If you like what you see, please give it a ⭐️

* ### Potential To-Do List and Next Steps:

#### 1. **Understanding `config/schedule.rb`**
- **Objective**: Ensure the Rake task runs daily at 10am.
- **Explanation**: The `config/schedule.rb` file is used by the `whenever` gem to manage cron jobs. This setup schedules the `daily_reminder:send` task to run every day at 10am.
- **Steps**:
  - Ensure you have the `whenever` gem installed:
    ```ruby
    gem 'whenever', require: false
    ```
  - Example `config/schedule.rb`:
    ```ruby
    every 1.day, at: '10:00 am' do
      rake "daily_reminder:send"
    end
    ```
  - **Deployment**: For this to work, you need to deploy your application to a server and have a mechanism to ensure cron jobs run. This typically involves having Sidekiq running on a production server. The `whenever` gem updates the crontab on the server to run your scheduled tasks.

#### 2. **Deployment**
- **Objective**: Deploy the application to a production server.
- **Explanation**: Deploying to a cloud server ensures your application is always running and can handle scheduled tasks and user requests.
- **Steps**:
  - **Choose a Deployment Method**: Capistrano is a common choice for Rails apps.
    ```ruby
    gem 'capistrano', '~> 3.11'
    gem 'capistrano-rails', '~> 1.4'
    gem 'capistrano-passenger', '~> 0.2.0'
    gem 'capistrano-rbenv', '~> 2.1'
    gem 'capistrano-sidekiq', '~> 2.0'
    ```
  - **Configure Capistrano**: Setup `config/deploy.rb` and related files for your environment.
  - **Provision the Server**: Ensure the server has all necessary dependencies, including Ruby, Rails, MySQL, Redis, and Sidekiq.
  - **Deploy the Application**:
    ```bash
    cap production deploy
    ```

#### 3. **Building a Landing Page**
- **Objective**: Allow users to sign up and select languages they want to learn.
- **Explanation**: Create a web interface for user interaction and store their preferences.
- **Steps**:
  - **Set Up Routes and Controllers**: Define routes and actions for handling user input.
  - **Create Views**: Build forms for user registration and language selection.
  - **Store User Data Securely**: Use ActiveRecord to create a `User` model and store phone numbers and language preferences securely.
  - **Example Migration**:
    ```ruby
    create_table :users do |t|
      t.string :phone_number, null: false, unique: true
      t.string :language, null: false
      t.timestamps
    end
    ```

#### 4. **Using the `deepl-rb` Gem**
- **Objective**: Utilize the `deepl-rb` gem for translations. See https://github.com/wikiti/deepl-rb
- **Explanation**: This gem provides a convenient interface to the DeepL API.
- **Steps**:
  - **Add to Gemfile**:
    ```ruby
    gem 'deepl-rb'
    ```
  - **Configure the Gem**: Set up API keys and usage within your service objects.
  - **Example Usage**:
    ```ruby
    require 'deepl'

    client = DeepL::Client.new(auth_key: ENV['DEEPL_AUTH_KEY'])
    translation = client.translate(text: "Hallo Welt", target_lang: "EN")
    ```

#### 5. **Implementing Glossaries for Multiple Languages**
- **Objective**: Expand functionality to support multiple languages.
- **Explanation**: Use DeepL's glossary feature to manage translations more effectively.
- **Steps**:
  - **Set Up Glossaries**: Define glossaries for different language pairs.
  - **Use Glossaries in Translations**: Integrate glossary use within your translation logic.
  - **Example Glossary Setup**:
    ```ruby
    glossary = client.create_glossary(name: "MyGlossary", source_lang: "DE", target_lang: "EN", entries: {"Hallo" => "Hello"})
    translation = client.translate(text: "Hallo", target_lang: "EN", glossary_id: glossary.id)
    ```

#### 6. **Future Features**
- **Objective**: Identify potential features to enhance the application.
- **Suggestions**:
  - **User Authentication**: Implement user accounts with authentication to manage preferences.
  - **Progress Tracking**: Allow users to track their learning progress over time.
  - **Notifications**: Send reminders or additional learning materials via email or SMS.
  - **Gamification**: Add features like quizzes and rewards to make learning more engaging.
  - **Content Customization**: Personalize the learning experience based on user preferences and progress.