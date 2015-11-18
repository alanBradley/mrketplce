class ProfilesController < ApplicationController
	require 'ReportLogger'
	# 		  rails :devise
	before_action :authenticate_user!
	before_action :only_current_user
	
	def new
		# form where a user can fill out their own profile.
		@user = User.find(params[:user_id])
		@profile = Profile.new
	end

	def create
		@user = User.find(params[:user_id])
		@profile = @user.build_profile(profile_params)

		# Report Logger Gem tool to log any amount of params required.
		@reportEvent = ::ReportLogger.new("ProfileCreateLogger.txt")
    @reportEvent.report(profile_params[:name],profile_params[:phone_numer],profile_params[:bio],profile_params[:updated_at])


		if @profile.save
			flash[:success] = "Profile Updated"
			redirect_to user_path(params[:user_id])
		else
			render action: :new
		end
	end

	def edit
		@user = User.find(params[:user_id])
		@profile = @user.profile
	end

	def update
		@user = User.find(params[:user_id])
		@profile = @user.profile

		@reportEvent = ::ReportLogger.new("ProfileCreateLogger.txt")
    @reportEvent.report(profile_params[:name],profile_params[:phone_numer],profile_params[:bio],profile_params[:updated_at])

		if @profile.update_attributes(profile_params)
			flash[:success] = "Profile Updated!"
			redirect_to user_path(params[:user_id])
		else
			render action: :edit
		end
	end


	private

	def profile_params
		params.require(:profile).permit(:name, :phone_number, :image, :bio)
	end

	def only_current_user
		@user = User.find(params[:user_id])
		redirect_to(root_url) unless @user == current_user
	end
end