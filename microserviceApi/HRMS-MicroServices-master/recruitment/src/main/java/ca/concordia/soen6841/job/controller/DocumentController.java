package ca.concordia.soen6841.job.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.gson.GsonAutoConfiguration;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.ObjectMapper;

import ca.concordia.soen6841.job.pojo.ApplicantStatus;
import ca.concordia.soen6841.job.pojo.InterviewQuestion;
import ca.concordia.soen6841.job.pojo.JobApplicants;
import ca.concordia.soen6841.job.pojo.JobPostings;
import ca.concordia.soen6841.job.pojo.JobpostRequest;
import ca.concordia.soen6841.job.pojo.ResponseMetadata;
import ca.concordia.soen6841.job.pojo.ResumeDetail;
import ca.concordia.soen6841.service.StorageService;

@CrossOrigin(origins = "*", allowedHeaders = "*")
@RestController
@RequestMapping(value = "/doc")
public class DocumentController {

	private final StorageService storageService;
	private GsonAutoConfiguration gsonConfig;
	
	@Autowired
	public DocumentController(StorageService storageService, GsonAutoConfiguration gsonConfig) {
		this.storageService = storageService;
		this.gsonConfig     = gsonConfig;
	}
	
	@PostMapping("/upload")
    public ResponseMetadata handleFileUpload(@RequestParam(value="file") MultipartFile file, @RequestParam("jobid") Integer jobId) throws IOException {
		ResponseMetadata result = new ResponseMetadata();
		storageService.store(file);
		
		HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		
		MultiValueMap<String, Object> body
		  = new LinkedMultiValueMap();
		body.add("file", storageService.loadAsResource(file.getOriginalFilename()));
		
		HttpEntity<MultiValueMap<String, Object>> requestEntity
		 = new HttpEntity<>(body, headers);
		
		String serverUrl = "http://lalettan009.ddnsking.com:5000/shortListResume";		 
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate
		  .postForEntity(serverUrl, requestEntity, String.class);
		
		ObjectMapper mapper = new ObjectMapper();
		ResumeDetail[] detailFile = mapper.readValue(response.getBody(), ResumeDetail[].class);
		JobPostings jobDetail = getJobPosting(jobId);
		
		for (ResumeDetail resumeItem : detailFile) {
			
			if(resumeItem.getEmail_id().length > 0) {
				String email = resumeItem.getEmail_id()[0];
				JobApplicants application = new JobApplicants();
				application.setFirstName(email);
				application.setLastName(email);
				application.setStatus(ApplicantStatus.OPEN);
				application.setEmail(email);
				application.setScore(resumeItem.getScore());
				application.setResumeFile(resumeItem.getResumeName());
				Set<JobPostings> postingsApplied = new HashSet<>();
				postingsApplied.add(jobDetail);
				application.setPostingsApplied(postingsApplied);
				
				RestTemplate postingTemp = new RestTemplate();
		        restTemplate.exchange(
		                "http://localhost:8700/jobapplicants/postjobapplicant/",
		                HttpMethod.POST,
		                new HttpEntity<>(application),
		                new ParameterizedTypeReference<String>(){});
			}
		}
		ResponseMetadata responseVal = new ResponseMetadata();
		responseVal.setStatus(400);
		responseVal.setMessage("Upload Document");
		return responseVal;
		
		
    }
	
	@PostMapping("/getquestion")
	public ResponseMetadata getQuestions(@Valid @RequestBody JobpostRequest jobPosting) {
		
		String jobDescrip = jobPosting.getBody();
		String jobId = String.valueOf(jobPosting.getId());
		storageService.store(jobId, "jobdescription.docx", jobPosting.getBody());
		
		HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.MULTIPART_FORM_DATA);
        System.out.println("enter getQuestion ....");
        MultiValueMap<String, Object> body
		  = new LinkedMultiValueMap();
		body.add("resumefile", storageService.loadAsResource(jobId, "jobdescription.docx"));
		body.add("requirementfile", storageService.loadAsResource(jobId, "jobdescription.docx"));
		body.add("domain", jobPosting.getJobDescription());
		body.add("role", jobPosting.getJobtitle());
		
		HttpEntity<MultiValueMap<String, Object>> requestEntity
		 = new HttpEntity<>(body, headers);
		
        
		String serverUrl = "http://lalettan009.ddnsking.com:5000/extractquestionsforinteview";	
		
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate
		  .postForEntity(serverUrl, requestEntity, String.class);
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			String[] questions = mapper.readValue(response.getBody(), String[].class);
			
			for (int i = 0; i < questions.length && i < 60; i++) {
				InterviewQuestion question = new InterviewQuestion();
				question.setQuestion(questions[i]);
				question.setJobpost(jobPosting);
				question.setInjobpost(jobPosting);
				RestTemplate restQuestiontemp = new RestTemplate();
				ResponseEntity<String> questionResult = restQuestiontemp.exchange(
						"http://localhost:8700/interviewquestion/postquestion/",
						HttpMethod.POST,
						new HttpEntity<>(question),
						new ParameterizedTypeReference<String>(){});
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ResponseMetadata responseVal = new ResponseMetadata();
		responseVal.setStatus(400);
		responseVal.setMessage("Question created successfullty");
		return responseVal;
		
		
	}
	
	private JobPostings getJobPosting(Integer id) {
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<JobPostings> response = restTemplate.exchange(
				"http://localhost:8700/jobpostings/" + id,
				HttpMethod.GET,
				null,
				new ParameterizedTypeReference<JobPostings>(){});
		return response.getBody();
	}

}
