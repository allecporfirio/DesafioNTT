/**
@author: Alessandro Porfírio
 */

public class AccountValidator {

    AccountFilter accountFilter;

    public AccountValidator() {
        this.accountFilter = new AccountFilter();
    }
    
    public void validateDocument(List<Account> accounts) {

        List<Account> cpfAccounts = accountFilter.byFieldValue(accounts, 'Type', 'CPF');

        if(!cpfAccounts.isEmpty() || cpfAccounts != null) {
            validateCpf(cpfAccounts);
        }

        List<Account> cnpjAccounts = accountFilter.byFieldValue(accounts, 'Type', 'CNPJ');

        if(!cnpjAccounts.isEmpty() || cnpjAccounts != null) {
            validateCnpj(cnpjAccounts);
        }

    }

    public void validateCnpj(List<Account> accounts) {

        for(Account account : accounts){

            String accountNumber = account.AccountNumber
                                    .replace('.', '')
                                    .replace('-', '')
                                    .replace('/', '');

            if(!Utils.validaCNPJ(accountNumber)) {
                account.addError('Número do cliente é inválido');
            }

        }

    }

    public void validateCpf(List<Account> accounts) {

        for(Account account : accounts){

            String accountNumber = account.AccountNumber
                                    .replace('.', '')
                                    .replace('-', '');

            if(!Utils.validaCPF(accountNumber)) {
                account.addError('Número do cliente é inválido');
            }

        }

    }
    

}