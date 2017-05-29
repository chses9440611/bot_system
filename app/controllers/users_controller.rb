class UsersController < ApplicationController
	before_action :find_user, only:[:show, :destroy]
	
	def index
		@users = User.all
	end

	def show
	end

	def new
		@user = User.new()
	end

	def create
		 student = Student.find_by(:student_id => user_params[:student_id])
		 if student != nil and student.name == user_params[:name]
			@user= User.new(user_params)
			respond_to do |format|
				if student.name != @user.name
					format.html { redirect_to users_path, notcie: "Book failed. Cause: Input Wrong Name"}
				end
		 	end
		 else
			if student == nil
				err_message = "Wrong Student ID, check the ID or you are not allowed to book here"
			elsif student.name != user_params[:name]
				err_message = "Book failed. Cause: Input Wrong Name"
			end

			respond_to do |format|
			 	format.html { redirect_to users_path, notice: err_message }
			end
		 end
	end

	def destroy
		@user.destroy
		respond_to do |format|
			format.html {redirect_to users_path, notice: 'Your booking has been cancelled!'}
		end
	end


	private
		def find_user
			@user = User.find(params[:id])
		end

		def user_params
			params.require(:user).permit(:name, :student_id)
		end

end
