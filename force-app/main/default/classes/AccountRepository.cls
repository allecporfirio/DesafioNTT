/**
    @author: Alessandro Porfírio
 */

public virtual class AccountRepository {
    
    virtual 
    public Account findById(String accountId) {
        return [
            SELECT Id, Name, AccountNumber, Type
            FROM Account
            WHERE Id = :accountId
        ];
    }

    virtual 
    public Account save(Account account) {
        upsert account;
        return account;
    }

}
