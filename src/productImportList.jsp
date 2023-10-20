<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"   import="
	java.util.Hashtable,
	java.util.ArrayList,
	dlr.das.model.ProductStaging,
	dlr.das.web.mvc.controller.product.ProductImportController"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page import="dlr.das.util.DASConfigUtil" %>
<%@ page import="dlr.das.common.helper.FiscalStampsConstants" %>
<%@ page import="dlr.das.model.ProductStaging" %>
<%@ page import="dlr.das.common.dto.GovernmentProductTypeDTO" %>

<jsp:useBean id="message" scope="request" class="java.lang.String" />
<c:set var="message" value="${message}" />
<%
	//Get language property from the session
	Hashtable ht = (Hashtable) session.getAttribute("ht");
	String error = (String) request.getAttribute("ERROR");
	ArrayList productList = (ArrayList) request.getAttribute("productsToStage");
%>
<html>
	<head>
		<style>
			.unMappedStyle{
				color: red;
				font-weight: bold;
			}
		</style>
		<title>${sessionScope.ht['menu.dataentry.void.label']} - De La Rue</title>
		<meta http-equiv="pragma" content="no-cache">
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
		<jsp:include page="/common_stylesheets.jsp" flush="true" />
		<link rel="stylesheet" href='<c:url value="/js/dataTables-1.9.4/media/css/jquery.dataTables_themeroller.css"/>' type="text/css">
	</head>
	<body>		
		<div class="wrapper">				
			
				<div class="container">
				
					<h2><spring:message code="administration.products.importproducts" text="Import Products" /></h2>
					
					<c:choose>
						<c:when test="${status == 'ERROR' || productsToStage.size() == 0}">
							<c:set var="msgClass" value="alert alert-error"/>
							<c:set var="controlClass" value=""/>
						</c:when>
						<c:otherwise>
							<c:set var="msgClass" value="alert alert-info"/>
							<c:set var="controlClass" value="hide"/>
						</c:otherwise>
					</c:choose>
								
					<c:choose>
						<c:when test="${importStatus == 'SUCCESS' }">
							<c:set var="resultMsgClass" value="alert alert-success"/>							
						</c:when>
						<c:otherwise>
							<c:set var="resultMsgClass" value="alert alert-error"/>							
						</c:otherwise>
					</c:choose>
								
					<c:choose>
						<c:when test="${importStatus != '' }">												
							<div id="resultmsg" class="${resultMsgClass}">
							   <c:choose>
							   		<c:when test="${importAction == 'fetchimports'}">
							   			<c:choose>
								   			<c:when test="${importStatus == 'ERROR' }">
								   				<spring:message code="administration.product.fetchunsuccessful" text="Unable to contact FTA system" />													   									   								   							   												   				
								   			</c:when>
							   			</c:choose>							   			
							   		</c:when>
							   		<c:when test="${importAction == 'importproduct' }">
							   			<c:choose>
							   				<c:when test="${importStatus == 'ERROR' }">
							   					<spring:message code="administration.products.importproducterror" text="Unable to import product" />
							   					<c:choose>
							   						<c:when test="${importStatusDetail == 'nomatchingproducttype' }">	
							   							- <spring:message code="administration.products.nomatchingproducttype" text="No matching product type" />
							   						</c:when>							   						
							   					<c:otherwise>
							   						<c:if test="${importStatusDetail == 'duplicateProductId' }">	
							   							- <spring:message code="administration.products.duplicateean" text="Duplicate Product ID" />
							   						</c:if>
							   						<c:if test="${importStatusDetail == 'duplicateProductDescription' }">
							   							- <spring:message code="administration.products.form.same.description.exist" text="Duplicate Product Description" />
						   						    </c:if>
						   						    <c:if test="${importStatusDetail == 'duplicateProductDescriptionAndID' }">
							   							- <spring:message code="administration.products.form.same.description.ID.exist" text="Duplicate Product Description And ID" />
						   						    </c:if>
						   						</c:otherwise>
							   					</c:choose>												   									   								   							   												   				
							   				</c:when>
							   				<c:otherwise>
							   					<spring:message code="administration.products.importproductsuccessful" text="Product imported successfully" />						
							   				</c:otherwise>
							   			</c:choose>
							   		</c:when>
							   		<c:when test="${importAction == 'editproduct' }">
							   			<c:choose>
							   				<c:when test="${importStatus == 'ERROR' }">
							   					<spring:message code="administration.products.importupdateproductunsuccessful" text="Unable to update product" />
							   					<c:choose>
							   						<c:when test="${importStatusDetail == 'nomatchingproducttype' }">	
							   							- <spring:message code="administration.products.nomatchingproducttype" text="No matching product type" />
							   						</c:when>							   						
							   						<c:otherwise>
							   							- <spring:message code="administration.products.nomatchingproductean" text="No matching Product ID" />
							   						</c:otherwise>
							   					</c:choose>															   		
							   				</c:when>
							   				<c:otherwise>
							   					<spring:message code="administration.products.importupdateproductsuccessful" text="Organisation updated successfully" />													   		
							   				</c:otherwise>
							   			</c:choose>											   		
							   		</c:when>
							   		<c:otherwise>		
							   			<c:choose>
							   				<c:when test="${importStatus == 'ERROR' }">
							   					<spring:message code="administration.products.deleteproductunsuccessful" text="Unable to update product" />
							   					<c:choose>
							   						<c:when test="${importStatusDetail == 'nomatchingproductean' }">	
							   							- <spring:message code="administration.products.nomatchingproductean" text="No matching Product ID" />
							   						</c:when>							   													   						
							   					</c:choose>															   		
							   				</c:when>
							   				<c:otherwise>
							   					<spring:message code="administration.products.deleteproductsuccessful" text="Product deleted successfully" />												   		
							   				</c:otherwise>
							   			</c:choose>															   									   											   											   		
							   		</c:otherwise>
							   </c:choose>
							</div>							
						</c:when>
					</c:choose>
					
					<div id="msg" class="${msgClass}">
						<c:choose>
							<c:when test="${productsToStage != null && productsToStage.size() > 0 }">
								<spring:message code="administration.products.pleasechooseproduct" text="Choose product to import" />
							</c:when>
							<c:otherwise>			
								<spring:message code="administration.products.noproductssavailable" text="No products available" />
							</c:otherwise>
						</c:choose>
					</div>
					
					<div style="margin-bottom: 10px;">
						<a href="<c:url value="/spring/admin/importproduct/fetch" />" class="btn btn-success" style="display: inline-block;"><i class="icon-plus icon-white"></i> <%=ht.get("32007")%></a>											
					</div>	
										
						<c:choose>
							<c:when test="${productsToStage.size() == 0}">
								<a class="btn" href="${pageContext.request.contextPath}/spring/admin/product/list?reference=productsAdmin"><i class="icon-chevron-left"></i><spring:message code="dataentry.orders.back" text="Back"/></a>
							</c:when>
							<c:otherwise>								
								<div class="guttered">
									<input type="hidden" id="isAuthorityProductTypeValuesEnabled" name="isAuthorityProductTypeValuesEnabled"
										   value="${isAuthorityProductTypeValuesEnabled}"/>
				                  <table class="table table-bordered table-hover table-striped" id="productsStagingTable" style="display: none;">
					                  	<thead>
						                  	<tr> 
						 		            	<th id="productDescription">${sessionScope.ht['administration.products.product_description']}</th>
						 		            	<th id="productType">${sessionScope.ht['724']}</th>
												<c:if test="${isAuthorityProductTypeValuesEnabled}">
													<th id="authorityProductType">${sessionScope.ht['administration.product.authority.product.type.label']}</th>
												</c:if>
						                      	<th id="trn">${sessionScope.ht['administration.products.product_id']}</th>
											 	<th id="status">${sessionScope.ht['administration.products.product_ean']}</th>	
											 	<th id="status">${sessionScope.ht['administration.products.product_status']}</th>											 	
											 	<th id="action">${sessionScope.ht['administration.organisation.requiredaction']}</th>	                      	
						                    </tr>
					                    </thead>
					                    <tbody>
					                    	<c:forEach var="product" items="${productsToStage}" varStatus="loop">
					                    		<tr>
							                      <td>${product.productDescription}</td>
													<c:choose>
														<c:when test="${isAuthorityProductTypeValuesEnabled}">
															<td>${governmentProductTypes.get(loop.index).governmentProductTypeName}</td>
															<c:if test="${not empty governmentProductTypes.get(loop.index).governmentProductTypeName}">
																<td>${product.productType}</td>
															</c:if>
															<c:if test="${empty governmentProductTypes.get(loop.index).governmentProductTypeName}">
																<td class="unMappedStyle">${product.productType}</td>
															</c:if>
														</c:when>
														<c:otherwise>
															<td>${product.productType}</td>
														</c:otherwise>
													</c:choose>

							                      <td>${product.importedProductId}</td>

													<td>
							                      	<c:choose>
							                      		<c:when test="${product.productEAN == ''}">
															<input id="${product.importedProductId}" type="text" maxLength="${configProductIDCodeMaxLength}" onkeyup="EANInputChange(this);" data-onload="${product.importedProductId}"/>
														</c:when>
														<c:otherwise>
															${product.productEAN}
														</c:otherwise>
							                      	</c:choose>
							                      </td>     
							                      <td>${product.status}</td>
							                      <td>
								                      <c:choose>
														<c:when test="${product.status == 'Add' }">
															<form name="chooseOrg" method="POST" action="import"/>
																<button type="submit" id="${product.importedProductId}_import" class="btn btn-primary ${product.importedProductId}_button">
																	<i class="icon-plus icon-white"></i>
																	<spring:message code="32007" text="Submit"/>
																</button>	
																<input type="hidden" id="selectedProduct" name="selectedProduct" value="${product.productId}">
																<input type="hidden" class="${product.importedProductId}_editProductEAN" name="editedProductEAN"/>
															</form>																											
														</c:when>
														<c:when test="${product.status == 'Update' }">
															<form name="chooseOrg" method="POST" action="edit"/>										
																<button type="submit" id="${product.importedProductId}_update" class="btn ${product.importedProductId}_button">
																	<i class="icon-pencil"></i>
																	<spring:message code="46" text="Submit"/>
																</button>				
																<input type="hidden" id="selectedProduct" name="selectedProduct" value="${product.productId}">
																<input type="hidden" class="${product.importedProductId}_editProductEAN" name="editedProductEAN"/>
															</form>			
														</c:when>
														<c:otherwise>	
															<form name="chooseProduct" method="POST" action="delete"/>										
																<button type="submit" id="${product.importedProductId}_delete" class="btn btn-danger ${product.importedProductId}_button">
																	<i class="icon-trash icon-white"></i> <spring:message code="47" text="Submit"/>
																</button>				
																<input type="hidden" id="selectedProduct" name="selectedProduct" value="${product.productId}">
																<input type="hidden" class="${product.importedProductId}_editProductEAN" name="editedProductEAN"/>
															</form>																																																		
														</c:otherwise>
													 </c:choose>														 													 																									
												 </td>	                      							                     
							                   </tr>
											</c:forEach>
					                    </tbody>
					              </table>
					           </div>	
					           <div class="container">
									<c:import url="/genericPaginationForm.jsp"/>
							   </div>							
							</c:otherwise>
						</c:choose>																													
				</div>			
		</div>
		<jsp:include page="/common_javascripts.jsp" flush="true" />
		<script src='<c:url value="/js/dataTables-1.9.4/media/js/jquery.dataTables.min.js"/>' type="text/javascript"></script>
			
		<jsp:include page="/common/dataTableLabelSetup.jsp" flush="true" />	
    	<script src='<c:url value="/js/productImport.js"/>' type="text/javascript"></script>		
	</body>
</html>


