Feature: Confswap should replace variables in config template with environment variables
  Background:
    Given a file named "test.conf" with:
    """
    # This is a test config
    # that has some variables in it
    %{TEST}
    """
    And I set the environment variables to:
      | variable       | value    |
      | TEST           | giblets  |

  Scenario: Config file should be created with a default name and contain environment variables
    When I run `confswap test.conf`
    Then a file named "test.conf.out" should exist
    And the file "test.conf.out" should contain:
    """
    giblets
    """
  Scenario: Config file should be created with a specific name and contain environment variables
    When I run `confswap --output=named.conf test.conf`
    Then a file named "named.conf" should exist
    And the file "named.conf" should contain:
    """
    giblets
    """

