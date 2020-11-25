class AddPdfOnTestApi < ActiveRecord::Migration[6.0]
  def change
    add_column :test_apis, :pdf_url, :string
  end
end
