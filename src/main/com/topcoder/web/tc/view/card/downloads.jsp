<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Member Card</title>

<jsp:include page="../../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>
    
</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="card"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td class="cardCell" WIDTH="100%">

        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="cards"/>  
           <jsp:param name="image1" value="white"/>  
           <jsp:param name="title" value="Downloads"/>  
        </jsp:include>

         <div class="bodyText">

        <table cellpadding="0" cellspacing="6" border="0" class="bodyText" align="center">
            <tr valign="middle">
                <td class="bodyText" align="center" width="70%"><img src="/i/card/badge1_300x100.gif" border="0"/></td>
                <td class="bodyText" align="left" width="30%"><a href="/i/card/badge1_150x50.gif">150px X 50px</a><br/><a href="/i/card/badge1_300x100.gif">300px X 100px</a><br/><a href="/i/card/badge1_450x150.gif">450px X 150px</a></td>
            </tr>
            <tr valign="middle">
                <td class="bodyText" align="center"><img src="/i/card/badge2_300x100.gif" border="0"/></td>
                <td class="bodyText" align="left"><a href="/i/card/badge2_150x50.gif">150px X 50px</a><br/><a href="/i/card/badge2_300x100.gif">300px X 100px</a><br/><a href="/i/card/badge2_450x150.gif">450px X 150px</a></td>
            </tr>
         </table>

         </div>
         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
