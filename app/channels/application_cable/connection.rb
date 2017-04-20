module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

# Exposing the Devise current_user method
    def connect
      self.current_user = find_verified_user
      logger.add_tags 'ActionCable', current_user.email
    end

    protected

# Is User authenticated by Devise?
    def find_verified_user
      if verified_user = env['warden'].user
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
