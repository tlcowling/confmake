Feature: Create a yaml file from the variables passed to confmake
  Scenario: Use default name for yaml
    When I run `confmake -e TEST=giblets -e array=[1,2,3] --yaml`
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
    When I run `confmake -e TEST=giblets -e USER=alsogiblets --yaml test.yaml`
    Then a file named "test.yaml" should exist
    And the file "test.yaml" should contain:
    """
    TEST: giblets
    USER: alsogiblets
    """

