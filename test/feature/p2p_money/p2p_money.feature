Feature: P2P money transfer using phone no.

    Background:
        Given The app is running

    Scenario: The money transfered successfully
        Given I send {"500"} rupees to {"8477832908"}
        And I have sufficient balance
        When I tap {"Send"} text
        Then I see {"Money Sent"} text

    Scenario: The money transfered failed
        Given I send {"500"} rupees to {"8477832908"}
        And I have insufficient balance
        When I tap {"Send"} text
        Then I see {"Insufficient Balance"} text
    
    Scenario: The money server issue
        Given I send {"500"} rupees to {"8477832908"}
        And BE Server throws Error
        When I tap {"Send"} text
        Then I see {"Something went wrong"} text