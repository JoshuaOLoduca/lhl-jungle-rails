require 'rails_helper'

RSpec.describe User, type: :model do
describe 'Validations' do
    before(:each) do
      @user = User.new
      @user.name = 'full name'
      @user.email = 'test@test.ca'
      @user.password = 'password!'
      @user.password_confirmation = @user.password
    end

    context 'add user to db with no name' do
      it 'return error about name' do
        @user.name = nil
        @user.save

        expect(@user.errors.full_messages).to include('Name can\'t be blank')
      end
    end

    context 'add user to db with no password' do
      it 'return error about password' do
        @user.password = nil
        @user.save

        expect(@user.errors.full_messages).to include('Password can\'t be blank')
      end
    end

    context 'add user to db with no password confirmation' do
      it 'return error about password confirmation' do
        @user.password_confirmation = nil
        @user.save

        expect(@user.errors.full_messages).to include('Password confirmation can\'t be blank')
      end
    end

    context 'add user to db with no email' do
      it 'return error about email' do
        @user.email = nil
        @user.save

        expect(@user.errors.full_messages).to include('Email can\'t be blank')
      end
    end

    context 'add user to db with an email in already in use' do
      it 'return error about email not being unique' do
        @user2 = User.new
        @user2.name = @user.name
        @user2.email = @user.email.upcase
        @user2.password = @user.password
        @user2.password_confirmation = @user2.password
        
        @user.save
        @user2.save

        expect(@user2.errors.full_messages).to include('Email has already been taken')
      end
    end

  end
end
