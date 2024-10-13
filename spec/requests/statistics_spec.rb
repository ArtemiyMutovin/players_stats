# require "rails_helper"
#
# describe "/animals/:animal_id/feed" do
#   let(:animal) { create(:animal, :unicorn) }
#
#   describe "POST" do
#     subject { post "/animals/#{animal.id}/feed", body:, as: :json }
#
#     let(:body) { {food: "apple", quantity: 3} }
#
#     it { is_expected.to conform_schema(200) }
#
#     context "with wrong food type" do
#       let(:body) { {food: "wood", quantity: 1} }
#
#       it { is_expected.to conform_schema(422) }
#     end
#   end
# end