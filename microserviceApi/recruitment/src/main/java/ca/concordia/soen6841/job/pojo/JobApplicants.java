package ca.concordia.soen6841.job.pojo;

import java.util.Set;


public class JobApplicants {

    private Integer id;

    private String firstName;

    private String lastName;

    private ApplicantStatus status;

    private String email;
    
    private String resumeFile;
    
    private String score;
    
    private Set<JobPostings> postingsApplied;
    

    public Set<JobPostings> getPostingsApplied() {
		return postingsApplied;
	}

	public void setPostingsApplied(Set<JobPostings> postingsApplied) {
		this.postingsApplied = postingsApplied;
	}

	public JobApplicants() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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
    
    
}
