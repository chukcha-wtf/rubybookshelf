# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  fullname        :string(255)
#  bio             :text
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
	has_secure_password

	validates :fullname,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  before_save { self.email = email.downcase }


  def as_json(options)
    super(except: [:password_digest, :updated_at, :created_at])
  end

end
