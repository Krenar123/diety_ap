class AddOther < ActiveRecord::Migration[6.0]
  def change
    add_column :test_apis, :name, :string
    add_column :test_apis, :email_address, :string
  end
end
