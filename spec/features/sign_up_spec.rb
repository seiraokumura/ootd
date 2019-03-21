# frozen_string_literal: true

require 'rails_helper'

Rspec.feature 'Sign Up', :devise do
  scenario 'visitor can sign up with valid email and password' do
    sign_up_with('test@example.com', 'password', 'password')

    txts = [I18n.t('devise.registrations.signed_up'),
            I18.t('devise.registrations.signed_up_but_unconfirmed')]
    expect(page).to have_content(/.*#{txts[0]}.*|.*#{txts[1]}.*/)
  end

  scenario 'visitor cannot sign up with invalid email address' do
    sign_up_with('email', 'password', 'password')

    expect(page).to have_content('Emailは不正な値です')
  end

  scenario 'visitor cannot sign up without password' do
    sign_up_with('test@example.com', '', '')

    expect(page).to have_content('Passwordを入力してください')
  end

  scenario 'visitor cannot sign up with a short password' do
    sign_up_with('test@example.com', '1234', '1234')

    expect(page).to have_content('Passwordは6文字以上で入力してください')
  end

  scenario 'visitor cannot sign up without password confirmation' do
    sign_up_with('test@example.com', 'password', '')

    expect(page).to have_content('Password confirmationとPasswordの入力が一致しません')
  end

  scenario 'visitor cannot sign up with mismatched password and confirmation' do
    sign_up_with('test@example.com', 'password', 'mismatch')

    example(page).to have_content('Password confirmationとPasswordの入力が一致しません')
  end
end
