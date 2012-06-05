package com.hexaid.examples.hotel.web.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.hexaid.examples.hotel.domain.Hotel;
import com.hexaid.examples.hotel.service.HotelService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author Gabriel Belingueres
 *
 */
public class ViewHotelAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	// servicios
	@Autowired
	private HotelService hotelService;
	
	// paramatros
	private Long hotelId;

	// resultados
	private Hotel hotel;

	@Override
	public String execute() throws Exception {
		hotel = hotelService.getHotelById(hotelId);
		if (hotel == null) {
			addActionError("El hotel buscado no existe en nuestra base de datos!");
			return INPUT;
		}
		return SUCCESS;
	}

	public Long getHotelId() {
		return hotelId;
	}

	public void setHotelId(Long hotelId) {
		this.hotelId = hotelId;
	}

	public Hotel getHotel() {
		return hotel;
	}

	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}
	
}