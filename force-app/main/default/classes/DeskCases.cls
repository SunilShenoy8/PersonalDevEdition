public class DeskCases {
	
    public Entries entry;
	public class Label_ids {

		public Label_ids(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						{
							System.debug(LoggingLevel.WARN, 'Label_ids consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Links_Z {
		public Self labels {get;set;} 
		public Self assigned_group {get;set;} 
		public Self macro_preview {get;set;} 
		public Object locked_by {get;set;} 
		public Case_links case_links {get;set;} 
		public Case_links attachments {get;set;} 
		public Self history {get;set;} 
		public Object feedbacks {get;set;} 
		public Self customer {get;set;} 
		public Case_links replies {get;set;} 
		public Self draft {get;set;} 
		public Case_links notes {get;set;} 
		public Self assigned_user {get;set;} 
		public Self self {get;set;} 
		public Self message {get;set;} 

		public Links_Z(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'labels') {
							labels = new Self(parser);
						} else if (text == 'assigned_group') {
							assigned_group = new Self(parser);
						} else if (text == 'macro_preview') {
							macro_preview = new Self(parser);
						} else if (text == 'locked_by') {
							locked_by = parser.readValueAs(Object.class);
						} else if (text == 'case_links') {
							case_links = new Case_links(parser);
						} else if (text == 'attachments') {
							attachments = new Case_links(parser);
						} else if (text == 'history') {
							history = new Self(parser);
						} else if (text == 'feedbacks') {
							feedbacks = parser.readValueAs(Object.class);
						} else if (text == 'customer') {
							customer = new Self(parser);
						} else if (text == 'replies') {
							replies = new Case_links(parser);
						} else if (text == 'draft') {
							draft = new Self(parser);
						} else if (text == 'notes') {
							notes = new Case_links(parser);
						} else if (text == 'assigned_user') {
							assigned_user = new Self(parser);
						} else if (text == 'self') {
							self = new Self(parser);
						} else if (text == 'message') {
							message = new Self(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Links_Z consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Links_Y {
		public Self labels {get;set;} 
		public Self assigned_group {get;set;} 
		public Self macro_preview {get;set;} 
		public Object locked_by {get;set;} 
		public Case_links case_links {get;set;} 
		public Case_links attachments {get;set;} 
		public Self history {get;set;} 
		public Object feedbacks {get;set;} 
		public Self customer {get;set;} 
		public Case_links replies {get;set;} 
		public Self draft {get;set;} 
		public Case_links notes {get;set;} 
		public Object assigned_user {get;set;} 
		public Self self {get;set;} 
		public Self message {get;set;} 

		public Links_Y(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'labels') {
							labels = new Self(parser);
						} else if (text == 'assigned_group') {
							assigned_group = new Self(parser);
						} else if (text == 'macro_preview') {
							macro_preview = new Self(parser);
						} else if (text == 'locked_by') {
							locked_by = parser.readValueAs(Object.class);
						} else if (text == 'case_links') {
							case_links = new Case_links(parser);
						} else if (text == 'attachments') {
							attachments = new Case_links(parser);
						} else if (text == 'history') {
							history = new Self(parser);
						} else if (text == 'feedbacks') {
							feedbacks = parser.readValueAs(Object.class);
						} else if (text == 'customer') {
							customer = new Self(parser);
						} else if (text == 'replies') {
							replies = new Case_links(parser);
						} else if (text == 'draft') {
							draft = new Self(parser);
						} else if (text == 'notes') {
							notes = new Case_links(parser);
						} else if (text == 'assigned_user') {
							assigned_user = parser.readValueAs(Object.class);
						} else if (text == 'self') {
							self = new Self(parser);
						} else if (text == 'message') {
							message = new Self(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Links_Y consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Custom_fields {
		public Object us_personal_care_range {get;set;} 
		public Object personal_care_range_recommended {get;set;} 
		public Object review {get;set;} 
		public Object pharmaceutical_range_recommended {get;set;} 
		public Object message_source {get;set;} 
		public Object action_taken {get;set;} 
		public Object product_query {get;set;} 
		public Object animal_health_range_recommended {get;set;} 
		public Object categories {get;set;} 
		public Object us_health_supplement_range {get;set;} 
		public Object query_type {get;set;} 
		public Object retail_outlets {get;set;} 
		public Object additional_comments {get;set;} 
		public Object nature_of_query {get;set;} 
		public Object indications {get;set;} 

		public Custom_fields(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'us_personal_care_range') {
							us_personal_care_range = parser.readValueAs(Object.class);
						} else if (text == 'personal_care_range_recommended') {
							personal_care_range_recommended = parser.readValueAs(Object.class);
						} else if (text == 'review') {
							review = parser.readValueAs(Object.class);
						} else if (text == 'pharmaceutical_range_recommended') {
							pharmaceutical_range_recommended = parser.readValueAs(Object.class);
						} else if (text == 'message_source') {
							message_source = parser.readValueAs(Object.class);
						} else if (text == 'action_taken') {
							action_taken = parser.readValueAs(Object.class);
						} else if (text == 'product_query') {
							product_query = parser.readValueAs(Object.class);
						} else if (text == 'animal_health_range_recommended') {
							animal_health_range_recommended = parser.readValueAs(Object.class);
						} else if (text == 'categories') {
							categories = parser.readValueAs(Object.class);
						} else if (text == 'us_health_supplement_range') {
							us_health_supplement_range = parser.readValueAs(Object.class);
						} else if (text == 'query_type') {
							query_type = parser.readValueAs(Object.class);
						} else if (text == 'retail_outlets') {
							retail_outlets = parser.readValueAs(Object.class);
						} else if (text == 'additional_comments') {
							additional_comments = parser.readValueAs(Object.class);
						} else if (text == 'nature_of_query') {
							nature_of_query = parser.readValueAs(Object.class);
						} else if (text == 'indications') {
							indications = parser.readValueAs(Object.class);
						} else {
							System.debug(LoggingLevel.WARN, 'Custom_fields consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Case_links {
		public String class_Z {get;set;} // in json: class
		public Integer count {get;set;} 
		public String href {get;set;} 

		public Case_links(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'class') {
							class_Z = parser.getText();
						} else if (text == 'count') {
							count = parser.getIntegerValue();
						} else if (text == 'href') {
							href = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Case_links consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Custom_fields_Y {
		public Object us_personal_care_range {get;set;} 
		public Object personal_care_range_recommended {get;set;} 
		public Object review {get;set;} 
		public Object pharmaceutical_range_recommended {get;set;} 
		public String message_source {get;set;} 
		public Object action_taken {get;set;} 
		public Object product_query {get;set;} 
		public Object animal_health_range_recommended {get;set;} 
		public Object categories {get;set;} 
		public Object us_health_supplement_range {get;set;} 
		public String query_type {get;set;} 
		public Object retail_outlets {get;set;} 
		public Object additional_comments {get;set;} 
		public String nature_of_query {get;set;} 
		public Object indications {get;set;} 

		public Custom_fields_Y(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'us_personal_care_range') {
							us_personal_care_range = parser.readValueAs(Object.class);
						} else if (text == 'personal_care_range_recommended') {
							personal_care_range_recommended = parser.readValueAs(Object.class);
						} else if (text == 'review') {
							review = parser.readValueAs(Object.class);
						} else if (text == 'pharmaceutical_range_recommended') {
							pharmaceutical_range_recommended = parser.readValueAs(Object.class);
						} else if (text == 'message_source') {
							message_source = parser.getText();
						} else if (text == 'action_taken') {
							action_taken = parser.readValueAs(Object.class);
						} else if (text == 'product_query') {
							product_query = parser.readValueAs(Object.class);
						} else if (text == 'animal_health_range_recommended') {
							animal_health_range_recommended = parser.readValueAs(Object.class);
						} else if (text == 'categories') {
							categories = parser.readValueAs(Object.class);
						} else if (text == 'us_health_supplement_range') {
							us_health_supplement_range = parser.readValueAs(Object.class);
						} else if (text == 'query_type') {
							query_type = parser.getText();
						} else if (text == 'retail_outlets') {
							retail_outlets = parser.readValueAs(Object.class);
						} else if (text == 'additional_comments') {
							additional_comments = parser.readValueAs(Object.class);
						} else if (text == 'nature_of_query') {
							nature_of_query = parser.getText();
						} else if (text == 'indications') {
							indications = parser.readValueAs(Object.class);
						} else {
							System.debug(LoggingLevel.WARN, 'Custom_fields_Y consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Links {
		public Self self {get;set;} 
		public Self first {get;set;} 
		public Self last {get;set;} 
		public Self next {get;set;} 
		public Object previous {get;set;} 

		public Links(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'self') {
							self = new Self(parser);
						} else if (text == 'first') {
							first = new Self(parser);
						} else if (text == 'last') {
							last = new Self(parser);
						} else if (text == 'next') {
							next = new Self(parser);
						} else if (text == 'previous') {
							previous = parser.readValueAs(Object.class);
						} else {
							System.debug(LoggingLevel.WARN, 'Links consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Self {
		public String class_Z {get;set;} // in json: class
		public String href {get;set;} 

		public Self(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'class') {
							class_Z = parser.getText();
						} else if (text == 'href') {
							href = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Self consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Entries {
		public Integer id {get;set;} 
		public String blurb {get;set;} 
		public String changed_at {get;set;} 
		public String created_at {get;set;} 
		public Custom_fields custom_fields {get;set;} 
		public Object description {get;set;} 
		public Object external_id {get;set;} 
		public String first_opened_at {get;set;} 
		public String first_resolved_at {get;set;} 
		public List<Integer> label_ids {get;set;} 
		public List<String> labels {get;set;} 
		public Object language {get;set;} 
		public Object locked_until {get;set;} 
		public String opened_at {get;set;} 
		public Integer priority {get;set;} 
		public String received_at {get;set;} 
		public String resolved_at {get;set;} 
		public String status {get;set;} 
		public String subject {get;set;} 
		public String type_Z {get;set;} // in json: type
		public String updated_at {get;set;} 
		public String active_at {get;set;} 
		public Integer active_attachments_count {get;set;} 
		public Integer active_notes_count {get;set;} 
		public Boolean has_pending_interactions {get;set;} 
		public Boolean has_failed_interactions {get;set;} 
		public String route_status {get;set;} 
		public Links_Z x_links {get;set;} // in json: _links

		public Entries(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'id') {
							id = parser.getIntegerValue();
						} else if (text == 'blurb') {
							blurb = parser.getText();
						} else if (text == 'changed_at') {
							changed_at = parser.getText();
						} else if (text == 'created_at') {
							created_at = parser.getText();
						} else if (text == 'custom_fields') {
							custom_fields = new Custom_fields(parser);
						} else if (text == 'description') {
							description = parser.readValueAs(Object.class);
						} else if (text == 'external_id') {
							external_id = parser.readValueAs(Object.class);
						} else if (text == 'first_opened_at') {
							first_opened_at = parser.getText();
						} else if (text == 'first_resolved_at') {
							first_resolved_at = parser.getText();
						} else if (text == 'label_ids') {
							label_ids = arrayOfInteger(parser);
						} else if (text == 'labels') {
							labels = arrayOfString(parser);
						} else if (text == 'language') {
							language = parser.readValueAs(Object.class);
						} else if (text == 'locked_until') {
							locked_until = parser.readValueAs(Object.class);
						} else if (text == 'opened_at') {
							opened_at = parser.getText();
						} else if (text == 'priority') {
							priority = parser.getIntegerValue();
						} else if (text == 'received_at') {
							received_at = parser.getText();
						} else if (text == 'resolved_at') {
							resolved_at = parser.getText();
						} else if (text == 'status') {
							status = parser.getText();
						} else if (text == 'subject') {
							subject = parser.getText();
						} else if (text == 'type') {
							type_Z = parser.getText();
						} else if (text == 'updated_at') {
							updated_at = parser.getText();
						} else if (text == 'active_at') {
							active_at = parser.getText();
						} else if (text == 'active_attachments_count') {
							active_attachments_count = parser.getIntegerValue();
						} else if (text == 'active_notes_count') {
							active_notes_count = parser.getIntegerValue();
						} else if (text == 'has_pending_interactions') {
							has_pending_interactions = parser.getBooleanValue();
						} else if (text == 'has_failed_interactions') {
							has_failed_interactions = parser.getBooleanValue();
						} else if (text == 'route_status') {
							route_status = parser.getText();
						} else if (text == '_links') {
							x_links = new Links_Z(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Entries consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Custom_fields_Z {
		public Object us_personal_care_range {get;set;} 
		public Object personal_care_range_recommended {get;set;} 
		public Object review {get;set;} 
		public Object pharmaceutical_range_recommended {get;set;} 
		public Object message_source {get;set;} 
		public Object action_taken {get;set;} 
		public String product_query {get;set;} 
		public Object animal_health_range_recommended {get;set;} 
		public Object categories {get;set;} 
		public Object us_health_supplement_range {get;set;} 
		public Object query_type {get;set;} 
		public Object retail_outlets {get;set;} 
		public Object additional_comments {get;set;} 
		public Object nature_of_query {get;set;} 
		public Object indications {get;set;} 

		public Custom_fields_Z(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'us_personal_care_range') {
							us_personal_care_range = parser.readValueAs(Object.class);
						} else if (text == 'personal_care_range_recommended') {
							personal_care_range_recommended = parser.readValueAs(Object.class);
						} else if (text == 'review') {
							review = parser.readValueAs(Object.class);
						} else if (text == 'pharmaceutical_range_recommended') {
							pharmaceutical_range_recommended = parser.readValueAs(Object.class);
						} else if (text == 'message_source') {
							message_source = parser.readValueAs(Object.class);
						} else if (text == 'action_taken') {
							action_taken = parser.readValueAs(Object.class);
						} else if (text == 'product_query') {
							product_query = parser.getText();
						} else if (text == 'animal_health_range_recommended') {
							animal_health_range_recommended = parser.readValueAs(Object.class);
						} else if (text == 'categories') {
							categories = parser.readValueAs(Object.class);
						} else if (text == 'us_health_supplement_range') {
							us_health_supplement_range = parser.readValueAs(Object.class);
						} else if (text == 'query_type') {
							query_type = parser.readValueAs(Object.class);
						} else if (text == 'retail_outlets') {
							retail_outlets = parser.readValueAs(Object.class);
						} else if (text == 'additional_comments') {
							additional_comments = parser.readValueAs(Object.class);
						} else if (text == 'nature_of_query') {
							nature_of_query = parser.readValueAs(Object.class);
						} else if (text == 'indications') {
							indications = parser.readValueAs(Object.class);
						} else {
							System.debug(LoggingLevel.WARN, 'Custom_fields_Z consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Embedded {
		public List<Entries> entries {get;set;} 

		public Embedded(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'entries') {
							entries = arrayOfEntries(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Embedded consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public Integer page {get;set;} 
	public Integer total_entries {get;set;} 
	public Links x_links {get;set;} // in json: _links
	public Embedded x_embedded {get;set;} // in json: _embedded

	public DeskCases(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'page') {
						page = parser.getIntegerValue();
					} else if (text == 'total_entries') {
						total_entries = parser.getIntegerValue();
					} else if (text == '_links') {
						x_links = new Links(parser);
					} else if (text == '_embedded') {
						x_embedded = new Embedded(parser);
					} else {
						System.debug(LoggingLevel.WARN, 'DeskCases consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	
	public static DeskCases parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new DeskCases(parser);
	}
	
	public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || 
				curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT ||
				curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}
	




    private static List<Label_ids> arrayOfLabel_ids(System.JSONParser p) {
        List<Label_ids> res = new List<Label_ids>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Label_ids(p));
        }
        return res;
    }









    private static List<Integer> arrayOfInteger(System.JSONParser p) {
        List<Integer> res = new List<Integer>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(p.getIntegerValue());
        }
        return res;
    }









    private static List<Entries> arrayOfEntries(System.JSONParser p) {
        List<Entries> res = new List<Entries>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Entries(p));
        }
        return res;
    }



    private static List<String> arrayOfString(System.JSONParser p) {
        List<String> res = new List<String>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(p.getText());
        }
        return res;
    }














}