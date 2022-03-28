trigger CreateAccountTrigger on Account (before insert) {
    CreateAccountTriggerHandler.addTypeFieldValue(Trigger.new);
}