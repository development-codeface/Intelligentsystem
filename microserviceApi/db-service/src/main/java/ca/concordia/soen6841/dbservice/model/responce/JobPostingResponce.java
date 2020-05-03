package ca.concordia.soen6841.dbservice.model.responce;

import java.util.List;

import ca.concordia.soen6841.dbservice.model.JobApplicants;
import ca.concordia.soen6841.dbservice.payloads.InterviewQuestionRequest;

public class JobPostingResponce {
	    private Integer id;

	    private Number minSalary;

	    private Number maxSalary;

	    private String applicationStatus;

	    private String jobDescription;
	    
	    private String jobtitle;

	    private String noOfOpenings;

	    private String contractType;

	    private Integer contractPeriod;
	    
	    private String body;
	    
	    private EmployeeResponce createdEmployee = null;
	    
	    private List<JobApplicants> applications;
	    
	    private List<InterviewQuestionResponce>  questions;

		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
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

		public String getJobtitle() {
			return jobtitle;
		}

		public void setJobtitle(String jobtitle) {
			this.jobtitle = jobtitle;
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

		public void setContractPeriod(Integer contractPeriod) {
			this.contractPeriod = contractPeriod;
		}

		public EmployeeResponce getCreatedEmployee() {
			return createdEmployee;
		}

		public void setCreatedEmployee(EmployeeResponce createdEmployee) {
			this.createdEmployee = createdEmployee;
		}

		public String getBody() {
			return body;
		}

		public void setBody(String body) {
			this.body = body;
		}

		public List<JobApplicants> getApplications() {
			return applications;
		}

		public void setApplications(List<JobApplicants> applications) {
			this.applications = applications;
		}

		public List<InterviewQuestionResponce> getQuestions() {
			return questions;
		}

		public void setQuestions(List<InterviewQuestionResponce> questions) {
			this.questions = questions;
		}
	    
	    

}
