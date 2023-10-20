<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="dlr.das.util.DASConfigUtil"%>

<!-- Cannot be external css see: https://stackoverflow.com/questions/20011873/export-jsp-to-word-with-external-css -->
        <style>
            @page wordSection 
            {
            size:1250.7pt 1250.45pt;
            mso-page-orientation:landscape;
            mso-paper-source:0;
            }
            div.wordSection {page:wordSection;}
			
		  h2{
		  text-align:center;	   
          font-size:14.0pt;
          font-family:"Arial";
          }

           th{
           text-align:left;
           vertical-align:top;
            }
			
            td,th{
            font-size:9.0pt;
            font-family:"Arial";
            }

     <style>

<div class="wordSection">
	<div class="row" style="padding-left: 21px;">
		<div class="title">
			<h2 align="center">
				<spring:message code="administration.products.admin_page.title" />
			</h2>
		</div>
		<jsp:include page="/admin/product/adminProductTable.jsp" flush="true" />
 </div>