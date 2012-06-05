package com.hexaid.examples.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hexaid.examples.hotel.dao.HotelDAO;
import com.hexaid.examples.hotel.domain.Hotel;

/**
 * @author Gabriel Belingueres
 *
 */
public class HotelService {
	
	@Autowired
	private HotelDAO hotelDAO;

	public List<Hotel> search(String criteria) {
		return hotelDAO.search(criteria);
	}

	public Hotel getHotelById(Long hotelId) {
		return hotelDAO.getHotelById(hotelId);
	}

}
