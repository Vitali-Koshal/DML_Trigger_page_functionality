trigger CreateAccountTrigger on Account (before insert, after insert) {
    // make some changes before records are created
    if (trigger.isBefore) {
        CreateAccountTriggerHandler.addTypeFieldValue(Trigger.new);
    }
    //make some updates after records are inserted
    if (trigger.isAfter) {
        CreateAccountTriggerHandler.updatePhoneFieldValue(Trigger.new);
        CreateAccountTriggerHandler.addContactToAccount(Trigger.new);
    }
    
}