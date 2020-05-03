package ca.concordia.soen6841.dbservice.controller;

import ca.concordia.soen6841.dbservice.exceptions.JobApplicantsNotFoundException;
import ca.concordia.soen6841.dbservice.model.ApplicantStatus;
import ca.concordia.soen6841.dbservice.model.JobApplicants;
import ca.concordia.soen6841.dbservice.model.JobPostings;
import ca.concordia.soen6841.dbservice.payloads.JobApplicantRequest;
import ca.concordia.soen6841.dbservice.payloads.JobPostingRequest;
import ca.concordia.soen6841.dbservice.repository.JobApplicantsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("/jobapplicants")
public class JobApplicantsController {

    @Autowired
    private JobApplicantsRepository JobApplicantsRepository;

    // Get all posted jobs
    @GetMapping("/")
    public List<JobApplicants> getJobsApplicants() {
        return JobApplicantsRepository.findAll();
    }

    // Get job by id
    @GetMapping("/{id}")
    public JobApplicants getJobsApplicantsById(@PathVariable Integer id) {
        return JobApplicantsRepository.findById(id)
                .orElseThrow(() -> new JobApplicantsNotFoundException(id));
    }

    // Delete Job Post
    @DeleteMapping("/{id}")
    public String deleteEmployee(@PathVariable Integer id) {
        JobApplicantsRepository.deleteById(id);
        return "Job applicant post deleted successfully";
    }


    @PostMapping("/postjobapplicant")
    public ResponseEntity<?> postJob(@Valid @RequestBody JobApplicantRequest jobPostingRequest) {
    	System.out.println("JobApplicantsController >>>>>>>> "+jobPostingRequest.getScore());
        JobApplicants jobApplicant = new JobApplicants();
        jobApplicant.setEmail(jobPostingRequest.getEmail());
        jobApplicant.setFirstName(jobPostingRequest.getFirstName());
        jobApplicant.setLastName(jobPostingRequest.getLastName());
        jobApplicant.setResumeFile(jobPostingRequest.getResumeFile());
        jobApplicant.setScore(jobPostingRequest.getScore());
        jobApplicant.setStatus(ApplicantStatus.OPEN);
        jobApplicant.setPostingsApplied(convertJobPosting(jobPostingRequest.getPostingsApplied()));
        JobApplicantsRepository.save(jobApplicant);

        return ResponseEntity.status(HttpStatus.OK)
                .body("job applicant posted successfully");
    }


    // edit the job post

    @PutMapping("/{id}")
    public JobApplicants editEmployee(@RequestBody JobApplicants newJobPost, @PathVariable Integer id) {
        return JobApplicantsRepository.findById(id)
                .map(changedJobPost -> {
                    changedJobPost.setFirstName(newJobPost.getFirstName());
                    changedJobPost.setLastName(newJobPost.getLastName());
                    changedJobPost.setEmail(newJobPost.getEmail());
                    changedJobPost.setUpdatedAt(newJobPost.getUpdatedAt());

                    return JobApplicantsRepository.save(changedJobPost);

                }).orElseGet(() -> {

                    newJobPost.setId(id);

                    return JobApplicantsRepository.save(newJobPost);

                });

    }
    
    private  Set<JobPostings> convertJobPosting (Set<JobPostingRequest> postingreq){
    	
    	Set<JobPostings> pojoItemlist = new HashSet<>();
    	for (JobPostingRequest jobPostings : postingreq) {
    		JobPostings jobItem  = new JobPostings();
    		jobItem.setId(jobPostings.getId());
    		jobItem.setMinSalary(jobPostings.getMinSalary());
    		jobItem.setMaxSalary(jobPostings.getMaxSalary());
    		jobItem.setApplicationStatus(jobPostings.getApplicationStatus());
    		jobItem.setJobDescription(jobPostings.getJobDescription());
    		jobItem.setNoOfOpenings(jobPostings.getNoOfOpenings());
    		jobItem.setContractType(jobPostings.getContractType());
    		jobItem.setContractPeriod(jobPostings.getContractPeriod());
    		jobItem.setJobtitle(jobItem.getJobtitle());
    		jobItem.setBody(jobPostings.getBody());
    		
    		pojoItemlist.add(jobItem);
		}
    	return pojoItemlist;
    	
    }
}
