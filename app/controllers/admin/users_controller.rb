class Admin::UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
        @courses = Course.all
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to admin_users_path
        else
            render :new
        end

        presence_save(params)
    end

    def edit
        @user = User.find(params[:id])
        @courses = Course.all
    end

    def update
        @user = User.find(params[:id])
        if @user.update!(user_params)
          flash[:notice] = "##{params[:id]} record successfully updated!"
        else
          flash[:notice] = "Ohh ooooohh, something wrong happend!"
        end

        presence_save(params)

        redirect_to admin_users_path
    end

    def destroy
        User.find(params[:id]).destroy

        redirect_to admin_users_path
    end
private
    def user_params
        params.require(:user).permit(:firstname, :lastname, :birthdate)
    end

    def presence_save(params)
        @user.lessons.destroy_all
        return unless params[:lesson].is_a?(Hash)
        params[:lesson].each do |k,v|
            @user.lessons << Lesson.find(k)
        end
    end
end
