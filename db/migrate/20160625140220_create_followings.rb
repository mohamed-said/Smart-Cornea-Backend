class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.string :name
      t.belongs_to :domain
      t.attachment :avatar
      t.timestamps null: false
    end
  end
end
