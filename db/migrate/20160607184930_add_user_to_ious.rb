class AddUserToIous < ActiveRecord::Migration
  def change
    add_reference :ious, :user, index: true, foreign_key: true
  end
end
