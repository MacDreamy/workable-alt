class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  before_action :locate_workspace, only: [:index, :new, :create]

  before_action :locate_review, only: [:edit, :update, :destroy]

  after_action :show_workspace_reviews, only: [:create, :update, :destroy]

  def index
    @reviews = Review.where(workspace_id: params[:workspace_id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.workspace = @workspace
    @review.save!
  end

  def edit
  end

  def update
    @review.update(permited_params)
  end

  def destroy
    @review.destroy
  end

  private

  # TODO: Access control for edit, and destroy

  def permited_params
    params.require(:review).permit(:title, :detail, :rating)
  end

  def locate_workspace
    @workspace = Workspace.find(params[:workspace_id])
  end

  def locate_review
    @review = Review.find(params[:id])
  end

  def show_workspace_reviews
    redirect_to workspace_reviews_path(@workspace)
  end
end
