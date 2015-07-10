class Group < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  belongs_to :poll
end
