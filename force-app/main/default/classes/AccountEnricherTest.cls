/**
 * @author: Alessandro Porfírio
 */

@isTest
public class AccountEnricherTest {
    
    @isTest
    public static void accountEnricherWithRelatedOpportunitiesTest() {

        Account accountOne = new Account(Name = 'Test 1');
        Account accountTwo = new Account(Name = 'Test 2');

        List<Account> accounts = new List<Account>{
            accountOne, accountTwo
        };

        AccountEnricher accountEnricer = new AccountEnricher();

        Test.startTest();
        accountEnricer.withRelatedOpportunities(accounts);
        Test.stopTest();

        List<Opportunity> opportunities = [SELECT Id, Name FROM Opportunity];

        Assert.areEqual(2, opportunities.size());

    }

    @isTest
    public static void accountEnricherWithRelatedTasksTest() {

        Account accountOne = new Account(Name = 'Test 1');
        Account accountTwo = new Account(Name = 'Test 2');

        List<Account> accounts = new List<Account>{
            accountOne, accountTwo
        };

        AccountEnricher accountEnricer = new AccountEnricher();

        Test.startTest();
        accountEnricer.withRelatedTasks(accounts);
        Test.stopTest();

        List<Task> tasks = [SELECT Id FROM Task];

        Assert.areEqual(2, tasks.size());

    }

}
