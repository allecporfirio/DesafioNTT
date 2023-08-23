/**
 * @author: Alessandro Porfírio
 */

public class AccountRecordTypes {
    
    public static final String PARCEIRO_ID;
    public static final String CONSUMIDOR_FINAL_ID;

    static {

        PARCEIRO_ID = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Parceiro').getRecordTypeId();
        CONSUMIDOR_FINAL_ID = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Consumidor Final').getRecordTypeId();

    }

}
