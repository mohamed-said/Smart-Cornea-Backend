class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :name
      t.text :recognizer_state
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
