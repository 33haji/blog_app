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
#  image       :string
#

class Blog < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
