require 'rails_helper'

RSpec.describe 'Servers API' do
  # Initialize the test data
  let!(:address) { create(:address) }
  let!(:servers) { create_list(:server, 20, address_ids: address.id) }
  let(:address_id) { address.id }
  let(:id) { servers.first.id }

  # Test suite for GET /addresses/:address_id/servers
  describe 'GET /addresses/:address_id/servers' do
    before { get "/addresses/#{address_id}/servers" }

    context 'when address exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all address items' do
        expect(json.size).to eq(20)
      end
    end

    context 'when address does not exist' do
      let(:address_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Address/)
      end
    end
  end

  # Test suite for GET /addresses/:address_id/servers/:id
  describe 'GET /addresses/:address_id/servers/:id' do
    before { get "/addresses/#{address_id}/servers/#{id}" }

    context 'when address server exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the server' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when address server does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Server/)
      end
    end
  end

  # Test suite for POST /addresses/:address_id/servers
  describe 'POST /addresses/:address_id/servers' do
    let(:valid_attributes) { { server_name: 'staging'} }

    context 'when request attributes are valid' do
      before { post "/addresses/#{address_id}/servers", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/addresses/#{address_id}/servers", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Server name can't be blank/)
      end
    end
  end

  # Test suite for DELETE /servers/:id
  describe 'DELETE /addresses/:id' do
    before { delete "/addresses/#{address_id}/servers/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end
