trigger CreateAccountTrigger on Account (before insert, after insert) {
    public virtual class BaseException extends Exception {}
    public class OtherException extends BaseException {}
    if (trigger.isBefore) {
        try {
            for (Account accs:Trigger.new) {
                if (accs.Type=='Prospect') {
                    throw new OtherException('Prospect Type is not allowed');
                    System.debug('Prospect is found');
                    new MyException(e,'Prospect Type is not allowed');
                    System.debug('Message is created');
                    //Exeption myEx = new Exeption('Prospect Type is not allowed');
                    
                }
            }
            CreateAccountTriggerHandler.addTypeFieldValue(Trigger.new);
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
    
}