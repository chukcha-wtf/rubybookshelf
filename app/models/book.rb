# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  author_id   :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Book < ActiveRecord::Base
  belongs_to :author
  belongs_to :user

  paginates_per 10

end
