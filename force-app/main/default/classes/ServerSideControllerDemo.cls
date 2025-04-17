public with sharing class ServerSideControllerDemo {
	@AuraEnabled
 public static String serverEcho (String firstname) 
 {
  return('Hello from the server '+ firstname); 
 }
}