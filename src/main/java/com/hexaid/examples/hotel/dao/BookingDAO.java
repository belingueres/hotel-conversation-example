package com.hexaid.examples.hotel.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.hexaid.examples.hotel.domain.Booking;

/**
 * @author Gabriel Belingueres
 *
 */
public class BookingDAO {

	@PersistenceContext
	private EntityManager em;

	public void saveBooking(Booking reserva) {
		em.persist(reserva);
	}

	@SuppressWarnings("unchecked")
	public List<Booking> getBookingsByUserId(String username) {
		final String sql = 
				"from Booking as b join fetch b.hotel where b.user.username = :username order by b.checkinDate";
		Query query = em.createQuery(sql);
		query.setParameter("username", username);
		return query.getResultList();
	}

	public void remove(final Booking booking) {
		em.remove(booking);
	}

	public Booking getBookingById(final Long bookingId) {
		return em.find(Booking.class, bookingId);
	}

}
