class WorkspacesController < ApplicationController
  skip_before_action :authenticate_user!, only: :all

  def index
    @workspaces = Workspace.where(user_id: params[:user_id])
  end

  def all
    @workspaces = Workspace.all
  end

  def new
    @workspace = Workspace.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @workspace = Workspace.new(workspace_params)
    @workspace.user = @user
    @workspace.save!

    redirect_to workspace_path(@workspace)
  end

  def edit
    @workspace = Workspace.find(params[:id])
  end

  def update
    @workspace = Workspace.find(params[:id])
    @workspace.update(workspace_params)

    redirect_to workspace_path(@workspace)
  end

  def show
    @workspace = Workspace.find(params[:id])
  end

  private

  # TODO: Access control for new, edit, and destroy

  def permited_params
    params.require(:workspace).permit(:name, :smoke_free)
  end

  def workspace_params
    {
      name: permited_params[:name],
      smoke_free: permited_params[:smoke_free] == '1'
    }
  end
end
