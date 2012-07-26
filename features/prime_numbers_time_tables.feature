Feature: Prime numbers time tables
  In order to make an experiment
  As a math amateur
  I want to see the time tables of the first 10 prime numbers
  
  Scenario: find first 10 numbers
    Given the first 30 natural numbers
    When I search for the first 10 prime numbers
    Then I should get the numbers "2,3,5,7,11,13,17,19,23,29"
  
  Scenario Outline: generate time table for 10 numbers
    Given the number <number>
    When I generate the time table until <limit>
    Then I should get the time table "<time_table>"
    
    Examples:
      | number | time_table                           | limit |
      | 2      | 2,4,6,8,10,12,14,16,18,20            | 20    |
      | 3      | 3,6,9,12,15,18,21,24,27,30           | 30    |
      | 29     | 29,58,87,116,145,174,203,232,261,290 | 290   |

  Scenario: time table for the first 10 prime numbers
    Given I've generated the time table for the first 10 prime numbers
    When I look at the main page
    Then I should see all of their time tables
