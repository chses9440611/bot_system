class StartFlagCheckerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
	@user_unstart = User.where(:book_flag => true, :check_flag => true)
	if @user_unstart.count > 0
		@user_unstart.each do |user|
			if user.start_flag and user.start_time == nil
				user.start_time = DateTime.now
				user.end_time = DateTime.now + 5.minutes
				user.save
			elsif !user.start_flag and DateTime.now > user.start_wait_time
				user.delete
			end
		end
	end
  end
end
