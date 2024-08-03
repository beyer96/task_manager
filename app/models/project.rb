# == Schema Information
#
# Table name: projects
#
#  id         :bigint           not null, primary key
#  position   :integer          not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Project < ApplicationRecord
end
