public with sharing class WrapperClassExample {
	public List<wrapContact> contactList{get;set;}

	public List<wrapContact> getContact() {
		if(contactList==null)
		{
			contactList=new List<wrapContact>();
			for(Contact c:[select lastName,email,phone from Contact Limit 10])
			{
				contactList.add(new wrapContact(c));
			}
			System.debug(contactList);
		}
		return contactList;
	}

	public PageReference processSelected()
	{
		List<wrapContact> wrList=new List<wrapContact>();
		List<Contact> updateList=new List<Contact>();
		for(wrapContact wcon:getContact())
		{
			if(wcon.selected==true){
				System.debug('Details:'+wcon.c);
				wrList.add(wcon);
			}
		}
		for(wrapContact con:wrList)
		{
			con.c.email='hello@gmail.com';
			updateList.add(con.c);
		}
		update updateList;

		return null;
	}
	public class wrapContact
	{
		public Contact c{get;set;}
		public Boolean selected{get;set;}
		public wrapContact(Contact c)
		{
			this.c=c;
			selected=false;
		}

	}
}