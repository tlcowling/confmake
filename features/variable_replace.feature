Feature: Confswap should replace variables in config template with environment variables
  Background:
    Given a file named "config.template" with:
    """
    # This is a test config
    # that has some variables in it
    %{TEST}
    """
    And I set the environment variables to:
      | variable       | value    |
      | TEST           | giblets  |

  Scenario: Config file should be created with a default name and contain environment variables
    When I run `confswap -t config.template config.template.out`
    Then a file named "config.template.out" should exist
    And the file "config.template.out" should contain:
    """
    giblets
    """
  Scenario: Force an overwrite of a config when a file already exists
    Given a file named "existing.conf" with:
    """
    # This is an exising config 
    """
    When I run `confswap -t config.template existing.conf`
    Then a file named "existing.conf" should exist

