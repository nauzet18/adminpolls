class Poll < ActiveRecord::Base
  has_many :groups, :dependent => :destroy, inverse_of: :poll

  default_scope { order('id') }

  validates :name, presence: true

  accepts_nested_attributes_for :groups, :reject_if => :all_blank, :allow_destroy => true
end
