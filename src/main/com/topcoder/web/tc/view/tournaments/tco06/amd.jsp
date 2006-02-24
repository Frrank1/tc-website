<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="sponsors"/>
<jsp:param name="tabLev3" value="amd"/>
</jsp:include>


<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">
            
<div align="center"><img src="/i/tournament/tco06/amd_logo.gif" alt="AMD" border="0" /></div>
<br><br>
AMD is pleased to become the first TopCoder Open sponsor from the financial services industry.  AMD, one of the largest financial services firms in the world, is a leader in equities, corporate finance, M&amp;A advisory and financing, financial structuring, fixed income issuance and trading, foreign exchange, derivatives and risk management.
<br><br>
The global financial markets are increasingly electronic and trading in these markets presents a unique combination of technical and trading challenges.  We are looking for developers to join our team that can work on advanced trading algorithms, build the underlying infrastructure to trade with milliseconds of latency and integrate access to a wide range of global products.
<br><br>
At AMD, you'll have access to the resources and expertise of a global firm while enjoying the flexibility and autonomy of a start-up. The technology we build is responsible for trading every 1 in 9 shares globally*, managing trillions of dollars in assets, and trading across nearly every product and region around the globe.
<br><br>
Become part of our exciting future at AMD. There are positions for extraordinary coders in our offices all over the world. <a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=amd_confirm">Apply Now</a>
<br><br>
<a href="/?t=sponsor&c=link&link=http://www.amd.com/us-en/">www.amd.com</a>
<br><br>
<span class="smallText">* source: AutEx and a leading private industry survey 2005</span>
        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="AMD"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />
</body>

</html>
