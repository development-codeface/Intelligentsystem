package ca.concordia.soen6841.dbservice.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ca.concordia.soen6841.dbservice.exceptions.JobPostingsNotFoundException;
import ca.concordia.soen6841.dbservice.model.InterviewQuestion;
import ca.concordia.soen6841.dbservice.model.JobPostings;
import ca.concordia.soen6841.dbservice.payloads.InterviewQuestionRequest;
import ca.concordia.soen6841.dbservice.payloads.JobPostingRequest;
import ca.concordia.soen6841.dbservice.repository.InterviewQuestionRepository;
import ca.concordia.soen6841.dbservice.repository.JobPostingsRepository;

@RestController
@RequestMapping("/interviewquestion")
public class InterviewController {
	
	@Autowired
    private InterviewQuestionRepository interviewQuestionRepository;
	
	@Autowired
	private JobPostingsRepository jobPostingsRepository;
	
	@PostMapping("/postquestion")
	public InterviewQuestion postquestion(@Valid @RequestBody InterviewQuestionRequest interviewQuestion) {
		InterviewQuestion interviewQue = new InterviewQuestion();
		interviewQue.setQuestion(interviewQuestion.getQuestion());
		interviewQue.setAnswer(interviewQuestion.getAnswer());
		interviewQue.setIsAnswered("NO");
		interviewQue.setJobpost(getPosting(interviewQuestion.getInjobpost()));
		InterviewQuestion interviewQuestions = interviewQuestionRepository.save(interviewQue);
		return interviewQuestions;
	}
	
	private JobPostings getPosting(JobPostingRequest req) {
		System.out.println("job id >>>"+req.getId());
		 JobPostings jobDetail = jobPostingsRepository.findById(req.getId())
				 .orElseThrow(() -> new JobPostingsNotFoundException(req.getId()));
		 return jobDetail; 
	}

}
