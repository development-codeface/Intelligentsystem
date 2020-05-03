package ca.concordia.soen6841.dbservice.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;

import ca.concordia.soen6841.dbservice.exceptions.EmployeeNotFoundException;
import ca.concordia.soen6841.dbservice.exceptions.JobApplicantsNotFoundException;
import ca.concordia.soen6841.dbservice.exceptions.JobPostingsNotFoundException;
import ca.concordia.soen6841.dbservice.model.Employee;
import ca.concordia.soen6841.dbservice.model.InterviewQuestion;
import ca.concordia.soen6841.dbservice.model.JobApplicants;
import ca.concordia.soen6841.dbservice.model.JobPostings;
import ca.concordia.soen6841.dbservice.model.responce.EmployeeResponce;
import ca.concordia.soen6841.dbservice.model.responce.InterviewQuestionResponce;
import ca.concordia.soen6841.dbservice.model.responce.JobPostingResponce;
import ca.concordia.soen6841.dbservice.payloads.InterviewQuestionRequest;
import ca.concordia.soen6841.dbservice.payloads.JobPostingRequest;
import ca.concordia.soen6841.dbservice.repository.EmployeeRepository;
import ca.concordia.soen6841.dbservice.repository.JobApplicantsPostingsCustomRepositoryImpl;
import ca.concordia.soen6841.dbservice.repository.JobPostingsRepository;

@RestController
@RequestMapping("/jobpostings")
public class JobPostingsController {

	@Autowired
	private JobPostingsRepository jobPostingsRepository;
	
	@Autowired
    private EmployeeRepository employeeRepository;
	
	@Autowired
    private JobApplicantsPostingsCustomRepositoryImpl JobApplicantsPostingsRepository;

	// Get all posted jobs
	@GetMapping("/")
	public List<JobPostingResponce> getJobsPosting() {
		List<JobPostings> posting = jobPostingsRepository.findAll();
		return convertPojo(posting);
	}
	
	// Get job by id
	@GetMapping("/{id}")
	public JobPostingResponce getJobsPostingById(@PathVariable Integer id) {
		JobPostings item = jobPostingsRepository.findById(id)
				.orElseThrow(() -> new JobPostingsNotFoundException(id));
		List<JobApplicants> applicationList = JobApplicantsPostingsRepository.findJobApplicantsByJobPostingId(id)
        .orElseThrow(() -> new JobApplicantsNotFoundException(id));
		JobPostingResponce responce = pojoitem(item);
		System.out.println("No. Applicant >>>"+applicationList.size());
		responce.setApplications(applicationList);
		return responce;
	}
	
	// Get jobs by status
	@GetMapping("/status/{status}")
	public List<JobPostings> getJobsPostingBystatus(@PathVariable String status) {
		return jobPostingsRepository.findJobByStatus(status);
	}
	
	//Get jobs by description
	@GetMapping("/description/{description}")
	public List<JobPostings>getJobPostingByDesc(@PathVariable String description){
		return jobPostingsRepository.findJobByDesc(description);
		
	}

	// Delete Job Post
	@DeleteMapping("/{id}")
	public String deleteEmployee(@PathVariable Integer id) {
		jobPostingsRepository.deleteById(id);
		return "Job post deleted successfully";
	}


	@PostMapping("/postjob")
	public JobPostings postJob(@Valid @RequestBody JobPostingRequest jobPostingRequest) {

		JobPostings jobPosting = new JobPostings();
		jobPosting.setMinSalary(jobPostingRequest.getMinSalary());
		jobPosting.setMaxSalary(jobPostingRequest.getMaxSalary());
		jobPosting.setApplicationStatus(jobPostingRequest.getApplicationStatus());
		jobPosting.setJobDescription(jobPostingRequest.getJobDescription());
		jobPosting.setNoOfOpenings(jobPostingRequest.getNoOfOpenings());
		jobPosting.setContractType(jobPostingRequest.getContractType());
		jobPosting.setContractPeriod(jobPostingRequest.getContractPeriod());
		jobPosting.setJobtitle(jobPostingRequest.getJobtitle());
		jobPosting.setBody(jobPostingRequest.getBody());
		Employee employee = employeeRepository.findById(new Long(jobPostingRequest.getCreatedById()))
                .orElseThrow(() -> new EmployeeNotFoundException(new Long(jobPostingRequest.getCreatedById())));
		
		JobPostings saved = jobPostingsRepository.save(jobPosting);	
		employee.getJobpostings().add(saved);
		employeeRepository.save(employee);
		jobPosting.setId(saved.getId());
		return jobPosting;
	}


