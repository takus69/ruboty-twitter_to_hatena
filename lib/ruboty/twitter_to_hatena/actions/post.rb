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
          if PostToHatena.post_tweets()
            "Post tweets to hatena."
          else
            "Posting tweets to hatena fails."
          end
        end
      end
    end
  end
end
