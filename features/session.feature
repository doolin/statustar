Feature: Users log in to sessions.

  A member needs to log on and off for various reasons, such as editing current
  projects, and adding new projects. These features describe how the user
  manages his or her session.

  Scenario: Member signs in successfully with email
    Given member is not logged in
    And member name is "foo" with email "user@test.com" and password "please"
    When I go to the sign in page
    And I sign in as "user@test.com/please"
    And I should be signed in
    Then I should see "My Projects"
