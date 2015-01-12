Feature: Confswap should read template variables from a properties file
  Scenario: Fill in a configuration file with variables from a properties file
    
    Given a file named "config_template_for_properties.conf" with:
      """
      I like %{VAR1}
      but I really don't like %{VAR2}
      # I can handle comments
      and finally %{VAR3}
      """
    And a file named "sample.properties" with:
      """
      # This is a test config
      # that has some variables in it
      # some comments, and some new lines
      VAR1: Giblets
      VAR2: Not so giblets

      # This is a descriptive comment
      VAR3: so many giblets
      """
    When I run `confmake -p sample.properties -t config_template_for_properties.conf sample.conf`
    Then a file named "sample.conf" should exist
    And the file "sample.conf" should contain:
    """
    I like Giblets
    """
