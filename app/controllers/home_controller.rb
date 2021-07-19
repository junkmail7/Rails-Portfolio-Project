class HomeController < ApplicationController
    def index
        @user = User.find(User.with_most_comments.user_id)
    end
end