class Question < ActiveRecord::Base
  has_many :answers, :dependent => :destroy
  belongs_to :group

  validates :name, :group, presence: true

  accepts_nested_attributes_for :answers, :reject_if => :all_blank, :allow_destroy => true
end
