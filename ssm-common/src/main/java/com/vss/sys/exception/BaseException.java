package com.vss.sys.exception;

import java.io.Serializable;

public abstract class BaseException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 130629L;

	private String ERROR_CODE;

	private Serializable additionalContext;

	public BaseException(String errorCode) {
		super();
		this.ERROR_CODE = errorCode;
	}

	public BaseException(String errorCode, Serializable additionalContext) {
		super();
		this.ERROR_CODE = errorCode;
		this.additionalContext = additionalContext;
	}

	public BaseException(String errorCode, Throwable cause) {
		super(cause);
		this.ERROR_CODE = errorCode;
	}

	public BaseException(String errorCode, Serializable additionalContext,
			Throwable cause) {
		super(cause);
		this.ERROR_CODE = errorCode;
		this.additionalContext = additionalContext;
	}

	public String getErrorCode() {
		return ERROR_CODE;
	}

	public Serializable getAdditionalContext() {
		return additionalContext;
	}

	public void setAdditionalContext(Serializable additionalContext) {
		this.additionalContext = additionalContext;
	}
	

}
