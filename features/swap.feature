Feature: Confswap should swap template variables
  Background:
    Given a file named "/tmp/confswap/test.conf" with:
    """
    # This is a test config
    # that has some variables in it
    %{TEST}
    """
    And I set the environment variables to:
      | variable       | value    |
      | TEST           | giblets  |

  Scenario: Test config file with placeholders rename standard
    When I run `confswap /tmp/confswap/test.conf`
    Then the file "/tmp/confswap/test.conf.out" should contain:
    """
    giblets
    """
  Scenario: Test config file specifying the output
    When I run `confswap --output=/tmp/confswap/different.conf /tmp/confswap/test.conf`
    Then a file named "/tmp/confswap/different.conf" should exist
    And the file "/tmp/confswap/different.conf" should contain:
    """
    giblets
    """

