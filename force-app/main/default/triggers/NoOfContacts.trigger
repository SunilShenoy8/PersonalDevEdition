trigger NoOfContacts on Account (after insert,after update) {

    NoOfLoactionClass.createContact(Trigger.New);
}