class UsersController < ApplicationController
before_action :authenticate_user!, only: [:secret]
before_action :my_profil?

	def show
		@user = User.find(params[:id])
		@events = Event.where(admin_id: @user.id)
	end

	private 

	def my_profil?
		@user = User.find(params[:id])
		if current_user == nil || @user.id != current_user.id
			redirect_to events_path
		end
	end
end
