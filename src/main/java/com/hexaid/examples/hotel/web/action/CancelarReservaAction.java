package com.hexaid.examples.hotel.web.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.hexaid.examples.hotel.domain.Booking;
import com.hexaid.examples.hotel.service.BookingService;
import com.hexaid.struts2.annotations.Begin;
import com.hexaid.struts2.annotations.ConversationControl;
import com.hexaid.struts2.annotations.End;
import com.hexaid.struts2.common.ConversationAttributeType;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author Gabriel Belingueres
 *
 */
public class CancelarReservaAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	// servicios inyectados
	//
	@Autowired
	private BookingService bookingService;
	
	// parametros
	//
	private Long bookingId;
	
	@Override
	public void validate() {
		if (bookingId == null || bookingId <= 0) {
			addActionError("El identificador de Reserva es inválido");
		}
	}

	@Override
	@Begin
	@End 
	@ConversationControl(ConversationAttributeType.REQUIRES_NEW)
	public String execute() throws Exception {
		final Booking booking = bookingService.getBookingById(bookingId);
		if (booking == null) {
			addActionError("La reserva con id " + bookingId + " no existe!");
			return INPUT;
		}

		bookingService.cancel(booking);
		addActionMessage("La Reserva id " + booking.getId() + " en el Hotel <b>"
				+ booking.getHotel().getName() + "</b> ha sido eliminada!");
		return SUCCESS;
	}

	public Long getBookingId() {
		return bookingId;
	}

	public void setBookingId(Long bookingId) {
		this.bookingId = bookingId;
	}

}
