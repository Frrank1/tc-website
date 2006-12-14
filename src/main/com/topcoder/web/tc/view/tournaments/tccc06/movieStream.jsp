<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="onsite_events"/>
<jsp:param name="tabLev3" value="movies"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<span class="bigTitle">Onsite Movies</span>

<script type="text/javascript">
function getURLParam(param) {
 var val = "";
 var qs = window.location.search;
 var start = qs.indexOf(param);

 if (start != -1) {
  start += param.length + 1;
  var end = qs.indexOf("&", start);
  if (end == -1) {
   end = qs.length
  }
  val = qs.substring(start,end);
 }
 return val;
}

var myClip = null;
myClip = getURLParam('clip');

document.write(' <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="550" height="400" id="webcast" align="middle"> ');
document.write(' <param name="allowScriptAccess" value="always" /> ');
document.write(' <param name="movie" value="/flash/tournament/tccc06/webcast.swf?clip='+myClip+'" /> ');
document.write(' <param name="quality" value="high" /> ');
document.write(' <param name="bgcolor" value="#000000" /> ');
document.write(' <embed src="/flash/tournament/tccc06/webcast.swf?clip='+myClip+'" quality="high" bgcolor="#000000" width="550" height="400" name="webcast" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" /> ');
document.write(' </object> ');
</script>


        </div>
      </td>
        
         
<!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="../right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
