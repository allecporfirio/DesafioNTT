/**
 * @author: Alessandro Porfírio
 */

@isTest 
public class AccountTHTest {
    
    @isTest 
    public static void accountTHBeforeInsertTest() {

        String error = '';

        Account account = new Account(Name = 'Test', Type = 'CPF', AccountNumber = '123456');

        Test.startTest();

        try{
            insert account;
        } catch(Exception e) {
            error = e.getMessage();
        }

        Test.stopTest();

        Assert.areEqual('', error);

    }

    @isTest 
    public static void accountTHAfterInsertTest() {

        String error = '';

        Account accountOne = new Account(Name = 'Test 1', RecordTypeId = AccountRecordTypes.PARCEIRO_ID);
        Account accountTwo = new Account(Name = 'Test 2', RecordTypeId = AccountRecordTypes.CONSUMIDOR_FINAL_ID);

        List<Account> accounts = new List<Account>{
            accountOne, accountTwo
        };

        Test.startTest();

        try{
            insert accounts;
        } catch(Exception e) {
            error = e.getMessage();
        }

        Test.stopTest();

        Assert.areEqual('', error);

    }

    @isTest 
    public static void accountTHBeforeUpdateTest() {

        String error = '';

        Account account = new Account(Name = 'Test', Type = 'CPF', AccountNumber = '12345');
        insert account;

        Test.startTest();

        try{

            account.AccountNumber = '67890';
            update account;

        } catch(Exception e) {
            error = e.getMessage();
        }

        Test.stopTest();

        Assert.areEqual('', error);

    }

}
