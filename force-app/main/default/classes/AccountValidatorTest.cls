/**
 * @author: Alessandro Porfírio
 */

@isTest
public class AccountValidatorTest {
    
    @isTest 
    public static void accountValidatorValidateDocumentTest() {

        Account accountOne = new Account(Name = 'Test 1', Type = 'CPF', AccountNumber = '12345');
        Account accountTwo = new Account(Name = 'Test 2', Type = 'CNPJ', AccountNumber = '67890');

        List<Account> accounts = new List<Account>{
            accountOne, accountTwo
        };

        AccountValidator accountValidator = new AccountValidator();

        Test.startTest();

        try{
            accountValidator.validateDocument(accounts);
        } catch(Exception e) {
            Assert.areEqual(null, e.getMessage());
        }

        Test.stopTest();

    }

}
