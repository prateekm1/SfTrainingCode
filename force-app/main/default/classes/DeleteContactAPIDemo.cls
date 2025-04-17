@RestResource(urlMapping ='/deletecontactapi/')
global class DeleteContactAPIDemo {

    @httpDelete
    global static string deleteContact()
    {
        Map<string,string> paramMap = RestContext.request.params;
        string conId = paramMap.get('Id');
        List<Contact> conList = [Select Id from Contact where Id =: conId];
        if(!conList.isEmpty()){
            try{
                delete conList;
                return 'Contact Deleted';
            }
            catch(Exception e)
            {
                return e.getMessage();
            }
        }
        else
            return 'No record found';
    }
}