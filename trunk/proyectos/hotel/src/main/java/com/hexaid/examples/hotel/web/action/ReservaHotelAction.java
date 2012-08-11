package com.hexaid.examples.hotel.web.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.struts2.interceptor.PrincipalAware;
import org.apache.struts2.interceptor.PrincipalProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.DataBinder;
import org.springframework.validation.FieldError;
import org.springframework.validation.Validator;

import com.hexaid.examples.hotel.domain.Booking;
import com.hexaid.examples.hotel.domain.Hotel;
import com.hexaid.examples.hotel.domain.User;
import com.hexaid.examples.hotel.service.BookingService;
import com.hexaid.examples.hotel.service.HotelService;
import com.hexaid.examples.hotel.service.UserService;
import com.hexaid.struts2.annotations.Begin;
import com.hexaid.struts2.annotations.ConversationAttribute;
import com.hexaid.struts2.annotations.End;
import com.hexaid.struts2.annotations.In;
import com.hexaid.struts2.annotations.Out;
import com.hexaid.struts2.common.ConversationAttributeType;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author Gabriel Belingueres
 * 
 */
public class ReservaHotelAction extends ActionSupport implements PrincipalAware {

    private static final long serialVersionUID = 1L;

    // servicios
	@Autowired
	private HotelService hotelService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BookingService bookingService;
	
	@Autowired
	private Validator validator;

	// valores inyectados
	private PrincipalProxy principalProxy;

	// parametros
	private Long hotelId;

	// variables de contexto
	@In
	@Out
	private Hotel currentHotel;

	@In
	@Out
	private Booking reserva;
	
	public void validateShowForm() {
		if (currentHotel == null) {
			if (hotelId == null) {
				addActionError("El identificador de hotel no está presente!");
			}
			else if (hotelId <= 0) {
				addActionError("El identificador de hotel es inválido!");
			}
		}
	}

	@Begin
	public String showForm() {
		if (currentHotel == null) {
			currentHotel = hotelService.getHotelById(hotelId);
			if (currentHotel == null) {
				addActionError("El hotel buscado no existe en nuestra base de datos!");
				return INPUT;
			}
		}

		if (reserva == null) {
			// crear nueva reserva:
			// obtener el usuario logueado
			final String username = principalProxy.getRemoteUser();
			final User currentUser = userService.getUserByUsername(username);
			if (currentUser == null) {
				addActionError("El usuario '" + username + "' ya no existe en nuestra base de datos!");
				return INPUT;
			}

			reserva = createBooking(currentUser);
		}
		
		return SUCCESS;
	}

	public void validateShowConfirm() {
	    DataBinder binder = new DataBinder(reserva, "reserva");
	    binder.setValidator(validator);
	    // validate the target object
	    binder.validate();

	    // get BindingResult that includes any validation errors
	    BindingResult results = binder.getBindingResult();
	    for(FieldError error : results.getFieldErrors()) {
	        String fieldName = "reserva." + error.getField();
	        String messageCode = reserva.getClass().getSimpleName().toLowerCase() + '.' + error.getField() + '.' + error.getCode();
            String message = getText(messageCode);
            addFieldError(fieldName, message);
	    }
	    
		// validar fecha de expiración tarjeta
		final Calendar calendar = Calendar.getInstance();
		// mes con base 1 (1 a 12)
		final int currentMonth = calendar.get(Calendar.MONTH) + 1;
		final int currentYear = calendar.get(Calendar.YEAR);
		
		if(reserva.getCreditCardExpiryYear() < currentYear || 
				(reserva.getCreditCardExpiryYear() == currentYear && reserva.getCreditCardExpiryMonth() < currentMonth)) {
			addFieldError(
					"reserva.creditCardExpiryMonth", 
					"La fecha de vencimiento de su tarjeta de crédito es inválida");
		}
		
		//TODO: Validar tarjeta de crédito
	}

	@ConversationAttribute(ConversationAttributeType.MANDATORY)
	public String showConfirm() {
		return SUCCESS;
	}

	@ConversationAttribute(ConversationAttributeType.MANDATORY)
	@End
	public String confirm() {
		// salva la reserva en la base de datos
		bookingService.saveBooking(reserva);
		
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		
		addActionMessage(
				"La reserva en el hotel <b>" + currentHotel.getName()
				+ "</b> desde el día " + df.format(reserva.getCheckinDate()) + " al "
				+ df.format(reserva.getCheckoutDate())
				+ " ha sido salvada exitosamente.");
		
		// retornando SUCCESS se termina la conversación
		return SUCCESS;
	}
	
	@ConversationAttribute(ConversationAttributeType.MANDATORY)
	@End(beforeRedirect=true, commit=false)
	public String cancel() {
		return SUCCESS;
	}

	private Booking createBooking(final User currentUser) {
		final Booking booking = new Booking(currentHotel, currentUser);
		
		Calendar cal = Calendar.getInstance();
		// a partir de mañana
		cal.add(Calendar.DAY_OF_MONTH, 1);
		booking.setCheckinDate(cal.getTime());
		
		// hasta pasado mañana
		cal.add(Calendar.DAY_OF_MONTH, 1);
		booking.setCheckoutDate(cal.getTime());
		
		booking.setSmoking(false);
		
		return booking;
	}

	public Long getHotelId() {
		return hotelId;
	}

	public void setHotelId(Long hotelId) {
		this.hotelId = hotelId;
	}

	@Override
	public void setPrincipalProxy(PrincipalProxy principalProxy) {
		this.principalProxy = principalProxy;
	}

	public Booking getReserva() {
		return reserva;
	}

	public void setReserva(Booking reserva) {
		this.reserva = reserva;
	}
	
	public List<Integer> getAvailableYearsCreditCard() {
		final List<Integer> list = new ArrayList<Integer>();
		final int currentYear = Calendar.getInstance().get(Calendar.YEAR);
		for(int i=currentYear; i < currentYear+20; ++i) {
			list.add(i);
		}
		return list;
	}

}
