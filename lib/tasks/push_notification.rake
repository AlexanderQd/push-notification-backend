namespace :push_notification do
  desc 'generate a push notification'
  task import: :environment do
    Device.all.each do |device|
      n = Rpush::Gcm::Notification.new
      n.app = Rpush::Gcm::App.find_by_name("android_app")
      n.data = { message: "hi bitch " }
      n.registration_ids = [device.token]

      n.notification = {
        body: "body",
        title: "title"
      }
      n.save!
    end
    Rpush.push
  end
end
