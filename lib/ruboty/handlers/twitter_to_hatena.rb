require "ruboty/twitter_to_hatena/actions/post"
require "ruboty/twitter_to_hatena/actions/post_between"

module Ruboty
  module Handlers
    # Post tweets to hatena blog.
    class Twitter_To_Hatena < Base
      on /post\z/, name: 'post', description: 'Post last month\'s tweets to hatena blog.'

      def post(message)
        Ruboty::Twitter_To_Hatena::Actions::Post.new(message).call
      end
    end
  end
end
