public with sharing class AccountCustomController {
    public AccountCustomController() {

    }
    private String accountNameBaseValue;
    public String getAccountNameBaseValue() {
        return accountNameBaseValue;
    }
    public void setAccountNameBaseValue(String accountNameBaseValue) {
        this.accountNameBaseValue=accountNameBaseValue;
    }

    public List<Account> getAccounts() {
        List<Account> accounts = [SELECT Name, BillingCity, BillingCountry, Type, Phone, Website 
                                    FROM Account];
        return accounts;
    }

}
