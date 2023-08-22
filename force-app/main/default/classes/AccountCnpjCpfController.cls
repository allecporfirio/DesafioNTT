/**
@author: Alessandro Porfírio
 */

public class AccountCnpjCpfController {

    @AuraEnabled
    public static Boolean updateAccount(String accountId, Map<String, String> data) {

        AccountRepository repository = new AccountRepository();
        Account account = repository.findById(accountId);

        if(data.get('name') != '') {
            account.Name = data.get('name');
        } 
        if(data.get('accountNumber') != '') {
            account.AccountNumber = data.get('accountNumber');
        }
        if(data.get('type') != 'none') {
            account.Type = data.get('type');
        }

        try{
            repository.save(account);
            return true;
        } catch(Exception e) {
            return false;
        }

    }

}
