class Message < ActiveRecord::Base

  Pusher.app_id = '14718'
  Pusher.key = 'ddd70c967388a617cfbe'
  Pusher.secret = '222fcc63720e279dbce1'

  after_create :send_to_pusher

  def send_to_pusher
    logger.info "Hi?"
    Pusher['chat'].trigger("message:create",self.to_json)  
  end

end
