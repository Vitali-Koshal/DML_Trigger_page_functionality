public with sharing class CreateAccountTriggerHandler {
    public CreateAccountTriggerHandler() {

    }
    public static void addTypeFieldValue(List<Account> accounts) {
        for(Account accs : accounts) {
            accs.Type='Prospect';
        }
    } 
}
