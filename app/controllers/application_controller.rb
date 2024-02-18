class ApplicationController < ActionController::Base
    include ApplicationHelper

    def favorite_test
    	return @favorite_exists ? "UnFavorite" : "Favorite"
    end

    helper_method :favorite_test


    before_action :update_last_seen_at, if: -> { user_signed_in? && (current_user.last_seen_at.nil? || current_user.last_seen_at < 1.minutes.ago )}

    def update_last_seen_at
    	logger.info "Update last seen at timestamp for user id #{current_user.id}"
    	current_user.update_attribute(:last_seen_at, Time.current)
    end


   		before_action :configure_permitted_parameters, if: :devise_controller?
	

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) { |user| user.permit(:first_name, :last_name, :username, :birthday, :email, :password, :remember_me)}
		devise_parameter_sanitizer.permit(:sign_in) { |user| user.permit(:email, :password, :remember_me)}
		devise_parameter_sanitizer.permit(:account_update) { |user| user.permit(:first_name, :last_name, :username, :birthday, :about, :email, :password, :current_password, :remember_me)}
	end 

end
