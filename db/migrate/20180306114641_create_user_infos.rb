class CreateUserInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_infos do |t|
      t.string :first_name
      t.string :last_name
      t.date :age
      t.string :client_ip
      t.float :latitude
      t.float :longitude
      t.string :gender
      t.string :country
      t.string :city
      t.string :facebook
      t.string :twitter
      t.string :github
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
