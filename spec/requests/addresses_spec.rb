# spec/requests/addresses_spec.rb
require 'rails_helper'

RSpec.describe 'IP Address API', type: :request do
  # initialize test data
  let!(:addresses) { create_list(:address, 9) }
  let(:address_id) { addresses.first.id }

  # Test suite for GET /addresses
  describe 'GET /addresses' do
    # make HTTP get request before each example
    before { get '/addresses' }

    it 'returns addresses' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /addresses/:id
  describe 'GET /addresses/:id' do
    before { get "/addresses/#{address_id}" }

    context 'when the record exists' do
      it 'returns the address' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(address_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
    context 'when the record does not exist' do
      let(:address_id) { 100 }

       it 'returns status code 404' do
         expect(response).to have_http_status(404)
       end

       it 'returns a not found message' do
         expect(response.body).to match(/Couldn't find Address/)
       end
     end
   end

   # Test suite for POST /addresses
  describe 'POST /addresses' do
    # valid payload
    let(:valid_attributes) { { ip_address: '100.120.10.10' } }

    context 'when the request is valid' do
      before { post '/addresses', params: valid_attributes }

      it 'creates a address' do
        expect(json['ip_address']).to eq('100.120.10.10')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/addresses', params: { ip_address: '' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed/)
      end
    end
  end

  # Test suite for DELETE /addresses/:id
  describe 'DELETE /addresses/:id' do
    before { delete "/addresses/#{address_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end
