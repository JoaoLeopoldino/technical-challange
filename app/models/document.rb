# models/document.rb
class Document < ApplicationRecord
  validates :description, presence: true
  validates :document_data, presence: true
end
