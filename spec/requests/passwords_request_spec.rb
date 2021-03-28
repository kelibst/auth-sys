require 'rails_helper'



RSpec.describe "Passwords", type: :routing do
    it 'routes post forgot to forgot action' do
        expect(post: 'api/v1/password/forgot').to route_to(
          controller: 'api/v1/passwords',
          action: 'forgot'
        )
    end

      it 'routes post reset to reset action' do
        expect(post: 'api/v1/password/reset').to route_to(
          controller: 'api/v1/passwords',
          action: 'reset'
        )
    end 
end
