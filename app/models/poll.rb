class Poll < ActiveRecord::Base
  has_many :groups, :dependent => :destroy

  validates :name, presence: true

  accepts_nested_attributes_for :groups
end
