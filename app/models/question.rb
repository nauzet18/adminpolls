class Question < ActiveRecord::Base
  has_many :answers, :dependent => :destroy
  belongs_to :group

  validates :name, :group, presence: true
end
