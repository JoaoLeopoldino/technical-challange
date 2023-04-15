RSpec.describe 'Documents', type: :request do
  describe 'GET #list' do
    let!(:document1) { FactoryBot.create :document, description: 'Lorem ipsum dolor', document_data: {customer_name: 'Haroldo', contract_value: 140} }
    let!(:document2) { FactoryBot.create :document, description: 'Lorem ipsum dolor', document_data: {customer_name: 'Haroldo', contract_value: 140} }

    before { get '/api/v1/documents/list' }

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'returns a list of documents' do
      documents = JSON.parse(response.body)
      expect(documents.size).to eq(2)
      expect(documents.first['id']).to eq(document1.id)
      expect(documents.second['id']).to eq(document2.id)
    end
  end

  describe 'POST #create' do
    before do
      @url = '/api/v1/documents/create'
    end

    context 'when valid parameters are provided' do
      let(:document_data) { { customer_name: 'John Doe', contract_value: 'R$ 1,000.00' } }
      let(:params) do
        { document: { description: 'Example description', document_data: document_data },
          template: '<html><body><h1>Hello, {{customer_name}}!</h1><p>Your contract value is {{contract_value}}.</p></body></html>' }
      end

      it 'creates a new document and generates a PDF' do
        expect do
          post @url, params: params
        end.to change { Document.count }.by(1)

        document = Document.last
        expect(document.description).to eq('Example description')
        expect(document.document_data.deep_symbolize_keys).to eq(document_data)
        expect(document.pdf_url).to be_present
      end

      it 'returns a serialized document and a status of 201' do
        post @url, params: params
        expect(response).to have_http_status(:created)
        expect(response.body).to eq(DocumentSerializer.new.serialize_to_json(Document.last))
      end
    end

    context 'when invalid parameters are provided' do
      let(:params) { { document: { description: '', document_data: { customer_name: 'John Doe' } } } }

      it 'does not create a new document or generate a PDF' do
        expect do
          post @url, params: params
        end.not_to change { Document.count }

        expect(Document.last).to be_nil
      end

      it 'returns an error message and a status of 422' do
        post @url, params: params
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("Description can't be blank")
      end
    end
  end
end
