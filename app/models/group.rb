class Group < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  belongs_to :poll

  validates :name, :poll, presence: true

  accepts_nested_attributes_for :questions, :reject_if => :all_blank, :allow_destroy => true
end
