package com.price.exceptions;

import lombok.Builder;
import org.springframework.http.HttpStatus;

@Builder
public class BusinessException extends RuntimeException {
    private final HttpStatus status;
    private final String message;
}
