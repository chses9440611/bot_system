require 'mqtt'
class SendAwsDataJob < ApplicationJob
  queue_as :default
  def perform(a)
	# Do something later
	topic = 'mqtt/test'
	payload = {
		test: "Hi,IoT"
	}.to_json
	a = @client
	puts a.class
	@client.publish(topic, payload, retain=false, qos=1)
  end
end
