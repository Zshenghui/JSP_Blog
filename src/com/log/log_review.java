package com.log;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class log_review {
	private int logid;
	private String review_id;
	private String review_details;
	private String review_time;
	public int getlogid(){
		return logid;
	}
	public void setlogid(int logid){
		this.logid=logid;
	}
	public String getreview_id(){
		return review_id;
	}
	public void setreview_id(String review_id){
		this.review_id=review_id;
	}
	public String getreview_details(){
		return review_details;
	}
	public void setreview_details(String review_details){
		this.review_details=review_details;
	}
	public String getreview_time(){
		return review_time;
	}
	public void setreview_time(Timestamp review_time){
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date= df.format(review_time);
		System.out.println(date);
		this.review_time=date;
	}
}
