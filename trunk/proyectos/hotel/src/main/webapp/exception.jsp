<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<div class="box">
	<h2>Ha ocurrido un error inesperado:</h2>
	<div class="block">
		<s:if test="hasActionErrors()">
			<s:actionerror />
		</s:if>
		<s:if test="exception != null">
			<p><s:property value="exception" /></p>
		</s:if>
	</div>
</div>

<div class="clear"></div>

<div class="box">
	<h2 class="errorMessage">
		<a href="#" id="toggle-grid" class="visible">Más información</a>
	</h2>
	<div class="block errorMessage hidden" id="grid">
		<s:if test="exception != null">
			<s:property value="exceptionStack" />
		</s:if>
	</div>
</div>