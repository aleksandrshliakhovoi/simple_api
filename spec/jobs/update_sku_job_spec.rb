require 'rails_helper'

RSpec.describe UpdateSkuJob, type: :job do
  let(:book_name) { 'ruby book' }

  it 'calls SKU service with correct params' do
    allow(Net::HTTP).to receive(:start).and_return(true)
    expect_any_instance_of(Net::HTTP::Post).to receive(:body=).with(
      { sku: '123', name: book_name}.to_json
    )

    described_class.perform_now('ruby book')
  end
end
