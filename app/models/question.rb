class Question < ActiveRecord::Base
  has_many :answers, :dependent => :destroy, inverse_of: :question
  belongs_to :group

  default_scope { order('id') }

  validates :name, :group, presence: true

  accepts_nested_attributes_for :answers, :reject_if => :all_blank, :allow_destroy => true
end
