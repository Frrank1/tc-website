<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.topcoder.web.common.model.EventType" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%
    String tabLev1 = request.getParameter("tabLev1") == null ? "" : request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2") == null ? "" : request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3") == null ? "" : request.getParameter("tabLev3");
%>

<div>
    <div>
        <div style="margin: 0px 15px 0px 50px; padding: 30px 0px 0px 0px;">
            <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsortrack&d4=description"><img src="/i/tournament/tccc07/tourneyLogo.png" alt="2007 TopCoder Collegiate Challenge" /></a>
        </div>
        <div id="tclogo">
            <a href="/"><img src="/i/tournament/tccc07/topcoderlogo.png" alt="TopCoder&#174;" /></a>
        </div>
        <a style="position: absolute; top: 60px; left: 460px;" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=registerNow"><img src="/i/tournament/tccc07/registerNow.png" alt="REGISTER NOW!" /></a>
    </div>
    
    <div style="margin-top:0px;">

<%--------------PRIMARY NAV---------------%>
        <div align="center">
            <div id="navButtons">

                <div align="center">
                <% if (tabLev1.equals("overview")) {%>
                    <a onfocus="this.blur();" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsortrack&d4=description"><img src="/i/tournament/tccc07/sponsortrack_on.png" alt="Tournament Overview" /></a>
                <% } else { %>
                    <a onfocus="this.blur();" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsortrack&d4=description"><img src="/i/tournament/tccc07/sponsortrack.png" alt="Tournament Overview" /></a>
                <% } %>
                </div>

            </div>
            
<%--------------SECONDARY NAV---------------%>
            <div id="navTextB">&nbsp;</div>
            <div id="navText">
            <% if (tabLev1.equals("overview")) {%>
                <p id="secondaryNav">
                    <a href=""<% if (tabLev2.equals("details")) {%> class="on"<% } %>>Description</a>
                    | <a href=""<% if (tabLev2.equals("schedule")) {%> class="on"<% } %>>Schedule</a>
                    | <a href=""<% if (tabLev2.equals("schedule")) {%> class="on"<% } %>>Rules</a>
                    | <a href=""<% if (tabLev2.equals("schedule")) {%> class="on"<% } %>>Instructions</a>
                    | <a href=""<% if (tabLev2.equals("schedule")) {%> class="on"<% } %>>Register</a>
                    | <a href=""<% if (tabLev2.equals("schedule")) {%> class="on"<% } %>>Registrants</a>
                    | <a href=""<% if (tabLev2.equals("schedule")) {%> class="on"<% } %>>Advancers</a>
                    | <a href=""<% if (tabLev2.equals("schedule")) {%> class="on"<% } %>>Competition Arena</a>
                </p>
            <% } %>

<%--------------TERTIARY NAV---------------%>
            <% if (tabLev1.equals("overview")) {%>
                <% if (tabLev2.equals("advancers")) {%>
                    <p id="tertiaryNav">
                        <a href=""<% if (tabLev3.equals("onsiteschedule")) {%> class="on"<% } %>>Onsite schedule</a>
                    </p>
                <% } %>
            <% } %>
            </div>
            <div id="navTextB">&nbsp;</div>
            
            <div>
                <img src="/i/tournament/tccc07/stylebar.png" alt="stylebar" />
            </div>
        </div>

    </div>
</div>