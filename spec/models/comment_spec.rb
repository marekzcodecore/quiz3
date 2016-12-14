require 'rails_helper'

RSpec.describe Comment, type: :model do
 # pending "add some examples to (or delete) #{__FILE__}"
describe 'validations' do
	it 'requires a logged in user to create' do
		# given
		#let(:user) { FactoryGirl.create(:user) }
		 u = User.create first_name: 'bil', last_name: 'lib', email: 'a@b.c'
		# when
		#:post => '/comments'
		 visit "/ideas/"


		# expect
		response.should redirect_to('/comments#create')


	end

	it 'requires a logged in user to delete' do

	end	
  end

end
