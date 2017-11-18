# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name                  'Michael Hartl'
    email                 'mhartl@example.com'
    password              'foobar'
    password_confirmation 'foobar'
  end

  sequence :email do |n|
    "person-#{n}@example.com"
  end

  factory :status do
    state       1
    association :user
  end
end
