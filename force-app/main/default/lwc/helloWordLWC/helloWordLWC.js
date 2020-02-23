import { LightningElement,track } from 'lwc';

export default class HelloWordLWC extends LightningElement {
    @track greeting = '';
    onchangestr(event){
        this.greeting = event.target.value;
    }

}