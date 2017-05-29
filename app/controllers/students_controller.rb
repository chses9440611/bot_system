class StudentsController < ApplicationController
	before_action :find_student, only: [:show, :edit, :update, :destroy]
	def index
		@students = Student.all
	end

	def show
	end
	
	def new
		@student = Student.new()
	end

	def create
		@student = Student.new(student_params)
		respond_to do |format|
			if @student.save
				format.html { redirect_to @student, notice: 'Student #{@student.name} has been created'}
			else
				format.html { render :new}
			end
		end
	end

	def edit
	end

	def update
		respond_to do |format|
			if @student.update(student_params)
				format.html{ redirect_to @student, notice: "Student #{@student.name}'s data has been updated!"}
			else
				format.html { render :edit}
			end
		end
	end

	def destroy
		@student.destroy
		respond_to do |format|
			format.html {redirect_to students_url, notice: "Student data has been deleted!"}
		end
	end

	private
	def find_student
		@student = Student.find_by(params[:id])
	end

	def student_params
		params.require(:student).permit(:name, :student_id, :card_id, :email)
	end

end
