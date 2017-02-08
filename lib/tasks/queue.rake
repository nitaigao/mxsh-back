namespace :queue do
  desc %[sets up the local sqs queue]
  task :create => :environment do
    puts "Creating 'default' queue"
    Aws::SQS::Client.new({
      region:            'abc',
      endpoint:          "http://localhost:4568",
      access_key_id:     "access key id",
      secret_access_key: "secret access key"
    }).create_queue({
      queue_name:        'default'
    })
    puts "done!"
  end
end
