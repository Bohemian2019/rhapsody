class UsersController < ApplicationController
  def show
  end

  def edit
  end

  def cancel_show
  end

  def ranking_show
    @users = User.where(admin: false).order("point DESC")
  end

  def my_community_index
  end
end
