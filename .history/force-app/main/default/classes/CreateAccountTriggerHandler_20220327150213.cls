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
        System.debug('Phones were added');
        Account account1=new Account(Name=test);
        System.debug('New account added');
    }

    public static void addContactToAccount(List<Account> accounts) {
        List<Account> updatedAccountList=new List<Account>();
        List<Contact> contactForNewAccount = new List<Contact>();
        System.debug('Method addContactToAccount is working');
        for(Integer i=0;i<accounts.size();i++) {
            Contact contact= new Contact(FirstName='Firstname'+(i+1),LastName='Lastname'+(i+1) );
            Account account=[SELECT Id FROM Account WHERE Id = :accounts[i].Id ];
            System.debug('Account Id='+account.Id);
            contact.AccountId=account.Id;
            contactForNewAccount.add(contact);
            System.debug(contact.FirstName+' '+contact.AccountId);
        }
        insert contactForNewAccount;
        System.debug('Contacts were added');
    }

    //public static void deleteAccount(List<Account> accs) {
       
    //}
}
