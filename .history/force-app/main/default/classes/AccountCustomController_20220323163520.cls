public with sharing class AccountCustomController {
    public AccountCustomController() {

    }

    public List<Account> getAccounts() {
        List<Account> accounts = [SELECT Name, BillingCity, Type, Phone, Website FROM Account];
        return accounts;
    }

}
