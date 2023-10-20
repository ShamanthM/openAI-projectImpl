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


<style>
.bold {
    font-weight: bold;
    text-align: center;
}
.header{
    font-size:25px;
    font-weight:bold;
}
.margin{
    margin-bottom: 30px;
}
.title{
font-size:12.0pt;
font-family:"Arial";
overflow:visible;
padding-left:10px;
padding-right:10px;
}
th,td{
font-size:9.0pt;
font-family:"Arial";
text-align:left;
vertical-align:top;
}
</style>

<c:if test="${locale== 'NonArabic'}">
<div class ="title">
    <h2 align="left">
        <spring:message code="administration.products.admin_page.title"/>
    </h2>
</div>
</c:if>
<c:if test="${locale== 'Arabic'}">
<div class ="title">
    <h2 align="right">
        <spring:message code="administration.products.admin_page.title"/>
    </h2>
</div>
</c:if>
 <jsp:include page="/admin/product/adminProductTable.jsp" flush="true" />
 