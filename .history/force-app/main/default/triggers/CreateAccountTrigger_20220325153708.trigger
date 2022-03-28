trigger CreateAccountTrigger on Account (before insert, after insert) {
    // make some changes before records are created
    if (trigger.isBefore) {
        try {
            for (Account accs:Trigger.new) {
                if (accs.Type=='Prospect') {
                   //ApexPages.addMessage('Prospect Type is not allowed');
                    Exeption myEx = new Exeption('Prospect Type is not allowed');
                    
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