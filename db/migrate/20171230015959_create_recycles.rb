class CreateRecycles < ActiveRecord::Migration
  def change
    create_table :recycles do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :job_position
      t.string :city
      t.date :can_start
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
