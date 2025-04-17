public with sharing class ContactManager {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContact(){
        return [select id, lastname, phone from Contact limit 10];
    }
}