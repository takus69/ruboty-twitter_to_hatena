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
          TwitterToHatena.main
          "Post tweets to hatena!"
        end
      end
    end
  end
end
