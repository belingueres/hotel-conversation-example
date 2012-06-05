<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="org.springframework.security.web.WebAttributes" %>
<%@ page import="org.springframework.security.core.AuthenticationException" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

        <div class="box">
          <h2>
            Formularios de Ingreso
          </h2>
          <div class="block" id="login-forms">
<c:if test="${not empty param.login_error}">
  <div class="errorMessage">
    Su intento de ingreso no fue exisoto, intente nuevamente.<br />
    Razón:
    <s:set var="AUTHENTICATION_EXCEPTION_KEY" scope="page" value="@org.springframework.security.web.WebAttributes@AUTHENTICATION_EXCEPTION"/>
    <s:text name="%{#attr.AUTHENTICATION_EXCEPTION_KEY}" />
  </div>
</c:if>
            <form action="${pageContext.request.contextPath}/j_spring_security_check" method="POST">
              <fieldset class="login">
                <legend>Ingreso</legend>
                <p class="notice">Ingrese para completar su reserva.</p>
                <p>
                  <label for="j_username">Usuario: </label>

                  <input type="text" name="j_username"
                  <c:if test="${not empty param.login_error}">value="<%= session.getAttribute(WebAttributes.LAST_USERNAME) %>"</c:if>
                   />
                </p>
                <p>
                  <label for="j_password">Contraseña: </label>
                  <input type="password" name="j_password" />
                </p>
                <p>
                	<label for="_spring_security_remember_me">Recordarme por dos semanas: </label>
					        <input type="checkbox" name="_spring_security_remember_me" id="remember_me" style="width: 1em;" /> 
                </p>
                <input class="login button" type="submit" value="Ingreso" />
              </fieldset>
            </form>
            <form action="">
              <fieldset>
                <legend>Registrarse</legend>
                <p>Si todavía no posee una cuenta, por favor cree una nueva para registrarse.</p>
                <input type="submit" value="Crear Cuenta" />
              </fieldset>
            </form>

          </div>
        </div>