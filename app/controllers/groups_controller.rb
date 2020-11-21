class GroupsController < ApplicationController
  before_action :logged_in_or_back

  def index
    @groups = Group.includes(:user).all.with_attached_icon
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    group.user_id = current_user.id
    if group.save
      flash[:success] = 'Group added'
      redirect_to groups_path
    else
      flash[:danger] = 'Invalid group'
      redirect_back(fallback_location: new_group_path)
    end
  end

  def show
    @group = Group.includes(:payments, :user).find(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
