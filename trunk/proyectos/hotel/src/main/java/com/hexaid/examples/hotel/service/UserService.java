/**
 * 
 */
package com.hexaid.examples.hotel.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.hexaid.examples.hotel.dao.UserDAO;
import com.hexaid.examples.hotel.domain.User;

/**
 * @author Gabriel Belingueres
 * 
 */
public class UserService {

	@Autowired
	private UserDAO userDAO;

	public User getUserByUsername(final String username) {
		return userDAO.getUserByUsername(username);
	}
}