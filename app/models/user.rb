class User < ApplicationRecord
  before_create :confirmation_token
    has_secure_password
  
    validates :username, uniqueness: true, presence: true, length: { in: 3..200 }
    validates :firstname, presence: true, length: { in: 2...200 }
    validates :lastname, presence: true, length: { in: 2...200 }
    validates :email, presence: true, uniqueness: true, email: true
  
    scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  
    def email_activate
      self.email_confirmed = true
      self.confirm_token = nil
      save!(:validate => false)
    end



    def generate_password_token!
      self.reset_password_token = generate_token
      self.reset_password_sent_at = Time.now.utc
      save!
    end

    def password_token_valid?
      (self.reset_password_sent_at + 4.hours) > Time.now.utc
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
     
    def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
  end
  