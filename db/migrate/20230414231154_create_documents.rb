class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents, id: :uuid do |t|
      t.text :description
      t.string :pdf_url
      t.json :document_data

      t.timestamps
    end
  end
end
