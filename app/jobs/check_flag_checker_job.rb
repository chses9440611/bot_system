class CheckFlagCheckerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
	@user_uncheck = User.where(:book_flag => true)
	if @user_uncheck.count > 0
		@user_uncheck.each do |user|
			if user.check_flag and user.start_wait_time == nil
				user.start_wait_time = DateTime.now + 1.minutes
				user.save
			elsif !user.check_flag and DateTime.now > user.book_wait_time
				user.delete
			end
		end
	end
  end
end
