class CreateTestApis < ActiveRecord::Migration[6.0]
  def change
    create_table :test_apis do |t|
      t.timestamps
    end
  end
end
