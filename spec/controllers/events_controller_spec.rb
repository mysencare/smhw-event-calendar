require 'rails_helper'

describe EventsController do
  render_views

  describe 'index' do
    before { get :index }

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'renders new Event form on an index page' do
      expect(response.body).to include('Add new event:')
    end
  end
end
