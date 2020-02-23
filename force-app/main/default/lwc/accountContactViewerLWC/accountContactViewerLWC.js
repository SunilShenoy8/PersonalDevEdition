import { LightningElement, wire,track,api } from 'lwc';
import getAccounts from '@salesforce/apex/AccountContactLWCHelper.getAccounts';
import getRelatedContact from '@salesforce/apex/AccountContactLWCHelper.getRelatedContact';


export default class AccountContactViewerLWC extends LightningElement {
    @track contactList = null;
    @wire(getAccounts) accountList;
    @api contactId;
    
    connectedCallback(){
        /* eslint-disable no-console */
    }

    onAccountChange(event){
        /* eslint-disable no-console */
        var selectedId = event.target.value;
        if(selectedId != "none"){
            getRelatedContact({accId :selectedId })
            .then( result => {
                console.log('Related contacts : ',JSON.stringify(result));
                if(result.length > 0){
                    this.contactList = result;
                    console.log('Contact List : ',JSON.stringify(this.contactList));
                    this.contactId = result.length == 1 ? result[0].Id : null;
                }
            })
            .catch( error => {
                console.log('Errors : ',error);
            })
        }else{
            this.contactId = null;
            this.contactList = null;
        }
    }

    onContactSelect(event){
        /* eslint-disable no-console */
        console.log('selected contact : ',event.target.value);
        this.contactId = event.target.value;
    }

    closeHandler(event){
        /* eslint-disable no-console */
        this.contactId = null;
        this.contactList = null;
        this.template.querySelector('select.cb').value = 'none';
    }
}