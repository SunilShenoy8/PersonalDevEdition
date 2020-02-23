import { LightningElement,api } from 'lwc';

export default class RecordFormViewLWC extends LightningElement {
    @api objapiname;
    @api recordid;
}