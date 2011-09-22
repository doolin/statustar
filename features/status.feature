Feature: Users manipulate their status updates

  A signed on user needs to be able to update
  status indicators over time.
  
  Scenario Outline: User changes status
    Given user is logged in with "user@test.com/please"
    And the user's status is "<oldstatus>"
    When the user clicks "<newstatus>"
    And presses "Create Status"
    #Then show me the page
    Then the user's status changes to "<newstatus>"
    #Then show me the page

  Scenarios: Changing status
    | oldstatus | newstatus |
    | Busy      | Maybe     |
    | Busy      | Open      |
    | Maybe     | Busy      |
    | Maybe     | Open      |
    | Open      | Busy      |
    | Open      | Maybe     |