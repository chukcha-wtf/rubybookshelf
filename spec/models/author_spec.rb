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

require 'rails_helper'

RSpec.describe Author, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
