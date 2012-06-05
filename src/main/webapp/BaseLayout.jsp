<%--
response.addHeader("Cache-Control","no-cache, no-store, max-age=0");
response.addHeader("Pragma","no-cache");
response.addDateHeader("Expires", 1);
--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>UNLP Viajes <tiles:insertAttribute name="title" ignore="true" /></title>
		<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1" />
		<link rel="stylesheet" type="text/css" href="<s:url includeContext="true" includeParams="none" namespace="/" value="/css/reset.css" />" media="screen" />
		<link rel="stylesheet" type="text/css" href="<s:url includeContext="true" includeParams="none" namespace="/" value="/css/text.css" />" media="screen" />
		<link rel="stylesheet" type="text/css" href="<s:url includeContext="true" includeParams="none" namespace="/" value="/css/960.css" />" media="screen" />
		<link rel="stylesheet" type="text/css" href="<s:url includeContext="true" includeParams="none" namespace="/" value="/css/layout.css" />" media="screen" />
		<link rel="stylesheet" type="text/css" href="<s:url includeContext="true" includeParams="none" namespace="/" value="/css/nav.css" />" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" type="text/css" href="<s:url includeContext="true" includeParams="none" namespace="/" value="/css/ie6.css" />" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" type="text/css" href="<s:url includeContext="true" includeParams="none" namespace="/" value="/css/ie.css" />" media="screen" /><![endif]-->
		<link rel="stylesheet" type="text/css" href="<s:url includeContext="true" includeParams="none" namespace="/" value="/css/hotel.css" />" media="screen" />
	</head>
	<body>
		<div class="container_12">

			<tiles:insertAttribute name="header" />

			<div class="clear"></div>

			<tiles:insertAttribute name="menu" />

			<tiles:insertAttribute name="body" />

			<tiles:insertAttribute name="footer" />