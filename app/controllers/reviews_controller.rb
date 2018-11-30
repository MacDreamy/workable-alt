class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :locate_workspace, only: [:index, :new, :create]

  before_action :locate_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.where(workspace_id: params[:workspace_id])
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.workspace = @workspace
    @review.save!

    redirect_to workspace_reviews_path(@workspace)
  end

  def edit
  end

  def update
    @review.update(review_params)

    redirect_to workspace_reviews_path(@review.workspace)
  end

  def destroy
    @review.destroy

    redirect_to workspace_reviews_path(@workspace)
  end

  private

  # TODO: Access control for edit, and destroy

  def permited_params
    params.require(:review).permit(:title, :detail, :rating, :photo)
  end

  def review_params
    {
      title: permited_params[:title],
      detail: permited_params[:detail],
      rating: permited_params[:rating].to_i,
      photo: permited_params[:photo]
    }
  end

  def locate_workspace
    @workspace = Workspace.find(params[:workspace_id])
  end

  def locate_review
    @review = Review.find(params[:id])
  end
end
