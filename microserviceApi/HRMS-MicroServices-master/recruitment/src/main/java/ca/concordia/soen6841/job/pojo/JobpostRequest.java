package ca.concordia.soen6841.job.pojo;


public class JobpostRequest {
	
	private Integer id;

	private Number minSalary;

	private Number maxSalary;

	private String applicationStatus;

	private String jobDescription;

	private String noOfOpenings;

	private String contractType;

	private Integer contractPeriod;
	
	private Integer createdById;
	
	private String jobtitle;
	
	//private Object createdEmployee = null;
	
	private String body;
	

	public JobpostRequest() {

	}

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

	public Integer getCreatedById() {
		return createdById;
	}

	public void setCreatedById(Integer createdById) {
		this.createdById = createdById;
	}

	public String getJobtitle() {
		return jobtitle;
	}

	public void setJobtitle(String jobtitle) {
		this.jobtitle = jobtitle;
	}

	/*public Object getCreatedEmployee() {
		return createdEmployee;
	}

	public void setCreatedEmployee(Object createdEmployee) {
		this.createdEmployee = createdEmployee;
	}*/

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}


}
