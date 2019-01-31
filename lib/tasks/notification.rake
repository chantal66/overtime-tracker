namespace :notification do
  desc "Sends SMS notification to employees asking them to log if they had overtime or not"
  task sms: :environment do
    # 1.- Schedule to run at Sunday at 5pm. => this will be done on Heroku
    # 2.- Iterate over all employees
    # 3.- Skip the Admin users
    # 4.- Send a message that has instructions and a link to log time
    # User.all.each do |user|
    #   SmsTool.send_sms()
    # end

    # number: "555-555-3323" twilio will not accept
    # number: "5555553323" yes so we need some validations
    # no spaces or dashes
    # exactly 10 characters
    # all characters have to be a number

  end

end
