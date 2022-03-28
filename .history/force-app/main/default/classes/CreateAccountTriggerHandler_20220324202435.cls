public with sharing class CreateAccountTriggerHandler {
    public CreateAccountTriggerHandler() {

    }
    public static void addTypeFieldValue(List<Account> accounts) {
        for(Account accs : accounts) {
            accs.Type='Prospect';
        }
    }
    
    public static void updatePhoneFieldValue(List<Account> accounts) {
        for(Account accs : accounts) {
            String newPhone='+';
            for(Integer i=0;i<12;i++) {
                newPhone+=Integer.valueOf(Math.random()*10);
            }
            accs.Phone=newPhone;
        }
        
    }
}
