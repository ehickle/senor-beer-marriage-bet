class EditUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :password_hash
      t.remove :relationship_status
      t.remove :bio
    end
  end
end
