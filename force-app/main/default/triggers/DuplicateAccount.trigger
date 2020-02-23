trigger DuplicateAccount on Account (before insert) {
duplicateAccountClass.checkDuplicate(Trigger.new);
    
}