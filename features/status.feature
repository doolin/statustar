Feature: Users manipulate their status updates

  A signed on user needs to be able to update
  status indicators over time.
  
  Scenario Outline: User changes status
    Given user is logged in with "user@test.com/please"
    And the user's status is "<oldstatus>"
    When the user clicks "<newstatus>"
    Then the user's status changes to "<newstatus>"

  Scenarios: Changing status
    | oldstatus | newstatus |
    | busy      | maybe     |
    | busy      | open      |
    | maybe     | busy      |
    | maybe     | open      |
    | open      | busy      |
    | open      | maybe     |