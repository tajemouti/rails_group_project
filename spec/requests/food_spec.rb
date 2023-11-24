require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  context 'routes' do
    it { should route(:get, '/foods/1').to(action: :show, id: 1) }
    it { should route(:post, '/foods').to(action: :create) }
    it { should route(:get, '/foods/new').to(action: :new) }
  end
end
