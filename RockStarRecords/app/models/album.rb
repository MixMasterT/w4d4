# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer
#  title      :string
#  scene      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
  SCENES = ['live', 'studio', '']

  validates :band_id, :title, presence: true
  validates :scene, inclusion: SCENES

  belongs_to :band
  has_many :tracks, dependent: :destroy

end
