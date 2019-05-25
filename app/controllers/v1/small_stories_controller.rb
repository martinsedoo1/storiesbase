class SmallStoriesController < ApplicationController
  before_action :set_small_story, only: [:show, :update, :destroy]

  # GET /small_stories
  def index
    @story = current_user.stories.find(params[:story_id])
    @small_stories = @story.small_stories
    render json: @small_stories
  end

  # GET /small_stories/1
  def show
    render json: @small_story
  end

  # POST /small_stories
  def create
    @small_story = SmallStory.new(small_story_params)

    if @small_story.save
      render json: @small_story, status: :created, location: @small_story
    else
      render json: @small_story.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /small_stories/1
  def update
    if @small_story.update(small_story_params)
      render json: @small_story
    else
      render json: @small_story.errors, status: :unprocessable_entity
    end
  end

  # DELETE /small_stories/1
  def destroy
    @small_story.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_small_story
      @small_story = SmallStory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def small_story_params
      params.require(:small_story).permit(:title, :description, :longitude, :latitude, :story_id)
    end
end
