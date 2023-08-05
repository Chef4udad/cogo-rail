class BlogsController < ApplicationController

    def index
        @user_blogs = set_current_user.blogs
        render json: @user_blogs
    end
end
  