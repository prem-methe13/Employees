class UsersController < ApplicationController
  before_action :set_user, only: %i[update show destory show_employees]

  def index
    users = User.all
    render json: users, each_serializer: UserIndexSerializer
  end

  def show
    if @user
      render json: @user, serializer: UserShowSerializer
    else
      render json: {
               errors: "Not able to found"
             },
             status: :unprocessable_entity
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created, serializer: UserShowSerializer
    else
      render json: {
               errors: user.errors.full_messages
             },
             status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, serializer: UserShowSerializer
    else
      render json: {
               errors: @user.errors.full_messages
             },
             status: :unprocessable_entity
    end
  end

  def show_employees
    if @user.designation == "Manager"
      emp = User.where(manager_id: @user.id)
      render json: [
               @user.as_json(only: %i[name email]),
               emp.as_json(only: %i[id name email])
             ]
    else
      render json: { errors: "This employee is not a Manager." }
    end
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(
      %i[
        name
        email
        password
        dob
        mobileNo
        bloodGrp
        gender
        designation
        manager_id
      ]
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
