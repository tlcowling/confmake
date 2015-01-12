Feature: Create a json file from the variables passed to confmake
  Scenario: Use default name for yaml
    When PENDING I run `confmake -e TEST=giblets -e array=[1,2,3] --json`
    Then PENDING a file named "your.conf" should exist
    And PENDING the file "your.conf" should contain:
    """
    "{"TEST":"giblets","array":[1,2,3]}"
    """
