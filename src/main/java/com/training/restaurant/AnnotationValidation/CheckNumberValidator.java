package com.training.restaurant.AnnotationValidation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class CheckNumberValidator implements ConstraintValidator<CheckNumber, String> {

    @Override
    public boolean isValid(String s, ConstraintValidatorContext constraintValidatorContext) {
        return s != null && s.matches("\\d") && s.length() > 0;
    }

    @Override
    public void initialize(CheckNumber constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation);
    }
}
