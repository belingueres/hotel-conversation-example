package com.hexaid.examples.hotel.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import com.hexaid.examples.hotel.domain.Booking;

/**
 * @author Gabriel Belingueres
 *
 */
public class BookingDateRangeValidator implements ConstraintValidator<BookingDateRange, Booking> {

    public void initialize(BookingDateRange bookingDateRange) {
    }

    public boolean isValid(Booking booking, ConstraintValidatorContext context) {
	if ((booking.getCheckinDate() != null) && (booking.getCheckoutDate() != null)
		&& booking.getCheckoutDate().before(booking.getCheckinDate())) {
	    return false;
	}
	return true;
    }

}