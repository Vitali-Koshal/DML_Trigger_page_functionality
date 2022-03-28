public with sharing class AccountCustomController {
    public AccountCustomController() {

    }

    public List<Account> getAccounts() {
        List<Account> accounts = [SELECT Name, BillingAddress, Type, Phone, Website FROM Account];
    }

}
