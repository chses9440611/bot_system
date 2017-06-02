require 'clockwork'
require './config/boot'
require './config/environment'

module Clockwork
	handler do |job|
		puts "Running #{job}"
		"#{job}".constantize.perform_now
		sleep 2
	end
	

	every(20.seconds, "WahserQueueJob")
	every(30.seconds, "CheckFlagCheckerJob")
	every(30.seconds, "StartFlagCheckerJob")
	every(60.seconds, "FinishJob")

end
