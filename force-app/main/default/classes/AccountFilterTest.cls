/**
@author: Alessandro Porfírio
 */

@isTest
public class AccountFilterTest {

    @isTest
    public static void AccountFilterByChangedFieldTest(){

        Account accountOne = new Account(Name = 'Test 1');
        Account accountTwo = new Account(Name = 'Test 2');

        List<Account> newAccounts = new List<Account>{
            accountOne, accountTwo
        };

        insert newAccounts;

        Map<Id, Account> oldAccounts = new Map<Id, Account>();

        Account oldAccountOne = accountOne.clone(true);
        Account oldAccountTwo = accountTwo.clone(true);
        oldAccountTwo.Name = 'Test 3';

        oldAccounts.put(oldAccountOne.Id, oldAccountOne);
        oldAccounts.put(oldAccountTwo.Id, oldAccountTwo);

        AccountFilter accountFilter = new AccountFilter();

        Test.startTest();
        List<Account> filteredAccounts = accountFilter.byChangedField(
            newAccounts, oldAccounts, 'Name'
        );
        Test.stopTest();

        Assert.areEqual(1, filteredAccounts.size());
        Assert.areEqual('Test 2', filteredAccounts.get(0).Name);

    }

    @isTest
    public static void AccountFilterByFieldValueTest(){

        Account accountOne = new Account(Name = 'Test 1');
        Account accountTwo = new Account(Name = 'Test 2');

        List<Account> testAccounts = new List<Account>{
            accountOne, accountTwo
        };

        AccountFilter accountFilter = new AccountFilter();

        Test.startTest();
        List<Account> filteredAccounts = accountFilter.byFieldValue(testAccounts, 'Name', 'Test 1');
        Test.stopTest();

        Assert.areEqual(1, filteredAccounts.size());
        Assert.areEqual('Test 1', filteredAccounts.get(0).Name);

    }

    @isTest
    public static void AccountFilterByRecordTypeIdTest(){

        Account accountOne = new Account(RecordTypeId = AccountRecordTypes.PARCEIRO_ID);
        Account accountTwo = new Account(RecordTypeId = AccountRecordTypes.CONSUMIDOR_FINAL_ID);

        List<Account> testAccounts = new List<Account>{
            accountOne, accountTwo
        };

        AccountFilter accountFilter = new AccountFilter();

        Test.startTest();
        List<Account> filteredAccounts = accountFilter.byRecordTypeId(testAccounts, AccountRecordTypes.PARCEIRO_ID);
        Test.stopTest();

        Assert.areEqual(1, filteredAccounts.size());
        Assert.areEqual(AccountRecordTypes.PARCEIRO_ID, filteredAccounts.get(0).RecordTypeId);

    }

    @isTest
    public static void AccountFilterByNotNullFieldTest(){

        Account accountOne = new Account(Name = 'Test 1');
        Account accountTwo = new Account(Name = null);
        Account accountThree = new Account(Name = 'Test 3');

        List<Account> testAccounts = new List<Account>{
            accountOne, accountTwo, accountThree
        };

        AccountFilter accountFilter = new AccountFilter();

        Test.startTest();
        List<Account> filteredAccounts = accountFilter.byNotNullField(testAccounts, 'Name');
        Test.stopTest();

        Assert.areEqual(2, filteredAccounts.size());
        Assert.areEqual('Test 1', filteredAccounts.get(0).Name);
        Assert.areEqual('Test 3', filteredAccounts.get(1).Name);

    }
    
}