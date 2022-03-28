trigger CreateAccountTrigger on Account (before insert, after insert, after update) {
    public virtual class BaseException extends Exception {}
    public class CheckingFieldException extends BaseException {}
    if (trigger.isBefore) {
        try {
            for (Account accs:Trigger.new) {
                if (accs.Type=='Prospect') {
                    System.debug('Prospect is found');
                    throw new CheckingFieldException('Prospect Type is not allowed');
                                      
                }
                System.debug('Done!!!');
                CreateAccountTriggerHandler.addTypeFieldValue(Trigger.new);
            }
        }
        catch (Exception e) {
            System.debug('There is an error'+e.getMessage());
        }
       
        
        
    }
    //make some updates after records are inserted
    if (trigger.isAfter) {
        
        CreateAccountTriggerHandler.addContactToAccount(Trigger.new);
        CreateAccountTriggerHandler.updatePhoneFieldValue(Trigger.new);
    }
    //Delete all accounts
    if (trigger.isUpdate) {
        CreateAccountTriggerHandler.deleteAccount(Trigger.new);
    }
}