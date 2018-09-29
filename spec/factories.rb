# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username                  { 'Michael Hartl' }
    email                 { 'mhartl@example.com' }
    password              { 'foobar' }
    password_confirmation { 'foobar' }
  end

  sequence :username do
    "Foo van Bar #{('a'..'h').to_a.shuffle.join}"
  end

  sequence :email do |n|
    "person-#{n}@example.com"
  end

  factory :status do
    state       { 1 }
    association :user
  end
end
