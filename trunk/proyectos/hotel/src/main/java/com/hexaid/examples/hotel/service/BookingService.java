package com.hexaid.examples.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hexaid.examples.hotel.dao.BookingDAO;
import com.hexaid.examples.hotel.domain.Booking;

/**
 * @author Gabriel Belingueres
 *
 */
public class BookingService {
	
	@Autowired
	private BookingDAO bookingDAO;

	public void saveBooking(Booking reserva) {
		bookingDAO.saveBooking(reserva);
	}

	public List<Booking> getBookingsByUserId(final String username) {
		return bookingDAO.getBookingsByUserId(username);
	}

	public void cancel(final Booking booking) {
		bookingDAO.remove(booking);
	}

	public Booking getBookingById(final Long bookingId) {
		return bookingDAO.getBookingById(bookingId);
	}

}
