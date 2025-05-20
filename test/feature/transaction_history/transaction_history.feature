Feature: Transaction history

    Background:
        Given The app is running

    Scenario: Fetch Transaction history (Default All)
        Given Fetch API return history
        And Showing loader while fetch
        Then I see list of {"Sent/Received"} Transactions

    Scenario: Paginate Transaction history (Default All)
        Given Fetch API return history
        And Showing loader while fetch
        Then I see total {20} Transactions  

    Scenario: Changed the Filter to Sent
        Given Showing List of Transactions
        When I tap {"Filter"} text
        And I tap {"Sent"} text
        Then I see list of {"Sent"} Transactions

    Scenario: Changed the Filter to Received
        Given Showing List of Transactions 
        When I tap {"Filter"} text
        And I tap {"Received"} text
        Then I see list of {"Received"} Transactions  

    Scenario: Changed the Filter to All
        Given Showing List of Transactions 
        When I tap {"Filter"} text
        And I tap {"All"} text
        Then I see list of {"Sent/Received"} Transactions 

    # Scenario: Selected Filter is Sent
    #     Given Fetch Transaction history
    #     Given Sent Filter is Applied
    #     And Showing loader while fetch
    #     Then I see list of {"Sent"} Transactions
