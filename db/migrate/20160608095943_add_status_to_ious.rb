class AddStatusToIous < ActiveRecord::Migration
  def change
    add_column :ious, :status, :string, :default => "created"
  end
end
