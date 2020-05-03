package ca.concordia.soen6841.dbservice.payloads;

import ca.concordia.soen6841.dbservice.model.ApplicantStatus;
import ca.concordia.soen6841.dbservice.model.JobPostings;

import java.util.Set;

import javax.validation.constraints.NotBlank;

public class JobApplicantRequest {

    @NotBlank
    private String firstName;

    @NotBlank
    private String lastName;

    private ApplicantStatus status;
    
    private String resumeFile;
    
    private String score;
    
    private Set<JobPostingRequest> postingsApplied;

    @NotBlank
    private String email;

    public JobApplicantRequest() {

    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public ApplicantStatus getStatus() {
        return status;
    }

    public void setStatus(ApplicantStatus status) {
        this.status = status;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

	public String getResumeFile() {
		return resumeFile;
	}

	public void setResumeFile(String resumeFile) {
		this.resumeFile = resumeFile;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public Set<JobPostingRequest> getPostingsApplied() {
		return postingsApplied;
	}

	public void setPostingsApplied(Set<JobPostingRequest> postingsApplied) {
		this.postingsApplied = postingsApplied;
	}
    
    
}
