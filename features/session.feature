Feature: Users log in to sessions.

  A member needs to log on and off for various reasons, such as editing current
  projects, and adding new projects. These features describe how the user
  manages his or her session.

  Scenario: User signs in successfully with email
    Given user is not logged in
    And user name is "foo" with email "user@test.com" and password "please"
    When I go to the sign in page
    And I sign in as "user@test.com/please"
    And I should be signed in
    Then I should see "updates"

  Scenario: Users signs out successfully
    Given user is logged in with "user@test.com/please"
    When user clicks "sign out" link
    Then user is signed out
    And taken to upsells page
