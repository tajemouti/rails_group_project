require 'rails_helper'

RSpec.describe InventoriesController, type: :controller do
  context 'routes' do
    it { should route(:get, '/inventories').to(action: :index) }
    it { should route(:get, '/inventories/1').to(action: :show, id: 1) }
    it { should route(:post, '/inventories').to(action: :create) }
    it { should route(:get, '/inventories/new').to(action: :new) }
  end
end
