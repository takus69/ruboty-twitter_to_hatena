require "ruboty/twitter_to_hatena/actions/post"
require "ruboty/twitter_to_hatena/actions/post_between"

module Ruboty
  module Handlers
    # Post tweets to hatena blog.
    class Twitter_To_Hatena < Base
      on /post_between (?<start_date>) (?<end_date>)\z/, name: 'post_between', description: 'Post tweets to hatena blog between YYYY/MM/DD YYYY/MM/DD.'
      on /post (?<date>.+)\z/, name: 'post', description: 'Post tweets to hatena blog on YYYY/MM/DD.'
      on /post(?<date>)\z/, name: 'post', description: 'Post yesterday\'s tweets to hatena blog.'

      def post(message)
        Ruboty::Twitter_To_Hatena::Actions::Post.new(message).call
      end

      def post_between(message)
        Ruboty::Twitter_To_Hatena::Actions::PostBetween.new(message).call
      end
    end
  end
end
