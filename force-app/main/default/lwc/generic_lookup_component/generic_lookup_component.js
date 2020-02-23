import { LightningElement,api } from 'lwc';

export default class GenericLookupComponent extends LightningElement {
    @api object_api_name;
    @api has_init_load = false;

    connectedCallback() {
        console.log('Init => object name :',this.object_api_name,' has init load :',this.has_init_load);
        if( (this.object_api_name != null || this.object_api_name != undefined) &&  this.has_init_load){

        }
    }

}