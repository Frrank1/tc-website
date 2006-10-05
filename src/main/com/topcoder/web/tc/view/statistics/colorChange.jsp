<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% ResultSetContainer changeList = (ResultSetContainer) request.getAttribute("change_list");%>
<HTML>
<HEAD>
    <TITLE>TopCoder Statistics</TITLE>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <jsp:include page="../script.jsp"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</HEAD>
<BODY>
<jsp:include page="../top.jsp"/>
<table WIDTH="100%" border="0" CELLPADDING="0" CELLSPACING="0">
<tr>
<td WIDTH="180" VALIGN="top">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="algo_color_changes"/>
    </jsp:include>
</TD>
<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Recent Handle Color Changes - Algorithm"/>
</jsp:include>

<div align="center">
    <strong>
        <A href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ColorChange" class="bcLink">All
            changes</A>
        |
        <c:if test="${request[color]=='Gray'}"><span class="selected"></c:if>
        <A href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ColorChange&amp;<%=Constants.COLOR%>=Gray" class="coderTextGray">New
            grays</A>
        <c:if test="${request[color]=='Gray'}"></span></c:if>

        |
        <c:if test="${request[color]=='Green'}"><span class="selected"></c:if>
        <A href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ColorChange&amp;<%=Constants.COLOR%>=Green" class="coderTextGreen">New
            greens</A>
        <c:if test="${request[color]=='Green'}"></span></c:if>

        |
        <c:if test="${request[color]=='Blue'}"><span class="selected"></c:if>
        <A href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ColorChange&amp;<%=Constants.COLOR%>=Blue" class="coderTextBlue">New
            blues</A>
        <c:if test="${request[color]=='Blue'}"></span></c:if>

        |
        <c:if test="${request[color]=='Yellow'}"><span class="selected"></c:if>
        <A href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ColorChange&amp;<%=Constants.COLOR%>=Yellow" class="coderTextYellow">New
            yellows</A>
        <c:if test="${request[color]=='Yellow'}"></span></c:if>

        |
        <c:if test="${request[color]=='Red'}"><span class="selected"></c:if>
        <A href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ColorChange&amp;<%=Constants.COLOR%>=Red" class="coderTextRed">New
            reds</A>
        <c:if test="${request[color]=='Red'}"></span></c:if>
    </strong>
</div>

<div class="pagingBox">
    &lt;&lt; prev
    | next &gt;&gt;
</div>
<table cellpadding="0" cellspacing="0" class="stat" width="100%">
    <tbody>
        <tr>
            <td class="title" colspan="5">
                Recent Handle Color Changes
            </td>
        </tr>
        <tr>
            <td class="header" width="50%">
                <A href="">Handle</A>
            </td>
            <td class="header" width="50%">
                <A href="">Event</A>
            </td>
            <td class="headerC" nowrap="nowrap">
                <A href="">Old Rating</A>
            </td>
            <td class="headerC" nowrap="nowrap">
                <A href="">New Rating</A>
            </td>
            <td class="headerC" nowrap="nowrap">
                <a onmouseover="document.images['up_or_down'].src = '/i/interface/up_or_down_on.png';" onmouseout="document.images['up_or_down'].src = '/i/interface/up_or_down.png';" href=""><img src="/i/interface/up_or_down.png" alt="" name="up_or_down" border="0"/></a>
            </td>
        </tr>
        <% boolean even = true; %>
        <% even = !even; %>

        <rsc:iterator list="<%=changeList%>" id="resultRow">
            <tr class="<%=even?"dark":"light"%>">
                <td class="value">
                    <tc-webtag:handle coderId="<%=resultRow.getLongItem("user_id")%>" context="${context}"/>
                </td>
                <td class="value">
                    <A href="/stat?c=coder_room_stats&cr=7504863&rd=9995&rm=249379">
                        <rsc:item name="short_name" row="<%=resultRow%>"/>
                    </A>
                </td>
                <td class="valueC"><span class="coderText<rsc:item name="old_color" row="<%=resultRow%>"/>"><rsc:item name="old_rating" row="<%=resultRow%>"/></span>
                </td>
                <td class="valueC"><span class="coderText<rsc:item name="new_color" row="<%=resultRow%>"/>"><rsc:item name="new_rating" row="<%=resultRow%>"/></span>
                </td>
                <td class="valueC" style="vertical-align: middle;">
                    <% if (resultRow.getBooleanItem("color_increase")) { %>
                    <img src="/i/interface/greenUp.gif" alt="Up"/>
                    <% } else { %>
                    <img src="/i/interface/redDown.gif" alt="Down"/>
                    <% } %>
                </td>
            </tr>
            <% even = !even; %>
        </rsc:iterator>
    </tbody>
</table>
<div class="pagingBox">
    &lt;&lt; prev
    | next &gt;&gt;
</div>

</div>
</TD>
<td WIDTH="180" VALIGN="top">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="profile"/>
    </jsp:include>
</TD>
<!-- Gutter -->
<td WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" border="0"/></TD>
<!-- Gutter Ends -->
</tr>
</TABLE>
<jsp:include page="../foot.jsp"/>
</BODY>
</HTML>