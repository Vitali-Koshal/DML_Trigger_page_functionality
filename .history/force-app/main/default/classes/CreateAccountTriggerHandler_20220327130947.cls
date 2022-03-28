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
            //create new phone number
            String newPhone='+';
            for(Integer i=0;i<12;i++) {
                newPhone+=Integer.valueOf(Math.random()*10);
            }
            System.debug('New phone is '+newPhone);
            updatedAccountList[j].Phone=newPhone;
        }
        update updatedAccountList;
    }

    public static void addContactToAccount(List<Account> accounts) {
        List<Account> updatedAccountList=new List<Account>();
        List<Contact> contactForNewAccount = new List<Contact>();
        System.debug('Method addContactToAccount is working');
        for(Integer i=0;i<accounts.size();i++) {
            String contactName= '%Contact'+String.valueOf(i+1);
            Contact contact=[SELECT Name FROM Contact WHERE Name LIKE :contactName];
            System.debug(contact.Name);
            Account account=[SELECT Id FROM Account WHERE Id = :accounts[i].Id ];
            contact.AccountId=account.Id;
            contactForNewAccount.add(contact);
        }
        update contactForNewAccount;
    }

    public static void deleteAccount(List<Account> accs) {
        
    }
}