	// edit the job post 
	
	 @PutMapping("/{id}")
	    public JobPostings editEmployee(@RequestBody JobPostingRequest newJobPost, @PathVariable Integer id) {
	        return jobPostingsRepository.findById(id)
	        		.map(changedJobPost -> {
	        			
	        			changedJobPost.setMaxSalary(newJobPost.getMaxSalary());
	        			changedJobPost.setMinSalary(newJobPost.getMinSalary());
	        			changedJobPost.setNoOfOpenings(newJobPost.getNoOfOpenings());
	        			changedJobPost.setContractType(newJobPost.getContractType());
	        			changedJobPost.setContractPeriod(newJobPost.getContractPeriod());
	        			changedJobPost.setApplicationStatus(newJobPost.getApplicationStatus());

	        			return jobPostingsRepository.save(changedJobPost);	
	        	
	        		}).orElseGet(() -> {
	        			
	        			newJobPost.setId(id);
	        			JobPostings jobPosting = new JobPostings();
	        			jobPosting.setMinSalary(newJobPost.getMinSalary());
	        			jobPosting.setMaxSalary(newJobPost.getMaxSalary());
	        			jobPosting.setApplicationStatus(newJobPost.getApplicationStatus());
	        			jobPosting.setJobDescription(newJobPost.getJobDescription());
	        			jobPosting.setNoOfOpenings(newJobPost.getNoOfOpenings());
	        			jobPosting.setContractType(newJobPost.getContractType());
	        			jobPosting.setContractPeriod(newJobPost.getContractPeriod());
	        			jobPosting.setJobtitle(newJobPost.getJobtitle());
	        			jobPosting.setBody(newJobPost.getBody());
	        			Employee employee = employeeRepository.findById(new Long(newJobPost.getCreatedById()))
	        	                .orElseThrow(() -> new EmployeeNotFoundException(new Long(newJobPost.getCreatedById())));
	        			
	        			JobPostings saved = jobPostingsRepository.save(jobPosting);	
	        			employee.getJobpostings().add(saved);
	        			
	        			return jobPosting;
	        			 
	        		});
	        
	 } 
	 
	 private List<JobPostingResponce> convertPojo(List<JobPostings> jobpost){
		 List<JobPostingResponce> jobpostReps = new ArrayList<JobPostingResponce>();
		 for (JobPostings jobPostItem : jobpost) {
			 jobpostReps.add(pojoitem(jobPostItem));	 
		}
		 return jobpostReps;
	 }
	 
	 private JobPostingResponce pojoitem(JobPostings jobPostItem) {
		 JobPostingResponce jobPostingitem = new JobPostingResponce();
		 jobPostingitem.setApplicationStatus(jobPostItem.getApplicationStatus());
		 jobPostingitem.setId(jobPostItem.getId());
		 jobPostingitem.setMinSalary(jobPostItem.getMinSalary());
		 jobPostingitem.setMaxSalary(jobPostItem.getMaxSalary());
		 jobPostingitem.setJobDescription(jobPostItem.getJobDescription());
		 jobPostingitem.setJobtitle(jobPostItem.getJobtitle());
		 jobPostingitem.setNoOfOpenings(jobPostItem.getNoOfOpenings());
		 jobPostingitem.setContractPeriod(jobPostItem.getContractPeriod());
		 jobPostingitem.setContractType(jobPostItem.getContractType());
		 jobPostingitem.setBody(jobPostItem.getBody());
		 List<InterviewQuestionResponce> questionlist = new ArrayList<InterviewQuestionResponce>();
		for (InterviewQuestion questionItem : jobPostItem.getQuestions()) {
			InterviewQuestionResponce interviewQ = new InterviewQuestionResponce();
			interviewQ.setAnswer(questionItem.getAnswer());
			interviewQ.setQuestion(questionItem.getQuestion());
			interviewQ.setId(questionItem.getId());
			interviewQ.setIsAnswered(questionItem.getIsAnswered());
			questionlist.add(interviewQ);
		}
		jobPostingitem.setQuestions(questionlist);
		 EmployeeResponce employee = null;
		 for (Employee emplItem : jobPostItem.getCreatedEmployee()) {
			 employee = new EmployeeResponce(emplItem.getUsername(), emplItem.getEmail(), emplItem.getId());
		     break;
		 }
	
		 jobPostingitem.setCreatedEmployee(employee);
		 return jobPostingitem;
	 }

}
