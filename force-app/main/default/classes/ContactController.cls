public with sharing class ContactController {
	@AuraEnabled
    public static List<Contact> findAll(){
        return [select id, name, phone from Contact limit 50];
    }
    
    @AuraEnabled
    public static List<Contact> findByName(String searchKey){
        string name = '%'+searchKey+'%';
        return [select id, name, phone from Contact where name like: name limit 50];
    }
    
     @AuraEnabled
    public static Contact findById(String contactId){
        return [select id, name, phone,title, Account.Name from Contact where id =: contactId];
    }
}