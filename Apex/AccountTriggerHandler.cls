public class AccountTriggerHandler extends TriggerHandler {
	
    protected override void beforeUpdate(){
        for(Sobject account : trigger.new){
            Account subAccount = (Account)account;
            subAccount.Name = subAccount.Name + 'beforeInsert';
        }
    }
    protected override void afterInsert(){
        List<Contact> contacts = new List <Contact>();

    	for(Sobject account : trigger.new){
			Account acc = (Account)account;
        	Contact contact = new Contact(LastName = acc.name, AccountId=acc.id);
        	contacts.add(contact);
    	}
    	insert contacts; 
    }
    protected override void afterUpdate(){
        List<Account> contactsAccount = [SELECT Name, (SELECT FirstName FROM Contacts) FROM Account WHERE Id IN :Trigger.new];
		List<Contact> updatesContacts = new List<Contact>();
		for(Account account : contactsAccount){
			List<Contact> contacts = account.Contacts;
			for(Integer i = 0; i < contacts.Size(); i++){
				if(account.Name != contacts[i].FirstName){
					contacts[i].FirstName = account.Name;
					updatesContacts.add(contacts[i]);
				}
			}
		}
		update updatesContacts;
    }
        
        
    	 
}

