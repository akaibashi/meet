class WelcomeController < ApplicationController
  def index
    @users = User.all
    @deleted_users = User.only_deleted
    #@comments = Comment.all

    @comments = Comment.find(:all, :joins => "inner join users on users.id = comments.user_id")

puts @comments


  end
end
