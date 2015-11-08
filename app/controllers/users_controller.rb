class UsersController < ApplicationController
    respond_to :html
    
    def show
        @user = User::find(params[:id])
        @is_me = @user.id == current_user.id ? true : false
        
        if !@is_me 
            @status = current_user.status_with @user.id
            @friend = Friend.where(user_id: current_user.id, friend_id: @user.id).try(:first) ||
                Friend.where(user_id: @user.id, friend_id:current_user.id).try(:first)
        end
    end


    def index
        @users = User.all
        @users = User.paginate(page: params[:page], per_page: 2)
        respond_with(@users)
    end
    
end
