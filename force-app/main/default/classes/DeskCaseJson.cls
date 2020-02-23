public class DeskCaseJson{
	public Integer page;	//1
	public Integer total_entries;	//377142
	public cls_links x_links;
	public cls_embedded x_embedded;
	class cls_links {
		public cls_labels labels;
		public cls_assigned_group assigned_group;
		public cls_macro_preview macro_preview;
		public cls_locked_by locked_by;
		public cls_case_links case_links;
		public cls_attachments attachments;
		public cls_history history;
		public cls_feedbacks feedbacks;
		public cls_customer customer;
		public cls_replies replies;
		public cls_draft draft;
		public cls_notes notes;
		public cls_assigned_user assigned_user;
		public cls_self self;
		public cls_message message;
	}
	public class cls_self {
		public String cls;	//case
		public String href;	///api/v2/cases/1
	}
	class cls_first {
		public String cls;	//page
		public String href;	///api/v2/cases?oauth_consumer_key=4mYlBEat3y9HJlGFGCPS&oauth_nonce=TBienx&oauth_signature=A6VTgBRN8K9Bkb1Yz2nCZB7rgyWwrT5qQGITmZDR%26RFNob8q6W0KLCuzawtSyQiAQZJ0UAQJHm6vFMVSw&oauth_signature_method=PLAINTEXT&oauth_timestamp=1529304487&oauth_token=vU9YHJifkcPT64dFEd4B&oauth_version=1.0&page=1&per_page=50
	}
	class cls_last {
		public String cls;	//page
		public String href;	///api/v2/cases?oauth_consumer_key=4mYlBEat3y9HJlGFGCPS&oauth_nonce=TBienx&oauth_signature=A6VTgBRN8K9Bkb1Yz2nCZB7rgyWwrT5qQGITmZDR%26RFNob8q6W0KLCuzawtSyQiAQZJ0UAQJHm6vFMVSw&oauth_signature_method=PLAINTEXT&oauth_timestamp=1529304487&oauth_token=vU9YHJifkcPT64dFEd4B&oauth_version=1.0&page=7543&per_page=50
	}
	class cls_next {
		public String cls;	//page
		public String href;	///api/v2/cases?oauth_consumer_key=4mYlBEat3y9HJlGFGCPS&oauth_nonce=TBienx&oauth_signature=A6VTgBRN8K9Bkb1Yz2nCZB7rgyWwrT5qQGITmZDR%26RFNob8q6W0KLCuzawtSyQiAQZJ0UAQJHm6vFMVSw&oauth_signature_method=PLAINTEXT&oauth_timestamp=1529304487&oauth_token=vU9YHJifkcPT64dFEd4B&oauth_version=1.0&page=2&per_page=50
	}
	class cls_previous {
	}
	public class cls_embedded {
		public cls_entries[] entries;
	}
	public class cls_entries {
		public Integer id;	//1
		public String blurb;	//I want to personally thank you for signing up to try Desk.com! To ensure you get the most out of your trial, here are some helpful tips and quick ways to get started:
		public String changed_at;	//2015-08-26T07:02:06Z
		public String created_at;	//2015-05-29T04:43:07Z
		public cls_custom_fields custom_fields;
		public String description;
		public String external_id;
		public String first_opened_at;	//2015-08-26T02:47:41Z
		public String first_resolved_at;	//2015-08-26T07:02:06Z
		public Integer[] label_ids;
		public String[] labels;
		public String language;
		public cls_locked_until locked_until;
		public String opened_at;	//2015-08-26T02:47:41Z
		public Integer priority;	//4
		public String received_at;	//2015-05-29T04:43:07Z
		public String resolved_at;	//2015-08-26T07:02:06Z
		public String status;	//resolved
		public String subject;	//Getting Started with Your New Account
		public String type;	//email
		public String updated_at;	//2016-07-19T10:14:46Z
		public String active_at;	//2016-07-19T10:12:54Z
		public Integer active_attachments_count;	//0
		public Integer active_notes_count;	//0
		public boolean has_pending_interactions;
		public boolean has_failed_interactions;
		public String route_status;	//available
		public cls_links x_links;
	}
	class cls_custom_fields {
		public String us_personal_care_range;
		public String personal_care_range_recommended;
		public String review;
		public String pharmaceutical_range_recommended;
		public String message_source;
		public String action_taken;
		public String product_query;
		public String animal_health_range_recommended;
		public String categories;
		public String us_health_supplement_range;
		public String query_type;
		public String retail_outlets;
		public String additional_comments;
		public String nature_of_query;
		public String indications;
	}
	class cls_us_personal_care_range {
	}
	class cls_personal_care_range_recommended {
	}
	class cls_review {
	}
	class cls_pharmaceutical_range_recommended {
	}
	class cls_message_source {
	}
	class cls_action_taken {
	}
	class cls_product_query {
	}
	class cls_animal_health_range_recommended {
	}
	class cls_categories {
	}
	class cls_us_health_supplement_range {
	}
	class cls_query_type {
	}
	class cls_retail_outlets {
	}
	class cls_additional_comments {
	}
	class cls_nature_of_query {
	}
	class cls_indications {
	}
	class cls_description {
	}
	class cls_external_id {
	}
	class cls_label_ids {
        
	}
	class cls_labels {
		public String cls;	//label
		public String href;	///api/v2/cases/1/labels
	}
	class cls_language {
	}
	class cls_locked_until {
	}
	class cls_assigned_group {
		public String cls;	//group
		public String href;	///api/v2/groups/508403
	}
	class cls_macro_preview {
		public String cls;	//macro_preview
		public String href;	///api/v2/cases/1/macros/preview
	}
	class cls_locked_by {
	}
	class cls_case_links {
		public String cls;	//case_link
		public Integer count;	//0
		public String href;	///api/v2/cases/1/links
	}
	class cls_attachments {
		public String cls;	//attachment
		public Integer count;	//0
		public String href;	///api/v2/cases/1/attachments
	}
	class cls_history {
		public String cls;	//history
		public String href;	///api/v2/cases/1/history
	}
	class cls_feedbacks {
	}
	class cls_customer {
		public String cls;	//customer
		public String href;	///api/v2/customers/335657312
	}
	class cls_replies {
		public String cls;	//reply
		public Integer count;	//0
		public String href;	///api/v2/cases/1/replies
	}
	class cls_draft {
		public String cls;	//reply
		public String href;	///api/v2/cases/1/replies/draft
	}
	class cls_notes {
		public String cls;	//note
		public Integer count;	//0
		public String href;	///api/v2/cases/1/notes
	}
	class cls_assigned_user {
		public String cls;	//user
		public String href;	///api/v2/users/23294147
	}
	class cls_message {
		public String cls;	//email
		public String href;	///api/v2/cases/1/message
	}
	public static DeskCaseJson parse(String json){
		return (DeskCaseJson) System.JSON.deserialize(json, DeskCaseJson.class);
	}
}