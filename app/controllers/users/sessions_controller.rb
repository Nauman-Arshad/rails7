class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(_resource, _opts = {}) end

  register_success && return if resource.persisted?
  register_failed

  def register_success
    render json: {
      message: 'Signed up successfully',
      user: current_user
    }, status: :ok
  end

  def register_failed
    render json: { message: 'Something went unhappy!' }, status: :unprocessable_entity
  end
end