class WahserQueueJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
	@user_on_use = User.where(:book_flag => true)
	if @user_on_use.count < 4
		@user_unuse = User.where(:book_flag => false).take(4-@userA_on_use.count)
		for user in @user_unuse
			user.book_flag = true
			user.save
		end
	end
  end
end
