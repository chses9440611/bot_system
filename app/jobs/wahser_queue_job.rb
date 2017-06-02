class WahserQueueJob < ApplicationJob
  queue_as :default

  def perform(*args)
	# Do something later
	num = 4#default num of washer machine
	puts "Hello"
	@user_on_use = User.where(:book_flag => true)

	puts @user_on_use.class
	n = @user_on_use.count
	if n < num and User.all.count > 0
		@user_unuse = User.where(:book_flag => false).take(4- @user_on_use.count())
		for user in @user_unuse
			user.book_flag = true
			user.book_wait_time = DateTime.now + 1.minutes 
			user.save
		end
	end
  end
end
