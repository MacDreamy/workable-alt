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
  end
end
