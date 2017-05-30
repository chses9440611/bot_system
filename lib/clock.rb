require 'clockwork'
require '../config/boot'
require '../config/environment'

module Clockwork
	handler do |job|
		puts "Running #{job}"
		"#{job}".constantize.perform_now
	end
	

	every(20.seconds, "WahserQueueJob")

end
