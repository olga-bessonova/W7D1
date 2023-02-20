class User < ApplicationRecord
    validates :username, :password_digest, :session_token, presence: true
    validates :username, :session_token, uniqueness: true

    before_validation :ensure_session_token

    def ensure_session_token
        self.session_token ||= generate_unique_session_token
    end

    def generate_unique_session_token
        token = SecureRandom::urlsafe_base64
        while User.exists?(session_token: token)
            token = SecureRandom::urlsafe_base64
        end
        token
    end
end