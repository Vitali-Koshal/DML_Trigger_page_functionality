public with sharing class AccountCustomController {
    public AccountCustomController() {

    }
    //variable to set qty of new Account
    private Integer newAccountQty=1;

    //variable to set Account name in format accountNameBaseValue + item number
    private String accountNameBaseValue;

    public List<SelectOption> getListNewAccountQty() {
        List<SelectOption> listNewAccountQty=new List<SelectOption>();
        for(Integer i=1;i<11;i++) {
            listNewAccountQty.add(new SelectOption(String.valueOf(i),String.valueOf(i));
        }
        return listNewAccountQty;
    }

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

    

}
