require 'mqtt'
class CreateConnectionJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
	@client = MQTT::Client.connect(
		host: "a3qqjuamu8nb6s.iot.ap-northeast-1.amazonaws.com",
		port: 8883,
		ssl: true,
		cert_file: "app/assets/identify/ameba.pem.crt",
		key_file: "app/assets/identify/ameba_private.pem.key",
		ca_file: "app/assets/identify/rootCA.pem"
	) 
  end
end
