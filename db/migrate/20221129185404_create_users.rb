class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name, array: true, default: []
      t.string :phone
      t.string :correct_name

      t.timestamps
    end
    add_index :users, :last_name, using: 'gin'
  end
end
