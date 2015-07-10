class AddPollRefToGroups < ActiveRecord::Migration
  def change
    add_reference :groups, :poll, index: true
    add_foreign_key :groups, :polls
  end
end
