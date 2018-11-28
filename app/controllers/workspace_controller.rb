class WorkspacesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @workspaces = Workspace.find_all { |e| e.user_id == params[:id] }
  end

  def all
    @workspaces = Workspace.all
  end

  def new
    @workspace = Workspace.new
  end

  def create
    debugger
  end
end
