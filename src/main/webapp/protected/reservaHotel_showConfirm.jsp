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
    <s:form action="reservaHotel_confirm" namespace="/protected" method="POST">
        <sconv:conversationPropagation mode="join"/>
        <fieldset>
            <legend>Confirmar Hotel</legend>
            <p>
                <label>Ingreso: </label>
                <fmt:formatDate value="${reserva.checkinDate}" pattern="dd/MM/yyyy"/>
            </p>
            <p>
                <label>Egreso: </label>
                <fmt:formatDate value="${reserva.checkoutDate}" pattern="dd/MM/yyyy"/>
            </p>
            <p>
                <label>Camas: </label>
                <s:set var="mapaCamas" value="#{1:'Una cama king size', 2:'Dos camas matrimoniales', 3:'Tres camas simples'}" />
                <s:property value="#mapaCamas[#attr.reserva.beds]"/>
            </p>
            <p>
                <label>Habitación Fumador: </label>
                <s:set var="mapaSmoking" value="#{true:'Fumador', false:'No fumador'}" />
                <s:property value="#mapaSmoking[#attr.reserva.smoking]"/>
            </p>
            <p>
                Comodidades:
                <s:if test="#attr.reserva.amenities.isEmpty()">
                  No se han seleccionado comodidades
                </s:if>
                <s:else>
                  <s:property value="#attr.reserva.amenities.{description}"/>
                </s:else>
            </p>
            <p>
                <label>Medio de pago: </label>
                <s:property value="#{'VISA':'Visa', 'AMEX':'American Express', 'MASTERCARD':'MasterCard', 'DINERS':'Diners'}[#attr.reserva.creditCardName]" />
            </p>
            <p>
                <label>Nro. Tarjeta de Crédito: </label>
                <s:property value="#attr.reserva.creditCardForShow" />
            </p>
            <p>
                <label>Fecha de expiración: </label>
                <s:property value="#{1:'Enero',2:'Febrero',3:'Marzo',4:'Abril',5:'Mayo',6:'Junio',7:'Julio',8:'Agosto',9:'Setiembre',10:'Octubre',11:'Noviembre',12:'Diciembre'}[#attr.reserva.creditCardExpiryMonth]" />
                /
                ${reserva.creditCardExpiryYear}
            </p>
        </fieldset>
        <s:submit name="btnSubmit" value="Reservar" cssClass="confirm button" />
        <s:submit name="btnRevisar" value="Reveer" cssClass="confirm button" action="reservaHotel_showForm" />
        <s:submit name="btnCancel" value="Cancelar" cssClass="confirm button" action="reservaHotel_cancel" />
    </s:form>
</div>