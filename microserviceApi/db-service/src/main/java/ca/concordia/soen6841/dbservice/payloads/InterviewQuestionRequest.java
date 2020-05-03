package ca.concordia.soen6841.dbservice.payloads;

import com.fasterxml.jackson.annotation.JsonIgnore;


public class InterviewQuestionRequest {
	
    private Long id;
	
    private String question;
	
    private String answer;
	
	private String isAnswered;
	
	@JsonIgnore
    private JobPostingRequest jobpost;
	
	private JobPostingRequest injobpost;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getIsAnswered() {
		return isAnswered;
	}

	public void setIsAnswered(String isAnswered) {
		this.isAnswered = isAnswered;
	}

	public JobPostingRequest getJobpost() {
		return jobpost;
	}

	public void setJobpost(JobPostingRequest jobpost) {
		this.jobpost = jobpost;
	}

	public JobPostingRequest getInjobpost() {
		return injobpost;
	}

	public void setInjobpost(JobPostingRequest injobpost) {
		this.injobpost = injobpost;
	}
	
	
    

}
