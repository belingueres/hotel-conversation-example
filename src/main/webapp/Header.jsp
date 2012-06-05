<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
			<div class="grid_8">
				<h1 id="branding">
<s:url var="indexUrl" includeContext="true" includeParams="none" namespace="/" action="index" />
					<a href="${indexUrl}">UNLP Viajes</a>
				</h1>
			</div>
			<div class="grid_4" style="text-align: center;">
<s:url var="S2ImageUrl" includeContext="true" includeParams="none" namespace="/" value="/img/struts2.png" />
						<img src="${S2ImageUrl}" alt="Powered by Struts 2" title="Powered by Struts 2" />
			</div>
			<div class="clear"></div>
			<div class="grid_12">
				<ul class="nav main">
					<li>
						<a href="#">Tesina / Autor</a>
					</li>
					<li class="secondary">
<c:choose>
	<c:when test="${empty pageContext.request.remoteUser}">
	  <s:url var="loginUrl" includeContext="true" includeParams="none" namespace="/" action="login" />
						<a href="${loginUrl}" title="Presione aquí para loguearse al sitio y completar su reserva">Ingresar</a>
	</c:when>
	<c:otherwise>
		<s:url var="logoutUrl" includeContext="true" includeParams="none" namespace="/" value="/j_spring_security_logout" />
						<a href="${logoutUrl}" title="Cerrar Sesión">Cerrar Sesión</a>
	</c:otherwise>
</c:choose>
					</li>
				</ul>
			</div>
			<div class="clear"></div>
			<div class="grid_12">
				<h2 id="page-heading">
<c:choose>
	<c:when test="${empty pageContext.request.remoteUser}">
					Bienvenidos a Struts Viajes
	</c:when>
	<c:otherwise>
					¡¡¡Bienvenido a Struts Viajes, ${pageContext.request.remoteUser}!!!
	</c:otherwise>
</c:choose>

				</h2>
			</div>