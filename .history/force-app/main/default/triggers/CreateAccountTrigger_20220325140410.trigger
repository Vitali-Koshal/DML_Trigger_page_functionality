trigger CreateAccountTrigger on Account (before insert, after insert) {
    // make some changes before records are created
    if (trigger.isBefore) {
        for (Account accs:Trigger.new) {
            if (accs.Type=='Prospect') {
                
            }
        }
        try {
            CreateAccountTriggerHandler.addTypeFieldValue(Trigger.new);
        }
        
    }
    //make some updates after records are inserted
    if (trigger.isAfter) {
        
        CreateAccountTriggerHandler.addContactToAccount(Trigger.new);
        CreateAccountTriggerHandler.updatePhoneFieldValue(Trigger.new);
    }
    
}