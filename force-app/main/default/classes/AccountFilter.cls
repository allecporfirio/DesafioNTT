/**
@author: Alessandro Porfírio
 */
public class AccountFilter {
    
    public List<Account> byChangedField(List<Account> newAccounts, Map<Id, Account> oldAccounts, String field) {

        List<Account> accountsToReturn = new List<Account>();

        for(Account newAccount : newAccounts) {

            Account oldAccount = oldAccounts.get(newAccount.Id);

            if(newAccount.get(field) != oldAccount.get(field)) {
                accountsToReturn.add(newAccount);
            }

        }

        return accountsToReturn;

    }

    public List<Account> byFieldValue(List<Account> accounts, String field, String value) {

        List<Account> accountsToReturn = new List<Account>();

        for(Account account : accounts) {

            if(account.get(field) == value) {
                accountsToReturn.add(account);
            }

        }

        return accountsToReturn;

    }

    public List<Account> byRecordTypeId(List<Account> accounts, String recordTypeId) {

        List<Account> accountsToReturn = new List<Account>();

        for(Account account : accounts) {

            if(account.RecordTypeId == recordTypeId) {
                accountsToReturn.add(account);
            }

        }

        return accountsToReturn;
        
    }

    public List<Account> byNotNullField(List<Account> accounts, String field) {

        List<Account> accountsToReturn = new List<Account>();

        for(Account account : accounts) {

            if(account.get(field) != null) {
                accountsToReturn.add(account);
            }

        }

        return accountsToReturn;

    }

}
