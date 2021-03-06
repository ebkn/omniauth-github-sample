class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :github_name, null: false
      t.string :name
      t.timestamps
    end
  end
end
