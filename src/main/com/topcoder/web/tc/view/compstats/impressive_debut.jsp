<%@ include file = "includes.jsp"%>

<div class="fixedWidthBody">

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Component Competition Record Book"/>
</jsp:include>

<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result");
String type = (String)request.getParameter("type");
if (type == null) type = HandleTag.COMPONENT; %>

<div style="float:right;"><A href="/tc?module=Static&d1=compstats&d2=comp_recordbook_home"  class="bodyText">back to table of contents</A></div>
<jsp:include page="dev_design_no_overall_links.jsp"/>
<br><br>
<strong>Record:</strong> Best debut rating.  This rating is based on the coder's first rating.
<br><br>
<table class="stat" cellpadding="0" cellspacing="0" width="100%" style="float: left; margin-bottom: 15px;">
    <tr><td class="title" colspan="5">Impressive Debut</td></tr>
    <tr>
        <td class="headerC">Rank</td>
        <td class="header">Coder</td>
        <td class="headerR">Debut Rating</td>
        <td class="header">Challenge</td>
        <td class="headerC">Date</td>           
       </tr>

    <% boolean even = false; %>
    <rsc:iterator list="<%=rsc%>" id="row">
        <tr class="<%=even?"dark":"light"%>">
        <td class="valueC"><rsc:item name="rank" row="<%=row%>"/></td>
        <td class="value"><tc-webtag:handle coderId='<%=row.getLongItem("coder_id")%>' context='<%=type%>'/></td>
        <td class="valueR"><rsc:item name="rating" row="<%=row%>" format="0"/></td>
        <td class="value"><A href="/tc?module=ProjectDetail&pj=<rsc:item name="project_id" row="<%=row%>"/>&tab=results"><rsc:item name="name" row="<%=row%>"/></A></td>
        <td class="valueR"><rsc:item name="date" row="<%=row%>" format="MM.dd.yyyy"/></td>
        </tr>
    <% even = !even;%>
    </rsc:iterator>
</table>

</div>
</html>
