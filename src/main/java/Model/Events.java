package Model;

public class Events {
	int event_id;
	String event_img;
	 String event_name;
	 int event_cost;
	 String event_details;
	 String event_category;
	 String date;
	 public int getEvent_id() {
	 return event_id;
	 }
	 public String getEvent_img() {
		 return event_img;
		 }
	 
	 public String getEvent_name() {
	 return event_name;
	 }
	 public int getEvent_cost() {
	 return event_cost;
	 }
	 public String getEvent_details() {
	 return event_details;
	 }
	 
	 public String getEvent_category() {
	 return event_category;
	 }
	 public String getDate() {
		 return date;
		 }
	 public void setEvent_id(int event_id) {
	 this.event_id = event_id;
	 }
	 public void setEvent_img(String event_img) {
		 this.event_img = event_img;
		 }
	 public void setEvent_name(String event_name) {
	 this.event_name = event_name;
	 }
	 public void setEvent_cost(int event_cost) {
	 this.event_cost = event_cost;
	 }
	 public void setEvent_details(String event_details) {
	 this.event_details = event_details;
	 }
	 public void setEvent_category(String event_category) {
		 this.event_category = event_category;
		 }
	 public void setDate(String date) {
	 this.date = date;
	 }
	}