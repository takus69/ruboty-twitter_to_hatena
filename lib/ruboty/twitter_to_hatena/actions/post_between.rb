module Ruboty
  module Twitter_To_Hatena
    module Actions
      class PostBetween < Ruboty::Actions::Base
        def call
          message.reply(post_between)
        rescue => e
          message.reply(e.message)
        end

        private
        def post_between
          start_date = message[:start_date]
          end_date = message[:end_date]

          tweets = EditTweets.fetch_tweets_between(start_date, end_date)
          return "There aren't tweets." if tweets.empty?

          body = EditTweets.edit_tweets_for_hatena(tweets)
          if PostToHatena.post_to_hatena("つぶやき between #{start_date} and #{end_date}", body, "twitter")
            "Post tweets to hatena."
          else
            "Posting tweets to hatena fails."
          end
        end
      end
    end
  end
end
