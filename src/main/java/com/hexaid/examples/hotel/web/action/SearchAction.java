package com.hexaid.examples.hotel.web.action;

import java.security.Principal;
import java.util.List;

import org.apache.struts2.interceptor.PrincipalAware;
import org.apache.struts2.interceptor.PrincipalProxy;
import org.springframework.beans.factory.annotation.Autowired;

import com.hexaid.examples.hotel.domain.Booking;
import com.hexaid.examples.hotel.domain.Hotel;
import com.hexaid.examples.hotel.service.BookingService;
import com.hexaid.examples.hotel.service.HotelService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author Gabriel Belingueres
 *
 */
public class SearchAction extends ActionSupport implements PrincipalAware {

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private HotelService hotelService;
	
	@Autowired
	private BookingService bookingService;
	
	// inyectado por Struts
	private Principal principal;
	
	// parametros
	private String criteria;

	// resultado
	private List<Hotel> hotelList;
	private List<Booking> bookingList;

	public String show() throws Exception {
		if (principal != null) {
			bookingList = bookingService.getBookingsByUserId(principal.getName());
		}
		return SUCCESS;
	}

	@Override
	public String execute() throws Exception {
		setHotelList(hotelService.search(criteria));
		return "success_result";
	}

	public String getCriteria() {
		return criteria;
	}

	public void setCriteria(String criteria) {
		this.criteria = criteria;
	}

	public List<Hotel> getHotelList() {
		return hotelList;
	}

	public void setHotelList(List<Hotel> hotelList) {
		this.hotelList = hotelList;
	}

	@Override
	public void setPrincipalProxy(PrincipalProxy principalProxy) {
		this.principal = principalProxy.getUserPrincipal();
	}

	public List<Booking> getBookingList() {
		return bookingList;
	}

	public void setBookingList(List<Booking> bookingList) {
		this.bookingList = bookingList;
	}

}
