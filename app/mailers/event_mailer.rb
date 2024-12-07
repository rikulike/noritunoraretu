class EventMailer < ApplicationMailer
  
  def send_notification(member, event, sender)
    @group= event[:group]
    @title= event[:title]
    @body= event[:body]
    @sender = sender
    
   
    mail(
      from: ENV['INFO_EMAIL'],
      to: member.email,
      subject: 'New Event Notice!!'
      )
      
  end 
  
  def self.send_notifications_to_group(event, sender)
    group = event[:group]
    group.young_users.each do |member|
    
      EventMailer.send_notification(member, event, sender).deliver_now
    end
  end
end
