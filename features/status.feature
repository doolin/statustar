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

    #@wip
    Examples: Changing status
      | oldstatus | newstatus |
      | Busy      | Maybe     |
      #| Busy      | Open      |
      #| Maybe     | Busy      |
      #| Maybe     | Open      |
      #| Open      | Busy      |
      #| Open      | Maybe     |

  Scenario: Updating statuses
    Given user is logged in with "user@test.com/please"
    And the user is on the home page
    When the user updates status
    Then the updated status should be displayed

  # Delete but not modify
  Scenario: Displaying status
    Given user is logged in with "user@test.com/please"
    Then the user must not be able to delete existing statuses
