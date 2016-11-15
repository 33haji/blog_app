# == Schema Information
#
# Table name: blogs
#
#  id          :integer          not null, primary key
#  title       :text
#  body        :text
#  delete_flag :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Blog < ActiveRecord::Base
end
