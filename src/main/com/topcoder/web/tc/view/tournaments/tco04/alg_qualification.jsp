<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map,
                 com.topcoder.shared.dataAccess.DataAccessConstants"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Open - Computer Programming Tournament</title>
<jsp:include page="../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/TCO04style.css"/>

<% ResultSetContainer rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("tccc04_alg_qual"); %>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="advancers"/>
<jsp:param name="tabLev3" value="qualification"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>

        <p class=pageTitle>Advancers</p>

            <p>Click a column name to sort the list of advancers by that column.</p>

            <table width="500" align="center" border="0" cellpadding="6" cellspacing="0" class="formFrame">
                <tr>
                  <td class="header" width="100%" colspan="5">Qualification Round</td>
               </tr>
                <tr>
                   <td class="testTableTitle_off" width="10%" align="center">
                       <a class="statTextBig" href="/tc?module=SimpleStats&d1=tournaments&d2=tco04&d3=alg_qualification&c=tco04_alg_qual&trans=true&<%=DataAccessConstants.SORT_COLUMN%>=seed&<%=DataAccessConstants.SORT_DIRECTION%>=asc">
                           Seed
                       </a>
                   </td>
                   <td class="testTableTitle_off" width="30%" align="left">
                       <a class="statTextBig" href="/tc?module=SimpleStats&d1=tournaments&d2=tco04&d3=alg_qualification&c=tco04_alg_qual&trans=true&<%=DataAccessConstants.SORT_COLUMN%>=handle_sort&<%=DataAccessConstants.SORT_DIRECTION%>=asc">
                           Handle
                       </a>
                   </td>
                   <td class="testTableTitle_off" width="30%" align="center">
                       <a class="statTextBig" href="/tc?module=SimpleStats&d1=tournaments&d2=tco04&d3=alg_qualification&c=tco04_alg_qual&trans=true&<%=DataAccessConstants.SORT_COLUMN%>=round_name&<%=DataAccessConstants.SORT_DIRECTION%>=asc">
                           Problem Set
                       </a>
                   </td>
                   <td class="testTableTitle_off" width="15%" align="right">
                       <a class="statTextBig" href="/tc?module=SimpleStats&d1=tournaments&d2=tco04&d3=alg_qualification&c=tco04_alg_qual&trans=true&<%=DataAccessConstants.SORT_COLUMN%>=rating&<%=DataAccessConstants.SORT_DIRECTION%>=desc">
                           Rating
                       </a>
                   </td>
                   <td class="testTableTitle_off" width="15%" align="right">
                       <a class="statTextBig" href="/tc?module=SimpleStats&d1=tournaments&d2=tco04&d3=alg_qualification&c=tco04_alg_qual&trans=true&<%=DataAccessConstants.SORT_COLUMN%>=points&<%=DataAccessConstants.SORT_DIRECTION%>=desc">
                           Points
                       </a>
                   </td>
                </tr>


                <%boolean even = false;%>

             </table>

        </div>
		</td>


<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tco04"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../foot.jsp" />

</body>

</html>
