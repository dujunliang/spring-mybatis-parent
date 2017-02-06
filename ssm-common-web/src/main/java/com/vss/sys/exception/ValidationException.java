package com.vss.sys.exception;

import javax.validation.ConstraintViolation;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Set;

/**
 * Whenever a Query is issue to a method which is not supported, this exception
 * will be thrown
 * 
 * @author SPISTEV
 */
public class ValidationException extends BaseException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 130628L;

	private static final String ERROR_CODE = "F-0023";

	private Set<ConstraintViolation<?>> constraintViolations;

	public ValidationException(Set<ConstraintViolation<?>> constraintViolations) {
		super(ERROR_CODE);
		this.constraintViolations = constraintViolations;
		this.setAdditionalContext(toString());
	}
	
	public ValidationException(Serializable key) {
        super(ERROR_CODE, key);
    }


	 @Override
	public String toString() {
		 StringBuilder sb = new StringBuilder();
		 for(ConstraintViolation<?>constraintViolation : constraintViolations){
			 sb.append(constraintViolation.getPropertyPath()+":["+constraintViolation.getMessage()+"] ");
			 sb.append("\n");
		 }
		 return sb.toString();
	}


		
}
