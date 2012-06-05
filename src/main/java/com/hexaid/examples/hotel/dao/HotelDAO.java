package com.hexaid.examples.hotel.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.hexaid.examples.hotel.domain.Hotel;

/**
 * @author Gabriel Belingueres
 * 
 */
public class HotelDAO {

	@PersistenceContext
	private EntityManager em;

	@SuppressWarnings("unchecked")
	public List<Hotel> search(String criteria) {
		String sql = 
				"from Hotel as h where " + 
				"lower(h.name) like :criteria or " +
				"lower(h.address) like :criteria or " +
				"lower(h.city) like :criteria or " +
				"lower(h.state) like :criteria or " +
				"lower(h.zip) like :criteria " +
				"order by h.name";
		Query query = em.createQuery(sql);
		query.setParameter("criteria", "%" + criteria.toLowerCase() + "%");
		return query.getResultList();
	}

	public Hotel getHotelById(Long hotelId) {
		return em.find(Hotel.class, hotelId);
	}

}
