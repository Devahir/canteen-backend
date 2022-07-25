class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.string :role
      t.string :firstname
      t.string :lastname
      t.string :phone_no
      t.string :email
      t.string :img_url
      t.string :username
      t.string :password
      t.string :auth_token

      t.timestamps
    end
  end
end
