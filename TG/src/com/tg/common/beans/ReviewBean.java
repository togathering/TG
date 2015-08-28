package com.tg.common.beans;

public class ReviewBean {
	private int reviewNo;
	private int gno;
	private String id;
	private String evaluator;
	private String evaluate;
	private int grade;
	
	public ReviewBean() {
	
	}

	public ReviewBean(int reviewNo, int gno, String id, String evaluator,
			String evaluate, int grade) {
		this.reviewNo = reviewNo;
		this.gno = gno;
		this.id = id;
		this.evaluator = evaluator;
		this.evaluate = evaluate;
		this.grade = grade;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEvaluator() {
		return evaluator;
	}

	public void setEvaluator(String evaluator) {
		this.evaluator = evaluator;
	}

	public String getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(String evaluate) {
		this.evaluate = evaluate;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	
	
}
