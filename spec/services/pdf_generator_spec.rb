require 'rails_helper'

describe PdfGenerator do
  let(:template) { File.read('template.html') }
  let(:data) { { customer_name: 'John Doe', contract_value: '$5000' } }

  describe '#generate_pdf' do
    it 'returns a URL to the generated PDF' do
      pdf_generator = PdfGenerator.new(template, data)

      expect(pdf_generator.generate_pdf).to match(/https:\/\/[a-zA-Z0-9-]*\.s3\.amazonaws\.com\/documents\/[a-f0-9-]*\.pdf/)
    end
  end
end
