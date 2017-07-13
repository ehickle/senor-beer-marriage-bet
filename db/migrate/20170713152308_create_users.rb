class CreateUsers < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.string :name
      t.integer :user_id
    end
  end
end
