<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

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
			
				<div class="clear"></div>
				
				<display:table name="${hotelList}" id="hotel" requestURI="">
					<display:column property="name" title="Nombre" sortable="true" />
					<display:column property="address" title="Dirección" sortable="true" />
					<display:column title="Ciudad, Prov." sortable="true">${hotel.city}, ${hotel.state}</display:column>
					<display:column property="zip" title="CP" sortable="true" />
					<display:column title="Acción" sortable="true" style="text-align: center">
						<s:url var="urlVer" action="viewHotel" includeContext="true" includeParams="none" namespace="/">
							<s:param name="hotelId">${hotel.id}</s:param>
						</s:url>
						<a href="${urlVer}">Ver</a>
					</display:column>
				</display:table>