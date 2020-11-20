class AddAttToTest < ActiveRecord::Migration[6.0]
  def change
    add_column :test_apis, :request_id, :string
  end
end
