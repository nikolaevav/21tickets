class AddThreePhoneNumber < ActiveRecord::Migration
  def change
    add_column :settings, :phone_three, :string
  end
end
