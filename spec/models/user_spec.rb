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

require 'rails_helper'

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
