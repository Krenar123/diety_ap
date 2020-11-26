class CreateStatusApis < ActiveRecord::Migration[6.0]
  def change
    create_table :status_apis do |t|
      t.string :request_id
      t.string :status
      t.string :name
      t.string :email
      t.string :profile_link

      t.timestamps
    end
  end
end
