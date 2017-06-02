class FinishJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
	@user_finish = User.where(:start_flag=>true)
	if @user_finish.count > 0
		@user_finish.each do |user|
			if user.end_time != nil and user.end_time < DateTime.now
				user.delete
			end
		end
	end
  end
end
