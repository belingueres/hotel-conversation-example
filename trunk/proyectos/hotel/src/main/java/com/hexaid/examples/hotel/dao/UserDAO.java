package com.hexaid.examples.hotel.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.hexaid.examples.hotel.domain.User;

/**
 * @author Gabriel Belingueres
 * 
 */
public class UserDAO {

	@PersistenceContext
	EntityManager em;

	public User getUserByUsername(final String username) {
		String sql = "from User as u where u.username = :username";
		Query query = em.createQuery(sql);
		query.setParameter("username", username);
		return (User) query.getSingleResult();
	}
}
