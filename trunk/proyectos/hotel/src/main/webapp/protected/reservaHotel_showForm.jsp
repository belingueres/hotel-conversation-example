<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/conversation-struts2-tags" prefix="sconv" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<sconv:useConversation/>

<div class="grid_3">
	<h2>${currentHotel.name}</h2>
	<div id="blockquote" class="block" style="margin: 0px;">
		<blockquote>
			<p>
				${currentHotel.address}<br /> ${currentHotel.city}, ${currentHotel.state}, ${currentHotel.zip}
			</p>
			<p class="cite">
				<cite>${currentHotel.country}</cite>
			</p>
			<p>Precio por día: $${currentHotel.price}</p>
		</blockquote>
	</div>
</div>

<div class="grid_5">
  <sconv:form action="reservaHotel_showConfirm" namespace="/protected" includeContext="true" method="POST">
		<fieldset>
		    <s:fielderror fieldName="reserva.checkinDate" />
			<legend>Reservar Hotel</legend>
			<p>
				<label>Ingreso: </label>
				<fmt:formatDate var="fecha" value="${reserva.checkinDate}" pattern="dd/MM/yyyy"/>
				<s:textfield name="reserva.checkinDate" value="%{#attr.fecha}" maxlength="10" />
			</p>
			<p>
                <s:fielderror fieldName="reserva.checkoutDate" />
				<label>Egreso: </label>
                <fmt:formatDate var="fecha" value="${reserva.checkoutDate}" pattern="dd/MM/yyyy"/>
				<s:textfield name="reserva.checkoutDate" value="%{#attr.fecha}" maxlength="10" />
			</p>
			<p>
                <s:fielderror fieldName="reserva.beds" />
				<label>Camas: </label>
				<s:select name="reserva.beds" list="#{'1':'Una cama king size', '2':'Dos camas matrimoniales', '3':'Tres camas simples'}" />
			</p>
			<p style="text-align: center;">
                <s:fielderror fieldName="reserva.smoking" />
				<s:radio name="reserva.smoking" list="#{true:'Fumador', false:'No fumador'}" cssStyle="width: 1em" />
			</p>
			<p>
				Comodidades:
				<s:checkboxlist name="reserva.amenities" 
				    list="#attr.reserva.availableAmenities"
				    listValue="description"
				    cssStyle="width: 1em" />
			</p>
			<p>
                <s:fielderror fieldName="reserva.creditCardName" />
				<label>Medio de pago: </label>
				<s:select name="reserva.creditCardName" list="#{'VISA':'Visa', 'AMEX':'American Express', 'MASTERCARD':'MasterCard', 'DINERS':'Diners'}" />
			</p>
			<p>
		        <s:fielderror fieldName="reserva.creditCard" />
				<label>Nro. Tarjeta de Crédito: </label>
				<s:textfield name="reserva.creditCard" />
			</p>
			<p>
				<label>Fecha de expiración: </label>
				<s:select name="reserva.creditCardExpiryMonth" 
				    list="#{1:'Enero',2:'Febrero',3:'Marzo',4:'Abril',5:'Mayo',6:'Junio',7:'Julio',8:'Agosto',9:'Setiembre',10:'Octubre',11:'Noviembre',12:'Diciembre'}" />
				<s:select list="availableYearsCreditCard" name="reserva.creditCardExpiryYear" size="1" />
                <s:fielderror fieldName="reserva.creditCardExpiryMonth" />
                <s:fielderror fieldName="reserva.creditCardExpiryYear" />
			</p>
		</fieldset>
		<s:submit name="btnSubmit" value="Reservar" cssClass="confirm button" />
    <s:submit name="btnCancel" value="Cancelar" cssClass="confirm button" action="reservaHotel_cancel" />
  </sconv:form>
</div>