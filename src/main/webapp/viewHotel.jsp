<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<div class="box">
	<h2>${hotel.name}</h2>
	<div id="blockquote" class="block" style="margin: 0px;">
		<blockquote>
			<p>
				${hotel.address}<br /> ${hotel.city}, ${hotel.state}, ${hotel.zip}
			</p>
			<p class="cite">
				<cite>${hotel.country}</cite>
			</p>
			<p>Precio por día: $${hotel.price}</p>
		</blockquote>
	</div>
	<s:form action="reservaHotel_showForm" namespace="/protected" includeContext="true" method="POST">
		<input type="hidden" name="hotelId" value="${hotel.id}" />
		<s:submit name="btnSubmit" value="Reservar" cssClass="confirm button" />
	</s:form>
</div>