class TweetsController < ApplicationController
    before_action :set_tweet, only: [:show, :update, :destroy]

    def index
        render json: Tweet.all.sort{|x, y| y.created_at <=> x.created_at}, status: :ok
    end

    def show
        if @tweet
            render json: @tweet, status: :ok
        else
            render json: {errors: 'Tweet not found'}, status: :bad_request
        end
    end

    def create
        @tweet = Tweet.new(tweet_params)
        if @tweet.save
            render json: @tweet, status: :created
        else
            render json: {errors: @tweet.errors}, status: :bad_request
        end
    end

    def update

    end

    def destroy

    end

    private
        def set_tweet
            @tweet = params[:id]
        end

        def tweet_params
            params.require(:tweet).permit(:content, :user_id)
        end
end
