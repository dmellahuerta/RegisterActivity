# frozen_string_literal: true

module Dummy
  class UsersController < ApplicationController
    before_action :set_user, only: [:update]
    # PUT dummy/users/:id
    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :bad_request
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name)
    end
  end
end
