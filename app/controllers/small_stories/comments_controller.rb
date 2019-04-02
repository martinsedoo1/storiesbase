class SmallStories::CommentsController < CommentsController
    before_action :set_commentable

    private

      def set_commentable
        @commentable = SmallStory.find(params[:small_story_id])
      end
end
