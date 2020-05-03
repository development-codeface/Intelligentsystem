package ca.concordia.soen6841.dbservice.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "interviewQuestions")
public class InterviewQuestion {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
	
	@Column(name = "question")
    @NotBlank
    private String question;
	
	@Column(name = "answer")
    private String answer;
	
	@Column(name = "result")
	private String isAnswered;
	
	
	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)	
	@JsonBackReference
    @JoinColumn(name="jobposting_id", nullable=false)
    private JobPostings jobpost;
	
	

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

	public JobPostings getJobpost() {
		return jobpost;
	}

	public void setJobpost(JobPostings jobpost) {
		this.jobpost = jobpost;
	}


	
	

}
