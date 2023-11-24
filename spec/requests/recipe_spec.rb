require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  context 'routes' do
    it { should route(:get, '/recipes').to(action: :index) }
    it { should route(:get, '/recipes/1').to(action: :show, id: 1) }
    it { should route(:post, '/recipes').to(action: :create) }
    it { should route(:get, '/recipes/new').to(action: :new) }
  end
end
