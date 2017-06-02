class UsersGetController < ApplicationController
	before_action :find_using_user, only: [:update]
	def index
		@users_using = User.where(:book_flag => true)
			
		render :json => @users_using.map { |user| user.as_json(only:[:student_id, :card_id, :book_flag])}
			
		
	end

	def update
		if params[:start_flag]
			@user.start_flag = true
		elsif params[:check_flag]
			@user.check_flag = true
		end
		if @user.save
			redirect_to users_path
		end
	end
	

	private

	def user_params
		params.require(:user).permit(:card_id)
	end

	def find_using_user
		@user = User.find_by(:student_id => params[:student_id])
	end

end
