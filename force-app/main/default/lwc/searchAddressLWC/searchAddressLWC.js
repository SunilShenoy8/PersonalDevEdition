/* eslint-disable vars-on-top */
import { LightningElement,api } from 'lwc';
import getAddressSet from '@salesforce/apex/AddressSearchController.getAddressSet';

const MINIMAL_SEARCH_TERM_LENGTH = 2; // Min number of chars required to search
//const SEARCH_DELAY = 300; // Wait 300 ms after user stops typing then, peform search

export default class SearchAddressLWC extends LightningElement {
    @api addressList;


    @api label;
    @api selection = [];
    @api placeholder = '';
    @api isMultiEntry = false;
    @api errors = [];
    @api scrollAfterNItems;
    @api customKey;


    cleanSearchTerm;
    blurTimeout;
    searchThrottlingTimeout;
    // eslint-disable-next-line no-unused-vars
    addressSearch(event){
        /* eslint-disable no-console */
        var searchText = event.target.value;
        console.log('Search Item : '+searchText);
        if(searchText != null){
            getAddressSet({SearchText:searchText})
            .then( result =>{
                console.log('search results : ',JSON.stringify(result));
                this.addressReponseHandler(result);
            })
            .catch( error =>{
                console.log('something went wrong!! Error : ',error);
            })
        }else if(searchText === ''){
            this.addressList = [];
        }
    }

    addressReponseHandler(resp){
        var response = JSON.parse(resp);
            var predictions = response.predictions;
            var addresses = [];
            if (predictions.length > 0) {
                for (var i = 0; i < predictions.length; i++) {
                    addresses.push(
                    {
                        main_text: predictions[i].structured_formatting.main_text, 
                        secondary_text: predictions[i].structured_formatting.secondary_text,
                        place_id: predictions[i].place_id
                    });
                }
            }
            this.addressList = addresses;
        }

        hasResults() {
            return this.addressList.length > 0;
        }

        // STYLE EXPRESSIONS

        get getContainerClass() {
            let css = 'slds-combobox_container slds-has-inline-listbox ';
            if (this.hasFocus && this.hasResults()) {
                css += 'slds-has-input-focus ';
            }
            if (this.errors.length > 0) {
                css += 'has-custom-error';
            }
            return css;
        }
    
        get getDropdownClass() {
            let css =
                'slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click ';
            if (
                this.hasFocus &&
                this.cleanSearchTerm &&
                this.cleanSearchTerm.length >= MINIMAL_SEARCH_TERM_LENGTH
            ) {
                css += 'slds-is-open';
            }
            return css;
        }
    
        get getInputClass() {
            let css =
                'slds-input slds-combobox__input has-custom-height ' +
                (this.errors.length === 0 ? '' : 'has-custom-error ');
            if (!this.isMultiEntry) {
                css +=
                    'slds-combobox__input-value ' +
                    (this.hasSelection() ? 'has-custom-border' : '');
            }
            return css;
        }
    
        get getComboboxClass() {
            let css = 'slds-combobox__form-element slds-input-has-icon ';
            if (this.isMultiEntry) {
                css += 'slds-input-has-icon_right';
            } else {
                css += this.hasSelection()
                    ? 'slds-input-has-icon_left-right'
                    : 'slds-input-has-icon_right';
            }
            return css;
        }
    
        get getSearchIconClass() {
            let css = 'slds-input__icon slds-input__icon_right ';
            if (!this.isMultiEntry) {
                css += this.hasSelection() ? 'slds-hide' : '';
            }
            return css;
        }
    
        get getClearSelectionButtonClass() {
            return (
                'slds-button slds-button_icon slds-input__icon slds-input__icon_right ' +
                (this.hasSelection() ? '' : 'slds-hide')
            );
        }
    
        get getSelectIconName() {
            return this.hasSelection()
                ? this.selection[0].icon
                : 'standard:default';
        }
    
        get getSelectIconClass() {
            return (
                'slds-combobox__input-entity-icon ' +
                (this.hasSelection() ? '' : 'slds-hide')
            );
        }
    
        get getInputValue() {
            if (this.isMultiEntry) {
                return this.searchTerm;
            }
            return this.hasSelection() ? this.selection[0].title : this.searchTerm;
        }
    
        get getListboxClass() {
            return (
                'slds-listbox slds-listbox_vertical slds-dropdown slds-dropdown_fluid ' +
                (this.scrollAfterNItems
                    ? 'slds-dropdown_length-with-icon-' + this.scrollAfterNItems
                    : '')
            );
        }
    
        get isInputReadonly() {
            if (this.isMultiEntry) {
                return false;
            }
            return this.hasSelection();
        }
    
        get isExpanded() {
            return this.hasResults();
        }
    }