class RewardsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_project
	before_action :set_reward, except: [:new, :create]
	load_and_authorize_resource :through => :project

	def new
		@reward = @project.rewards.build
		respond_to do |format|
			format.html
		end
	end

	def edit
	end

	def create
		@reward = @project.rewards.build(reward_params)
		respond_to do |format|
			if @reward.save
				format.html { redirect_to @project, notice: "Reward was successfully created!"}
			else
				format.html { render :new }
			end
		end
	end

	def update
		respond_to do |format|
		   if @reward.update(reward_params)
		   	format.html { redirect_to @project, notice: "Reward was successfully updated!" }
		   else
		   	format.html { render :edit }
		   end
		end
	end

	def destroy
		@reward.destroy
		respond_to do |format|
			format.html { redirect_to projects_path, notice: "Reward was successfully destroyed!"}
		end
	end

	private

	def set_project
		@project = Project.friendly.find(params[:project_id])
	end	

	def set_reward
		@reward = @project.rewards.find(params[:id])
	end

	def reward_params
		params.require(:reward).permit(:name, :description, :value, :shipping, :number_available, :estimated_delivery)
	end

end

