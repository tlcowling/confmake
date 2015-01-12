Feature: See what version of confmake you're running
  Scenario: Type confmake --version
    Given I run `confmake --version` 
    Then the output should contain:
    """
    0.1.1
    """
