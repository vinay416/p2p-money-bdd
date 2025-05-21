Feature: Transaction history

    Background:
        Given The app is running and Fetch API called

    Scenario: Fetch Transaction history (Default All)
        Given Showing loader while fetch
        Then I see list of {"Sent/Received"} Transactions

    Scenario: Paginate Transaction history (Default All)
        Given Showing List of Transactions
        When I scroll to end of list
        And Showing loader while fetch
        Then I see more Transactions  

    Scenario: Changed the Filter to Sent
        Given Showing List of Transactions
        When I tap {Icons.filter_alt} icon
        And I tap {"sent"} text
        Then I see list of {"Sent"} Transactions

    Scenario: Changed the Filter to Received
        Given Showing List of Transactions 
        When I tap {Icons.filter_alt} icon
        And I tap {"received"} text
        Then I see list of {"Received"} Transactions  

    Scenario: Changed the Filter to All
        Given Showing List of Transactions 
        When I tap {Icons.filter_alt} icon
        And I tap {"all"} text
        Then I see list of {"Sent/Received"} Transactions 

    # Scenario: Selected Filter is Sent
    #     Given Fetch Transaction history
    #     Given Sent Filter is Applied
    #     And Showing loader while fetch
    #     Then I see list of {"Sent"} Transactions
