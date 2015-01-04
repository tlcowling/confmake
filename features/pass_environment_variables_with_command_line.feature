Feature: Add environment variables with command line
  Background: 
    Given a file named "test.conf" with:
      """
      # This is a test config
      # that has some variables in it
      %{TEST}
      """
  Scenario: Single environment variable
    When I run `confswap -e TEST=giblets test.conf`
    Then a file named "test.conf.out" should exist
    And the file "test.conf.out" should contain:
    """
    giblets
    """

  Scenario: Multiple environment variable
