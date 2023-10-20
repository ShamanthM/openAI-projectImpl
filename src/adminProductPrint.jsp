<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1" 
import="dlr.das.web.helper.LanguageBean,
                 dlr.das.web.servlet.BaseServlet,
                 dlr.das.common.helper.DateFormatUtility,
                 java.util.*,
                 java.util.HashMap,
                 java.util.Hashtable" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="dlr.das.util.DASConfigUtil"%>

<style type="text/css">
tr {
	width: 100%;
	overflow-x: scroll;
	position: static;
}

td, th {
	font-size: 8.0pt;
	font-family: "Arial";
	padding-right: 1px;
	text-align: right;
}

.title {
	overflow: visible;
	padding-left: 10px;
	padding-right: 10px;
}
</style>
<div class ="title">
	<h2 align="center">
		<spring:message code="administration.products.admin_page.title"/>
	</h2>
</div>
<div>
<table id="productTable" class="table table-hover autowide autocenter">
		<thead>
			<tr>
				<th><spring:message
						code="administration.products.product_description" /></th>
				<th><spring:message code="administration.products.product_ean" /></th>
				<th><spring:message
						code="administration.products.product_status.active" /></th>
				<th><spring:message
						code="administration.products.organisation_name" /></th>
				<th><spring:message code="administration.products.site_names" /></th>
				<th><spring:message
						code="administration.products.site_short_names" /></th>
				<th><spring:message
						code="administration.products.organisation_reference" /></th>
				<th><spring:message
						code="administration.organisation.sites.site_product_type" /></th>
				<c:if test="${isProductExportFileStandard == true}">
					<th><spring:message
							code="administration.products.product_SKUs" /></th>
				</c:if>
				<th><spring:message code="24007" /></th>
				<th><spring:message code="20811" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="productList" items="${productList}">
				<tr>
					<td><c:out value="${productList.productDescription}" /></td>
					<td><c:out value="${productList.productEAN}" /></td>
					<td><c:out value="${productList.productStatus}" /></td>
					<td><c:out value="${productList.orgNames}" /></td>
					<td><c:out value="${productList.siteNames}" /></td>
					<td><c:out value="${productList.siteShortNames}" /></td>
					<td><c:out value="${productList.orgReferences}" /></td>
					<td><c:out value="${productList.productType}" /></td>
					<c:if test="${isProductExportFileStandard == true}">
						<td><c:out value="${productList.skuDescription}" /></td>
					</c:if>
					<td><fmt:formatDate value="${productList.lastModified}"
							pattern="dd-MM-yyyy HH:mm:ss" /></td>
					<td><c:out value="${productList.deleted==true?'Deleted':''}" />
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<c:if test="${isPrintView}">
<jsp:include page="/common_javascripts.jsp" flush="true"/>
    <link type="text/css"
          href="${pageContext.request.contextPath}/css/bootstrap.css"
          rel="stylesheet"></link>
    <script type="text/javascript">
        $(document).ready(function () {
        	var filename= "${fileName}";
        	document.title=filename;
            window.print();
        });
    </script>
</c:if>
