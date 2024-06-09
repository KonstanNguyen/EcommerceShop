package com.ecommerce.error;

@SuppressWarnings("serial")
public class DetectedException extends RuntimeException {
    public DetectedException(String message) {
        super(message);
    }

    public DetectedException(String message, Throwable cause) {
        super(message, cause);
    }
}
