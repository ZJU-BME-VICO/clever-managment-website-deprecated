package edu.zju.bme.clever.website.controller;

public class FileUploadResult {

	private boolean succeeded;
	private String message;

	public boolean isSucceeded() {
		return succeeded;
	}

	public void setSucceeded(boolean isSucceeded) {
		this.succeeded = isSucceeded;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
