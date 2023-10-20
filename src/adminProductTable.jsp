<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1"  %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="dlr.das.util.DASConfigUtil"%>

<style>
.table  table table-hover autowide autocenter {
border-collapse: collapse;
width: 100%;
}            
th,td{
font-size:9.0pt;
font-family:"Arial";
text-align:left;
vertical-align:top;
}
.excel_data_value_string{   
    mso-number-format:"\@";
}
<c:if test="${locale!= 'Arabic'}">
#productTable td{
text-align:left;
}
</c:if>
<c:if test="${locale== 'Arabic'}">
.table table-hover autowide autocenter arabic{
border-collapse: collapse;
width: 100%;	
}
th,td{
font-size:9.0pt;
font-family:"Arial";
vertical-align:top;
padding-right: 3px; 
text-align: right;
}
#productTable td{
text-align:right;
}
</c:if>
</style>
<div class="table">
	<c:if test="${locale== 'NonArabic'}">
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
						<td class="excel_data_value_string"><c:out
								value="${productList.productDescription}" /></td>
						<td  class="excel_data_value_string"><c:out value="${productList.productEAN}" />
						</td>
						<td><c:out value="${productList.productStatus}" />
						</td>
						<td><c:out value="${productList.orgNames}" /></td>
						<td><c:out value="${productList.siteNames}" />
						</td>
						<td><c:out value="${productList.siteShortNames}" />
						</td>
						<td><c:out value="${productList.orgReferences}" />
						</td>
						<td><c:out value="${productList.productType}" />
						</td>
						<c:if test="${isProductExportFileStandard == true}">
							<td><c:out
									value="${productList.skuDescription}" /></td>
						</c:if>
						<td><fmt:formatDate
								value="${productList.lastModified}"
								pattern="dd-MM-yyyy HH:mm:ss" /></td>
						<td><c:out
								value="${productList.deleted==true?'Deleted':''}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	<c:if test="${locale== 'Arabic'}">
		<c:choose>
			<c:when test="${IS_ARABIC_EXCEL_WORD}">
				<table id="productTable"
					class="table table-hover autowide autocenter arabic">
					<thead>
						<tr>
							<th><spring:message code="20811" /></th>
							<th><spring:message code="24007" /></th>
							<c:if test="${isProductExportFileStandard == true}">
								<th><spring:message
										code="administration.products.product_SKUs" /></th>
							</c:if>
							<th><spring:message
									code="administration.organisation.sites.site_product_type" /></th>
							<th><spring:message
									code="administration.products.organisation_reference" /></th>
							<th><spring:message
									code="administration.products.site_short_names" /></th>
							<th><spring:message
									code="administration.products.site_names" /></th>
							<th><spring:message
									code="administration.products.organisation_name" /></th>
							<th><spring:message
									code="administration.products.product_status.active" /></th>
							<th><spring:message
									code="administration.products.product_ean" /></th>
							<th><spring:message
									code="administration.products.product_description" /></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="productList" items="${productList}">
							<tr>
								<td><c:out
										value="${productList.deleted==true?'Deleted':''}" /></td>
								<td><fmt:formatDate value="${productList.lastModified}"
										pattern="dd-MM-yyyy HH:mm:ss" /></td>

								<c:if test="${isProductExportFileStandard == true}">
									<td><c:out value="${productList.skuDescription}" /></td>
								</c:if>
								<td><c:out value="${productList.productType}" /></td>

								<td><c:out value="${productList.orgReferences}" /></td>

								<td><c:out value="${productList.siteShortNames}" /></td>
								<td><c:out value="${productList.siteNames}" /></td>
								<td><c:out value="${productList.orgNames}" /></td>
								<td><c:out value="${productList.productStatus}" /></td>
								<td  class="excel_data_value_string"><c:out value="${productList.productEAN}" /></td>

								<td class="excel_data_value_string"><c:out value="${productList.productDescription}" /></td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
		</c:choose>
	</c:if>
</div>