public class ExceptionDemo {
   public static void dmlExceptionDemo()
   {
       Lead[] accList = new List<Lead> ();
       
       try
       {
           Lead acc1 = new Lead(FirstName ='Test', LastName ='Excep');
           accList.add(acc1);
           Lead acc2 = new Lead();
           accList.add(acc2);
           Lead acc3 = new Lead();
           accList.add(acc3);
           insert accList;
       }
       catch(DMLException dl)
       {
           integer index = dl.getNumDML();
           for(integer i =0;i<index;i++)
           {
               system.debug('Field Name '+dl.getDMLFieldNames(i));
                system.debug('Message '+dl.getDMLMessage(i));
                system.debug('Field Id '+dl.getDMLId(i));
           }
       }
   }
}