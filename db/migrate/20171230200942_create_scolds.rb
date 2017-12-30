class CreateScolds < ActiveRecord::Migration
  def change
    create_table :scolds do |t|
      t.references :user, index: true, foreign_key: true
      t.references :recycle, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
