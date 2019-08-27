require 'rails_helper'

describe Api::ServiceProvidersController do
  def response_from_json
    JSON.parse(response.body, symbolize_names: true)
  end

  describe '#index' do
    it 'returns active, approved SPs' do
      sp = create(:service_provider, active: true, approved: true)
      serialized_sp = ServiceProviderSerializer.new(sp).to_h

      get :index

      expect(response_from_json).to include serialized_sp
    end

    xit 'does not return un-approved SPs' do
      sp = create(:service_provider, active: true, approved: false)
      serialized_sp = ServiceProviderSerializer.new(sp).to_h

      get :index

      expect(response_from_json).to_not include serialized_sp
    end

    it 'includes non-active SPs' do
      sp = create(:service_provider, active: false, approved: true)
      serialized_sp = ServiceProviderSerializer.new(sp).to_h

      get :index

      expect(response_from_json).to include serialized_sp
    end
  end

  describe '#update' do
    context 'no user' do
      it 'requires authentication' do
        post :update

        expect(response).to redirect_to root_url
      end
    end

    context 'with user' do
      before do
        user = create(:user)
        sign_in(user)
      end

      it 'redirects to service_providers_path' do
        post :update

        expect(response).to redirect_to service_providers_path
      end
      context 'when ServiceProviderUpdater fails' do
        let(:error_response) { instance_double(HTTParty::Response, body: 'Error!', code: 404) }

        before do
          allow(::HTTParty).to receive(:post).and_return(error_response)
        end

        it 'redirects to service_providers_path' do
          post :update

          expect(response).to redirect_to service_providers_path
        end

        it 'notifies NewRelic of the error' do
          expect(::NewRelic::Agent).to receive(:notice_error)

          post :update
        end
      end
    end
  end
end
