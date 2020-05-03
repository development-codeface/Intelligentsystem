package ca.concordia.soen6841.dbservice.model.responce;


public class InterviewQuestionResponce {
	
	 private Long id;
		
	    private String question;
		
	    private String answer;
		
		private String isAnswered;

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
}
