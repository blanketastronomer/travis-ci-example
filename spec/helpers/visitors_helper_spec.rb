require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the VisitorsHelper. For example:
#
# describe VisitorsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe VisitorsHelper, type: :helper do
  it 'should be false' do
    expect(false).to be_falsey
  end
end
