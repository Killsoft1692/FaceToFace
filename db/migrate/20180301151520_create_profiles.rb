class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :position
      t.float :exp_period
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
