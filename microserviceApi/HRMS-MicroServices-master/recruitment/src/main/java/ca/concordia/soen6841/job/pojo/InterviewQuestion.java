package ca.concordia.soen6841.job.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class InterviewQuestion {
	
    private Long id;

    private String question;

    private String answer;

	private String isAnswered;

    private JobpostRequest jobpost;
    
    private JobpostRequest injobpost;

	public JobpostRequest getInjobpost() {
		return injobpost;
	}

	public void setInjobpost(JobpostRequest injobpost) {
		this.injobpost = injobpost;
	}

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

	public JobpostRequest getJobpost() {
		return jobpost;
	}

	public void setJobpost(JobpostRequest intquestion) {
		this.jobpost = intquestion;
	}
    
    

}
