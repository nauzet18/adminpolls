class Poll < ActiveRecord::Base
  has_many :groups, :dependent => :destroy

  validates :name, presence: true
end
