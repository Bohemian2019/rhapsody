require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe 'Item new page' do
    context 'Item new page rendered correctly' do
      before do
        get :new
      end
      it 'HTTP request => 200 OK' do
        expect(response.status).to eq 200
      end
    end
  end
end

