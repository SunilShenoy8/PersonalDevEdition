import { LightningElement,api } from 'lwc';

export default class RecordFormViewLWC extends LightningElement {
    @api objapiname;
    @api recordid;

    connectedCallback(){
        /* eslint-disable no-console */
        console.log('selected contact in child: ',this.recordid);
    }
}