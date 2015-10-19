class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|

      t.references :user, index: true, foreign_key: true
      t.string :name
      t.text :short_description
      t.text :description
      t.string :image_url
      t.string :status, default: "pending"
      t.decimal :goal, precision: 8, scale: 2
      t.datetime :expiration_date


      t.timestamps null: false
    end
  end
end

