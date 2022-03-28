public with sharing class AccountCustomController {
    public AccountCustomController() {

    }
    //variable to set qty of new Account
    private Integer newAccountQty=1;

    //variable to set Account name in format accountNameBaseValue + item number
    private String accountNameBaseValue;

    public Integer[] arrayNewAccountQty=new Integer[] {1,2,3,4,5,6,7,8,9,10};

    public Integer getNewAccountQty() {
        return newAccountQty;
    }
    public void setNewAccountQty(Integer newAccountQty) {
        this.newAccountQty=newAccountQty;
    }
    public String getAccountNameBaseValue() {
        return this.accountNameBaseValue;
    }
    public void setAccountNameBaseValue(String accountNameBaseValue) {
        this.accountNameBaseValue=accountNameBaseValue;
    }

    public List<Account> getAccounts() {
        List<Account> accounts = [SELECT Name, BillingCity, BillingCountry, Type, Phone, Website 
                                    FROM Account];
        return accounts;
    }

    public Integer[] getArrayNewAccountQty() {
        return this.arrayNewAccountQty;
    }
    public void setArrayNewAccountQty(Integer[] arrayNewAccountQty) {
        this.arrayNewAccountQty=arrayNewAccountQty;
    }

}
