/**
 * @author: Alessandro Porfírio
 */

public class InactiveAccountsBatch implements Database.Batchable<SObject> {
    
    public Database.QueryLocator start(Database.BatchableContext context){

      return Database.getQueryLocator([
        SELECT Id,
            (SELECT Id, StageName, CloseDate FROM Opportunities 
                WHERE CloseDate = LAST_N_DAYS:120 OR StageName = 'Negotiation/Review'), 
            (SELECT Id, ActivityDate FROM Tasks
                WHERE ActivityDate = LAST_N_DAYS:90)
         FROM Account
      ]);

    }

    public void execute(Database.BatchableContext context, List<Account> records){

        List<Account> accountsToUpdate = new List<Account>();

        for(Account account : records) {

            if(account.Opportunities.isEmpty() && account.Tasks.isEmpty()) {
                account.Inativa__c = true;
            }

            accountsToUpdate.add(account);
        }

        update accountsToUpdate;

    }

    public void finish(Database.BatchableContext context){
    }

}
