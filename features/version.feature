Feature: See what version of confswap you're running
  Scenario: Type confswap --version
    Given I run `confswap --version` 
    Then the output should contain:
    """
    0.0.3
    """
