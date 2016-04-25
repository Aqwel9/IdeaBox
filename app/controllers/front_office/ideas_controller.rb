module FrontOffice
    class IdeasController < FrontOfficeController

        before_action :set_user, only: [:show, :update, :edit]

        def index
            @ideas = Idea.where(user_id: current_user.id)
        end

        def new
            @idea = Idea.new
            @idea.idea_components.build
        end

        def show
        end

        def create
            @idea = Idea.new(permitted_params)
            @idea.user_id = current_user.id

            if @idea.save
                redirect_to root_path
            else
                redirect_to new_fo_idea_path
            end
        end

        def edit
        end

        def update
            if @idea.update(permitted_params)
                redirect_to fo_ideas_path
            else
                redirect_to edit_fo_idea_path
            end
        end

        private

        def set_user
            @idea = Idea.find(params[:id])
        end

        def permitted_params
            params.require(:idea).permit(:title, :description, :background, :visibility, :user_id, idea_components_attributes: [ :id, :title, :description, :background, :_destroy ])
        end


    end
end
