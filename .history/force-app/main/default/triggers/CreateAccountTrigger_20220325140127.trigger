trigger CreateAccountTrigger on Account (before insert, before update) {
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
        CreateAccountTriggerHandler.updatePhoneFieldValue(Trigger.new);
        CreateAccountTriggerHandler.addContactToAccount(Trigger.new);
        
    }
    
}