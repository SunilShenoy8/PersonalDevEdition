import { LightningElement,api, track } from 'lwc';
import getResults from '@salesforce/apex/generic_lookup_apexhelper.getResults';

export default class GenericLookupComponent extends LightningElement {
    @api object_api_name;
    @api field_api_name;
    @api iconname;
    @track records;
    @track search_key;
    @track selectedRecord;
    @track showError;

    connectedCallback() {
        this.iconname = (this.iconname == null || this.iconname == undefined) ? 'standard:account' : this.iconname;
    }
    handleChange(event){
        this.search_key = event.target.value;
        if(this.search_key == null || this.search_key == ''){
            this.records = [];
            this.showError = false;
            return;
        }
        if( (this.object_api_name != null || this.object_api_name != undefined) &&  (this.field_api_name != null || this.field_api_name != undefined) ){
            getResults({
                'ObjectName' : this.object_api_name,
                'fieldName'  : this.field_api_name,
                'value'      : this.search_key
            })
            .then( result => {
                this.showError =  ( result != null && result.length > 0 ) ? false : true;
                this.records = result;
                console.log('Result of query : ',JSON.stringify(this.records));
                this.selectedRecord = null;
            })
            .catch( error => {
                console.log('Errors : ',error);
            })
        }
    }

    handleSelect(event){
        var selectedId = event.currentTarget.id;
        this.selectedRecord = this.records.find( record => record.recId === selectedId.split("-")[0]);
        console.log('Record selected : '+JSON.stringify(this.selectedRecord));
        if(this.selectedRecord != null && this.selectedRecord != undefined){
            this.search_key = this.selectedRecord.recName;
            this.records = [];
        }
    }

    onClearSection(event){
        this.selectedRecord = null;
        this.records = [];
        this.showError = false;
        this.search_key = null;
    }

}