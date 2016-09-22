require "edit_daily_tweets"
require "post_to_hatena"

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
          date = message[:date] || yesterday

          tweets = fetch_daily_tweets(date)
          return "There aren't tweets." if tweets.empty?

          body = edit_tweets_for_hatena(tweets)
          if post_to_hatena("つぶやき at #{date}", body, "twitter")
            "Post tweets to hatena."
          else
            "Posting tweets to hatena fails."
          end
        end
      end
    end
  end
end
