Feature: Add environment variables with command line
  Background: 
    Given a file named "test.conf" with:
      """
      # This is a test config
      # that has some variables in it
      %{TEST}
      %{USER}
      """
    And a file named "test.properties" with:
      """
      TEST: not giblets
      USER: not alsogiblets
      """
  Scenario: Single environment variable
    When I run `confmake -p test.properties -e TEST=giblets -t test.conf test.conf.out`
    Then a file named "test.conf.out" should exist
    And the file "test.conf.out" should contain:
    """
    giblets
    """

  Scenario: Multiple environment variable
    When I run `confmake -p test.properties -e TEST=giblets -e USER=alsogiblets -t test.conf test.conf.out`
    Then a file named "test.conf.out" should exist
    And the file "test.conf.out" should contain:
    """
    giblets
    alsogiblets
    """

