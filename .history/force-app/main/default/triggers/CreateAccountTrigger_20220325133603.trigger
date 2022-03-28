trigger CreateAccountTrigger on Account (before insert, before update) {
    // make some changes before records are created
    if (Trigger.isBefore && Trigger.isInsert) {
        for (Account accs:Trigger.new) {
            if (accs.Type=='Prospect') {
                
            }
        }
            CreateAccountTriggerHandler.addTypeFieldValue(Trigger.new);
        
        
    }
    //make some updates after records are inserted
    if (Trigger.isBefore && Trigger.isUpdate) {
        
        CreateAccountTriggerHandler.addContactToAccount(Trigger.new);
        CreateAccountTriggerHandler.updatePhoneFieldValue(Trigger.new);
    }
    
}