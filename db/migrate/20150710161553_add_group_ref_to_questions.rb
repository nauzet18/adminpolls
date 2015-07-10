class AddGroupRefToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :group, index: true
    add_foreign_key :questions, :groups
  end
end
