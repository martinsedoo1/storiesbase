class User < ApplicationRecord
    has_secure_password
    validates_presence_of :name , :email , :password_digest
    validates :email , uniqueness: true
    validates :email, length: { in: 4..100 }
    validates :email, presence: true
    has_many :stories
    has_many :comments

      def generate_password_token!
        self.reset_password_token = generate_token
        self.reset_password_sent_at = Time.now.utc
        save!
      end

      def password_token_valid?
        (self.reset_password_sent_at + 2.hours) > Time.now.utc
      end

      def reset_password!(password)
        self.reset_password_token = nil
        self.password = password
        save!
      end

      private

      def generate_token
        SecureRandom.hex(10)
      end

end
