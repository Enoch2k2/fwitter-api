class SessionsController < ApplicationController
    def login
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            render json: @user, status: :accepted
        else
            render json: {errors: "Invalid Email or Password"}, status: :bad_request
        end
    end
end
