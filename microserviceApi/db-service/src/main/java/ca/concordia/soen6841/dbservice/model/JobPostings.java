package ca.concordia.soen6841.dbservice.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;


@Entity
@Table(name = "JobPostings")
public class JobPostings extends AuditModel {
    @Id
    @GeneratedValue
    @Column(name = "id")
    private Integer id;

    @Column(name = "min_salary")
    private Number minSalary;

    @Column(name = "max_salary")
    private Number maxSalary;

    @Column(name = "application_status")
    private String applicationStatus;

    @Column(name = "job_description")
    private String jobDescription;
    
    @Column(name = "job_title")
    private String jobtitle;

    @Column(name = "no_of_openings")
    private String noOfOpenings;

    @Column(name = "contract_type")
    private String contractType;

    @Column(name = "contract_period")
    private Integer contractPeriod;
    
    @Column(name = "body",length = 30000)
    private String body;
    
    
    @ManyToMany(mappedBy = "jobpostings")
    private Set<Employee> createdEmployee = new HashSet<>();
    
    @JsonBackReference
    public Set<Employee> getCreatedEmployee() {
		return createdEmployee;
	}
    
    @OneToMany(mappedBy="jobpost", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JsonManagedReference
    private Set<InterviewQuestion> questions;
    
    
	public void setCreatedEmployee(Set<Employee> createdEmployee) {
		this.createdEmployee = createdEmployee;
	}

	public JobPostings() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getJobtitle() {
		return jobtitle;
	}

	public void setJobtitle(String jobtitle) {
		this.jobtitle = jobtitle;
	}

	public Number getMinSalary() {
        return minSalary;
    }

    public void setMinSalary(Number minSalary) {
        this.minSalary = minSalary;
    }

    public Number getMaxSalary() {
        return maxSalary;
    }

    public void setMaxSalary(Number maxSalary) {
        this.maxSalary = maxSalary;
    }

    public String getApplicationStatus() {
        return applicationStatus;
    }

    public void setApplicationStatus(String applicationStatus) {
        this.applicationStatus = applicationStatus;
    }

    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

    public String getNoOfOpenings() {
        return noOfOpenings;
    }

    public void setNoOfOpenings(String noOfOpenings) {
        this.noOfOpenings = noOfOpenings;
    }

    public String getContractType() {
        return contractType;
    }

    public void setContractType(String contractType) {
        this.contractType = contractType;
    }

    public Integer getContractPeriod() {
        return contractPeriod;
    }

    public void setContractPeriod(Integer number) {
        this.contractPeriod = number;
    }


	public String getBody() {
		return body;
	}


	public void setBody(String body) {
		this.body = body;
	}

	public Set<InterviewQuestion> getQuestions() {
		return questions;
	}

	public void setQuestions(Set<InterviewQuestion> questions) {
		this.questions = questions;
	}
	
	
    
    
}
