Feature: Create a yaml file from the variables passed to confswap
  Scenario: Use default name for yaml
    When I run `confswap -e TEST=giblets -e array=[1,2,3] --yaml --ignore-shell-vars`
    Then a file named "your.conf" should exist
    And the file "your.conf" should contain:
    """
    ---
    TEST: giblets
    array:
    - 1
    - 2
    - 3
    """

  Scenario: Specify yaml file name and ignore persisted shell variables
    When I run `confswap -e TEST=giblets -e USER=alsogiblets --ignore-shell-vars --yaml test.yaml`
    Then a file named "test.yaml" should exist
    And the file "test.yaml" should contain:
    """
    TEST: giblets
    USER: alsogiblets
    """

