Feature: Confswap should swap template variables

  Scenario: Test config file with placeholders rename standard
    Given a file named "/tmp/confswap/test.conf" with:
    """
    # This is a test config
    # that has some variables in it
    %{TEST}
    """
    And I set the environment variables to:
      | variable       | value    |
      | TEST           | giblets  |
    When I run `confswap /tmp/confswap/test.conf`
    Then the file "/tmp/confswap/test.conf.out" should contain:
    """
    giblets
    """
