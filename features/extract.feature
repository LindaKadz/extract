Feature: Extract
As a user
I want to ensure my command can be run

Scenario: Commands can be run
    Given a file named "extract/bin/app.rb" with:
    """
    puts "Here is..."
    """
    When I cd to "extract/bin"
    And I run `ruby app.rb`
    Then the output should contain "Here"
    And the file "app.rb" should exist
