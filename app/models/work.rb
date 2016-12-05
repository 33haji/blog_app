# == Schema Information
#
# Table name: works
#
#  id            :integer          not null, primary key
#  blog_id       :integer          default(0), not null
#  required_time :integer          default(0), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Work < ActiveRecord::Base
  belongs_to :blog, foreign_key: :blog_id
end
