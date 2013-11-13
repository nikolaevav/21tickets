class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :name
      t.string :title
      t.text :description
      t.text :keywords
      t.string :email
      t.string :email_show
      t.string :phone_one
      t.string :phone_two
      t.text :metrika
      t.text :google
      t.text :vkgroup
      t.text :fbgroup

      t.timestamps
    end
  end
end
