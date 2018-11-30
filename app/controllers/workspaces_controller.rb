class WorkspacesController < ApplicationController
  skip_before_action :authenticate_user!, only: :all

  before_action :locate_user, only: [:index, :new, :create]

  before_action :locate_workspace, only: [:edit, :update, :show]

  after_action :show_workspace, only: [:create, :update, :destroy]

  def index
    @workspaces = Workspace.where(user_id: params[:user_id])
  end

  def all
    @workspaces = Workspace.all
  end

  def show
  end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.new(workspace_params)
    @workspace.user = @user
    @workspace.save!
  end

  def edit
  end

  def update
    @workspace.update(workspace_params)

    redirect_to workspace_path(@workspace)
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

  def locate_user
    @user = User.find(params[:user_id])
  end

  def locate_workspace
    @workspace = Workspace.find(params[:id])
  end

  def show_workspace
    redirect_to workspace_path(@workspace)
  end
end
