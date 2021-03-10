require 'rails_helper'
require 'swagger_helper'

describe 'Routes', type: :routing do
    describe 'password routing' do
        it 'routes post forgot to forgot action' do
            expect(post: '/api/v1/password/forgot').to route_to(
            controller: 'api/v1/passwords',
            action: 'forgot'
            )
        end
    end
end
# Specs in this file have access to a helper object that includes
# the PasswordsHelper. For example:
# #
# describe PasswordsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
# RSpec.describe PasswordsHelper, type: :helper do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
