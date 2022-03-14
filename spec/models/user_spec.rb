require 'rails_helper'

RSpec.describe User, type: :model do
describe 'Validations' do
    before(:each) do
      @user = User.new
      @user.name = 'a name-a'
      @user.email = 'test@test.ca';
      @user.password = 'password!';
      @user.password_confirmation = 'password!';
    end

    context 'add user to db with no name' do
      it 'return error about name' do
        @user.name = nil
        @user.save

        expect(@user.errors.full_messages).to include('Name can\'t be blank')
      end
    end

  end
end
