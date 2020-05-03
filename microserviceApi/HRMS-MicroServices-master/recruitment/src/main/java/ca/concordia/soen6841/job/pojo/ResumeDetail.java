package ca.concordia.soen6841.job.pojo;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ResumeDetail {
	@JsonProperty("ResumeName")
	private String ResumeName;
	
	@JsonProperty("Score")
	private String Score;
	
	@JsonProperty("email_id")
	private String[] email_id;
	
	public String getResumeName() {
		return ResumeName;
	}
	public void setResumeName(String ResumeName) {
		this.ResumeName = ResumeName;
	}
	public String getScore() {
		return Score;
	}
	public void setScore(String Score) {
		this.Score = Score;
	}
	public String[] getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String[] email_id) {
		this.email_id = email_id;
	}
	

}
