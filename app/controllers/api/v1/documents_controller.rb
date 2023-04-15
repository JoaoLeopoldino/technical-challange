# controller/api/v1documents_controller.rb
class Api::V1::DocumentsController < ApplicationController
  def list
    @documents = Document.all
    render json: @documents, each_serializer: DocumentSerializer
  end

  def create
    @document = Document.new(document_params)

    if @document.save
      pdf_url = PdfGenerator.new(params[:template], @document.document_data).generate_pdf
      @document.update(pdf_url: pdf_url)
      render json: DocumentSerializer.new.serialize_to_json(@document), status: :created
    else
      render json: { errors: @document.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def document_params
    params.require(:document).permit(:description, document_data: {})
  end
end
