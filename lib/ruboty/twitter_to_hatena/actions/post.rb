module Ruboty
  module Twitter_To_Hatena
    module Actions
      class Post < Ruboty::Actions::Base
        def call
          message.reply(post)
        rescue => e
          message.reply(e.message)
        end

        private
        def post
          yesterday = (Date.today - 1).to_s
          if message[:date].empty?
            date = yesterday
          else
            date = message[:date]
          end

          tweets = EditDailyTweets.fetch_daily_tweets(date)
          return "There aren't tweets." if tweets.empty?

          body = EditDailyTweets.edit_tweets_for_hatena(tweets)
          if PostToHatena.post_to_hatena("つぶやき on #{date}", body, "twitter")
            "Post tweets to hatena."
          else
            "Posting tweets to hatena fails."
          end
        end
      end
    end
  end
end
