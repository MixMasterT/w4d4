# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer
#  title      :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  STATI = ['regular', 'bonus']
  validates :title, presence: true
  validates :status, inclusion: STATI

  belongs_to :album

end
