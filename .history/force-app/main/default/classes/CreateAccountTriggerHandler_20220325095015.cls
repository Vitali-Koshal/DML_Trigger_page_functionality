public with sharing class CreateAccountTriggerHandler {
    public CreateAccountTriggerHandler() {

    }
    public static void addTypeFieldValue(List<Account> accounts) {
        for(Account accs : accounts) {
            accs.Type='Prospect';
        }
    }
    
    public static void updatePhoneFieldValue(List<Account> accounts) {
        List<Account> updatedAccountList=new List<Account>();
        for(Integer j=0;j<accounts.size();j++) {
            updatedAccountList.add([SELECT Phone FROM Account WHERE Id = :accounts[j].Id ]);
            String newPhone='+';
            for(Integer i=0;i<12;i++) {
                newPhone+=Integer.valueOf(Math.random()*10);
            }
            System.debug('New phone is '+newPhone);
            updatedAccountList[j].Phone=newPhone;
        }
        update updatedAccountList;
    }
}
