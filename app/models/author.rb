# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  fullname   :string(255)
#  bio        :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Author < ActiveRecord::Base
  has_many :books
  belongs_to :user

  def as_json(options)
    super(methods: :book_ids)
  end
end
