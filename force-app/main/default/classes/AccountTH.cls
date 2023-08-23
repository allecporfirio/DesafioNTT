public class AccountTH {

    List<Account> newAccounts;
    Map<Id, Account> oldAccounts;

    AccountValidator accountValidator;
    AccountFilter accountFilter;
    AccountEnricher accountEnricher;

    public AccountTH(List<Account> newAccounts, Map<Id, Account> oldAccounts) {

        this.newAccounts = newAccounts;
        this.oldAccounts = oldAccounts;

        this.accountValidator = new AccountValidator();
        this.accountFilter = new AccountFilter();
        this.accountEnricher = new AccountEnricher();

    }

    public void beforeInsert() {
        validateDocument();
    }

    public void afterInsert() {
        createOpportunity();
        createTask();
    }

    public void beforeUpdate() {
        validateDocument();
    }

    private void createOpportunity() {

        List<Account> filteredAccounts = 
                accountFilter.byRecordTypeId(newAccounts, AccountRecordTypes.PARCEIRO_ID);

        if(filteredAccounts.isEmpty() || filteredAccounts == null) return;

        accountEnricher.withRelatedOpportunities(filteredAccounts);

    }

    private void createTask() {

        List<Account> filteredAccounts = 
                accountFilter.byRecordTypeId(newAccounts, AccountRecordTypes.CONSUMIDOR_FINAL_ID);

        if(filteredAccounts.isEmpty() || filteredAccounts == null) return;

        accountEnricher.withRelatedTasks(filteredAccounts);

    }

    private void validateDocument() {

        List<Account> filteredAccounts = new List<Account>();

        if(oldAccounts != null && !oldAccounts.isEmpty()) {

            filteredAccounts = accountFilter.byChangedField(newAccounts, oldAccounts, 'AccountNumber');

        } else {

            filteredAccounts = accountFilter.byNotNullField(newAccounts, 'AccountNumber');

        }

        if(filteredAccounts.isEmpty() || filteredAccounts == null) return;

        accountValidator.validateDocument(filteredAccounts);

    }

}