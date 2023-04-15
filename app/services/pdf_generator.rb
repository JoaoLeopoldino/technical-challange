require 'open-uri'

# services/pdf_generator.rb
class PdfGenerator
  def initialize(template, data)
    @template = template
    @data = data
  end

  def generate_pdf
    html = replace_placeholders_with_data(@template, @data)
    kit = PDFKit.new(html, page_size: 'Letter')

    pdf_file = Tempfile.new(['document', '.pdf'])
    pdf_file.binmode

    kit.to_file(pdf_file.path)
    upload_pdf_to_s3(pdf_file.path)
  ensure
    pdf_file.close
    pdf_file.unlink
  end

  private

  def replace_placeholders_with_data(template, document_data)
    template.gsub(/\{\{(\w+)\}\}/) do |match|
      key = match[2..-3].strip
      document_data[key] || ''
    end
  end

  def upload_pdf_to_s3(pdf_file_path)
    s3 = Aws::S3::Resource.new
    obj = s3.bucket(Figaro.env.s3_bucket_name).object(pdf_key)

    obj.upload_file(pdf_file_path, acl: 'public-read')
    obj.presigned_url(:get, expires_in: 3600)
  end

  def pdf_key
    "documents/#{SecureRandom.uuid}.pdf"
  end
end
