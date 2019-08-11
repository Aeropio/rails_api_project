class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:sign_up]

  def sign_up
    user = User.create(name: params[:name],
                       email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if user.errors.present?
      render json: { failure: 'User could not be created' }
    else
      render json: { sucess: 'User created Successfully' }
    end
  end

  def sign_out
    request.headers['Authorization'].clear
    render json: { sucess: 'User Signed Out' }
  end

  def all_users
    users = User.all
    if users.present?
      render json: users
    else
      render json: { failure: 'No User Found' }
    end
  end
end