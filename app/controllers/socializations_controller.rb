class SocializationsController < ApplicationController
    before_filter :load_socializable


    #FOLLOW

    def follow
        current_user.follow!(@socializable)
        #render json: { follow: true }
        redirect_to session.delete(:return_to)
    end

    def unfollow
        current_user.unfollow!(@socializable)
        #render json: { follow: false }
        redirect_to session.delete(:return_to)
    end

    def toggle_follow
        current_user.toggle_follow!(@socializable)
        #render json: { follow: current_user.follows?(@socializable) }
        redirect_to session.delete(:return_to)
    end

    #LIKE

    def like
        current_user.like!(@socializable)
        #render json: { follow: true }
        redirect_to session.delete(:return_to)
    end

    def unlike
        current_user.unlike!(@socializable)
        #render json: { follow: false }
        redirect_to session.delete(:return_to)
    end

    def toggle_like
        current_user.toggle_like!(@socializable)
        #render json: { follow: current_user.follows?(@socializable) }
        redirect_to session.delete(:return_to)
    end

    private

    def load_socializable
        session[:return_to] ||= request.referer
        @socializable =
        case
        when id = params[:idea_id] # Must be before :item_id, since it's nested under it.
            Idea.find(id)
        when id = params[:user_id]
            User.find(id)
        else
            raise ArgumentError, "Unsupported socializable model, params: " +
            params.keys.inspect
        end
        raise ActiveRecord::RecordNotFound unless @socializable
    end
end
