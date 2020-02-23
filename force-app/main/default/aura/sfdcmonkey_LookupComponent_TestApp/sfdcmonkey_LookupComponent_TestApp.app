<aura:application extends="force:slds">
    <aura:attribute name="selectedLookUpRecord" type="sObject" default="{}"/>
	<c:sfdcmonkey_LookupComponent objectAPIName="account" IconName="standard:account" selectedRecord="{!v.selectedLookUpRecord}" label="Account Name"/>
</aura:application>