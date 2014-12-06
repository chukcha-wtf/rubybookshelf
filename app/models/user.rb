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
#  role            :integer          default(0)
#

class User < ActiveRecord::Base
	has_secure_password

  enum role: { guest: 0, user: 1, admin: 2 }

  ROLES = %w{guest user admin}

  ROLES.each do |r|
    define_method "is_a_#{r}?" do
      role == r
    end
  end

	validates :fullname,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates_presence_of :password, on: :create

  before_save { self.email = email.downcase }

  has_many :books
  has_many :authors

  def as_json(options)
    super(except: [:password_digest, :updated_at], methods: :book_ids)
  end

  def can_update?(record)
    if is_a_admin?
      true
    elsif is_a_user?
      record.class.to_s == 'User' ? record == self : record.user == self
    else
      false
    end
  end

end
