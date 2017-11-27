class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    def index
        render json: User.all
    end

    def show
        if @user
          render json: @user, status: :ok
        else
          render json: {errors: "No User Found"}, status: :bad_request
        end
    end

    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: {errors: @user.errors}
      end
    end

    private
        def set_user
          @user = User.find(params[:id]);
        end

        def user_params
          params.require(:user).permit(:email, :password, :username)
        end
end
