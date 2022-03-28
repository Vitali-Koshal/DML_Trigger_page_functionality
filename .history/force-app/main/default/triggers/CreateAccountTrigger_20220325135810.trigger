trigger CreateAccountTrigger on Account (before insert, after update) {
    // make some changes before records are created
    if (Trigger.isInsert) {
        for (Account accs:Trigger.new) {
            if (accs.Type=='Prospect') {
                
            }
        }
            CreateAccountTriggerHandler.addTypeFieldValue(Trigger.new);
        
        
    }
    //make some updates after records are inserted
    if (Trigger.isUpdate) {
        CreateAccountTriggerHandler.updatePhoneFieldValue(Trigger.old);
        CreateAccountTriggerHandler.addContactToAccount(Trigger.old);
        
    }
    
}