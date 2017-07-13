class CreatePicks < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null:false
      t.string :password_hash
      t.string :relationship_status
      t.string :bio
    end
  end
end
