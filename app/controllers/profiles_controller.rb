class ProfilesController < ApplicationController
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
		#@reportEvent = ::ReportLogger.new("ProfileCreateLogger.txt")
    #@reportEvent.report(profile_params[:name],profile_params[:phone_numer],profile_params[:bio],profile_params[:updated_at])


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

		##### Gem example working on Profile controller - update profile #####

    # if string from bio contains any keywords from the csv file then continue
    #if ProfanityChecker.isProfanity(profile_params[:bio]) then

    	#Can decide to report all params or set it to selected params only (must contain controller and action params for report)

    	#ReportLogger.usageLog(params[:controller], params[:action], profile_params[:name], profile_params[:bio])
    	
    	# report example two
    	#ReportLogger.usageLogFull(params)
    	
    	# if profanity checker comes back true it'll run the profanity swap or filter on the bio params
    	#ProfanityChecker.swapProfanity(profile_params[:bio])
    	# ProfanityChecker.filterProfanity(profile_params[:bio])
    #end

    ProfanityChecker.filterProfanity(profile_params[:bio])

    #@p = ::ProfanityReport.new
    #ProfanityReport.swapProfanity(profile_params[:bio])

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