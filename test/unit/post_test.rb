require 'test_helper'

class PostTest < ActiveSupport::TestCase
   test "post attributes not be empty" do
  post = Post.new
     assert post.invalid?
     assert.errors[:title].any?
     assert.errors[:name].any?
     assert.errors[:content].any?
     end
end
