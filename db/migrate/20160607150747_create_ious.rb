class CreateIous < ActiveRecord::Migration
  def change
    create_table :ious do |t|
      t.string :title
      t.decimal :amount
      t.string :name
      t.string :contact

      t.timestamps null: false
    end
  end
end
