<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<s:if test="hasActionErrors()">
  <s:actionerror/>
</s:if>

<s:actionmessage escape="false" />

				<div class="box">
					<h2>Busqueda de Hoteles:</h2>
					<div class="block" id="forms">

<s:form action="search_execute" namespace="/" includeContext="true" method="POST">
							<fieldset class="login">
								<legend>Búsqueda</legend>
								<p>
									<label>Criterio: </label>
									<s:textfield name="criteria" size="40" />
								</p>
								<s:submit name="btnSubmit" value="Buscar" cssClass="confirm button" />
							</fieldset>
</s:form>

					</div>
				</div>
				
<security:authorize ifAllGranted="ROLE_USER">
        <div class="box">
          <h2>Reservas de Hoteles realizadas:</h2>
          
          <s:if test="bookingList.isEmpty()">
            No se encontraron Reservas
          </s:if>
          <s:else>
		        <div class="clear"></div>
		        
		        <display:table name="${bookingList}" id="booking" requestURI="">
		          <display:column property="hotel.name" title="Hotel" />
		          <display:column property="hotel.address" title="Dirección" />
		          <display:column title="Ciudad, Prov." >${booking.hotel.city}, ${booking.hotel.state}</display:column>
              <display:column property="checkinDate" title="Ingreso" format="{0,date,dd/MM/yyyy}" />
              <display:column property="checkoutDate" title="Egreso" format="{0,date,dd/MM/yyyy}" />
              <display:column property="id" title="Id" />
		          
		          <display:column title="Acción" >
		            <s:url var="urlCancel" action="cancelBooking" includeContext="true" includeParams="none" namespace="/protected">
		              <s:param name="bookingId">${booking.id}</s:param>
		            </s:url>
		            <a href="${urlCancel}" onclick='return confirm("¿Realmente desea cancelar la reserva en ${booking.hotel.name}?");'>Cancelar</a>
		          </display:column>
		        </display:table>
          </s:else>
        </div>
</security:authorize>