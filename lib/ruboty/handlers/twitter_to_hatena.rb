require "ruboty/twitter_to_hatena/actions/post"

module Ruboty
  module Handlers
    # Post tweets to hatena blog.
    class Twitter_To_Hatena < Base
      on /post (?<date>\d+)/, name: 'post', description: 'Post tweets to hatena blog.'

      def post(message)
        Ruboty::Twitter_To_Hatena::Actions::Post.new(message).call
      end

    end
  end
end