# serializers/document_serializer.rb
class DocumentSerializer < Panko::Serializer
  attributes :id, :pdf_url, :description, :document_data, :created_at
end
