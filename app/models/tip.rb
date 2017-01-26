# == Schema Information
#
# Table name: tips
#
#  id          :integer          not null, primary key
#  title       :text
#  detail      :text
#  type        :string
#  delete_flag :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Tip < ActiveRecord::Base
end
