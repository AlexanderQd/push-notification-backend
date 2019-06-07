class NotificationsController < ApplicationController
  def notify
    Device.all.each do |device|
      n = Rpush::Gcm::App.new
      n.app = Rpush::Gcm::App.find_by(name: 'android_app')
      n.registration_ids = [device.id]

      n.notification = {
        body : "body",
        title: "title"
      }
      n.save!
    end
    Rpush.push

    render json: { sent: true }, status: :ok
  end
end
