import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import updateAccount from "@salesforce/apex/AccountCnpjCpfController.updateAccount";

export default class AccountCnpjCpf extends LightningElement {

    @api recordId;

    nameValue = '';
    accountNumberValue = '';
    typeValue = 'none';
    accountData = {};
    
    get options() {
        return [
            { label: 'None', value: 'none' },
            { label: 'CPF', value: 'cpf' },
            { label: 'CNPJ', value: 'cnpj' }
        ];
    }
    
    handleNameChange(event) {
        this.nameValue = event.detail.value;
    }
    
    handleAccountNumberChange(event) {
        this.accountNumberValue = event.detail.value;
    }
    
    handleTypeChange(event) {
        this.typeValue = event.detail.value;
    }

    handleReset() {
        this.nameValue = '';
        this.accountNumberValue = '';
        this.typeValue = 'none';
    }

    handleSave() {

        this.accountData['name'] = this.nameValue;
        this.accountData['accountNumber'] = this.accountNumberValue;
        this.accountData['type'] = this.typeValue;

        updateAccount({ accountId : this.recordId, data : this.accountData })
        .then((result) => {

            if(result) {

                const toastEvent = new ShowToastEvent({
                    title: 'Success!',
                    message: 'The Account record was saved.',
                    variant: 'success',
                });   

                this.dispatchEvent(toastEvent);

            } else{

                const toastEvent = new ShowToastEvent({
                    title: 'Error!',
                    message: 'The Account record wasn\'t saved.',
                    variant: 'error',
                });

                this.dispatchEvent(toastEvent);

            }
        })

        this.handleReset();

    }

}
