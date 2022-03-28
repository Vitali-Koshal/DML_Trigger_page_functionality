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
    if (trigger.isAfter && trigger.isInsert) {
        
        CreateAccountTriggerHandler.addContactToAccount(Trigger.new);
        CreateAccountTriggerHandler.updatePhoneFieldValue(Trigger.new);
    }
    
    if (trigger.isUpdate) {
        System.debug('Accounts ready to be deleted');
        List<Account> accountToDelete=[SELECT Id FROM Account WHERE Id IN :Trigger.old];
        delete accountToDelete;
        System.debug('Accounts were deleted.');
    }
}