# == Schema Information
#
# Table name: films
#
#  id          :integer          not null, primary key
#  nom         :string
#  realisateur :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Film < ApplicationRecord
end
