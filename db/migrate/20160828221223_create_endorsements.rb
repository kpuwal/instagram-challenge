class CreateEndorsements < ActiveRecord::Migration
  def change
    create_table :endorsements do |t|
      t.belongs_to :picture, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
