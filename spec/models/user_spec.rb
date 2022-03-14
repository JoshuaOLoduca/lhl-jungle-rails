require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new
    @user.name = 'full name'
    @user.email = 'test@test.ca'
    @user.password = 'password!'
    @user.password_confirmation = @user.password
  end
  describe 'Validations' do

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

      context 'add user to db with incorrect password confirmation' do
        it 'return error about password confirmation' do
          @user.password_confirmation = 'differentPassword'
          @user.save

          expect(@user.errors.full_messages).to include('Password confirmation doesn\'t match Password')
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

      context 'add user to db with an password below minimum length' do
        it 'return error about password being short' do
          @user.password = '12'
          @user.password_confirmation = @user.password
          
          @user.save

          expect(@user.errors.full_messages).to include('Password is too short (minimum is 3 characters)')
        end
      end

    end

  describe '.authenticate_with_credentials' do
    
    before(:each) do
      @user.save
    end

    context 'User log in is successful' do
      it 'should return user object' do
        user = User.authenticate_with_credentials @user.email, @user.password

        expect(user).to be_instance_of(User)
      end
    end
    
    context 'User adds trailing space to email' do
      it 'should return user object' do
        user = User.authenticate_with_credentials ' ' + @user.email + ' ', @user.password

        expect(user).to be_instance_of(User)
      end
    end
    
    context 'User adds different char case to email' do
      it 'should return user object' do
        user = User.authenticate_with_credentials @user.email.upcase, @user.password

        expect(user).to be_instance_of(User)
      end
    end
    
    context 'User inputs wrong email' do
      it 'should return nil' do
        user = User.authenticate_with_credentials 'tedMosby@HIMYM.com', @user.password

        expect(user).to eq(nil)
      end
    end
    
    context 'User inputs wrong password' do
      it 'should return nil' do
        user = User.authenticate_with_credentials @user.email, 'Password123'

        expect(user).to eq(nil)
      end
    end

  end
end
