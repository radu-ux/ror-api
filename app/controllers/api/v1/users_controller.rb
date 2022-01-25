class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]  

    def show
        render json: @user, status: :ok
    end

    def create 
        @user = User.create(params[:user].permit(:email, :password))
        if @user.save
            render json: @user, status: :created
        else 
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def update
        if @user.update(email: params[:user][:email]) 
            render json: @user, status: :ok
        else 
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def destroy 
        @user.destroy
        head :no_content
    end

    private
    def set_user 
        @user = User.find(params[:id])
    end

end
