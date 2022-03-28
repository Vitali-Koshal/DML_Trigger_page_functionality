trigger CreateAccountTrigger on Account (before insert, after insert) {
    // make some changes before records are created
    if (trigger.isBefore) {
        for (Account accs:Trigger.new) {
            if (accs.Type=='Prospect') {
                accs.addError('Prospect Type is not allowed');
            }
        }
        
            CreateAccountTriggerHandler.addTypeFieldValue(Trigger.new);
        
        
    }
    //make some updates after records are inserted
    if (trigger.isAfter) {
        
        CreateAccountTriggerHandler.addContactToAccount(Trigger.new);
        CreateAccountTriggerHandler.updatePhoneFieldValue(Trigger.new);
    }
    
}