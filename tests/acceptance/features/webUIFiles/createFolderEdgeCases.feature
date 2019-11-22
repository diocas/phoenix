Feature: create folder
  As a user
  I want to create folders
  So that I can organise my data structure

  Background:
    Given user "user1" has been created with default attributes
    And user "user1" has logged in using the webUI
    And the user has browsed to the files page

  Scenario Outline: Create a folder using special characters
    When the user creates a folder with the name <folder_name> using the webUI
    Then folder <folder_name> should be listed on the webUI
    When the user reloads the current page of the webUI
    Then folder <folder_name> should be listed on the webUI
    Examples:
      | folder_name              |
      | 'सिमप्ले फोल्देर $%#?&@' |
      | '"somequotes1"'          |
      | "'somequotes2'"          |
      | "\"quote\"d-folders'"    |
      | "^#29][29@({"            |
      | "+-{$(882)"              |
      | "home"                   |

  @issue-2467
  Scenario Outline: Create a sub-folder inside a folder with problematic name
    # First try and create a folder with problematic name
    # Then try and create a sub-folder inside the folder with problematic name
    When the user creates a folder with the name <folder> using the webUI
    And the user opens folder <folder> using the webUI
    Then there should be no files/folders listed on the webUI
    When the user creates a folder with the name "sub-folder" using the webUI
    Then folder "sub-folder" should be listed on the webUI
    When the user reloads the current page of the webUI
    Then folder "sub-folder" should be listed on the webUI
    And as "user1" folder "sub-folder" should exist inside folder <folder>
    Examples:
      | folder    |
     #| "?&%0"    |
      | "^#2929@" |
      | "home"    |

  @smokeTest
  Scenario Outline: Create a sub-folder inside an existing folder with problematic name
    # Use an existing folder with problematic name to create a sub-folder
    # Uses the folder created by skeleton
    When the user opens folder <folder> using the webUI
    And the user creates a folder with the name "sub-folder" using the webUI
    Then folder "sub-folder" should be listed on the webUI
    When the user reloads the current page of the webUI
    Then folder "sub-folder" should be listed on the webUI
    And as "user1" folder "sub-folder" should exist inside folder <folder>
    Examples:
      | folder                  |
      | "0"                     |
      | "'single'quotes"        |
      | "strängé नेपाली folder" |

  @issue-1883
  Scenario: Select breadcrumb inside folder with problematic name
    When the user creates a folder with the name "folder%2Fwith%2FSlashes" using the webUI
    And the user opens folder "folder%2Fwith%2FSlashes" using the webUI
    And the user browses to folder "folder%2Fwith%2FSlashes" using the breadcrumb on the webUI
    Then the error message "Loading folder failed…" should be displayed on the webUI
    # Then the error message should not be displayed on the webUI

  @issue-1883
  Scenario: Reload webUI inside the problamatic folder
    When the user creates a folder with the name "folder%2Fwith%2FSlashes" using the webUI
    And the user opens folder "folder%2Fwith%2FSlashes" using the webUI
    And the user reloads the current page of the webUI
    Then the error message "Loading folder failed…" should be displayed on the webUI
    # Then the error message should not be displayed on the webUI
