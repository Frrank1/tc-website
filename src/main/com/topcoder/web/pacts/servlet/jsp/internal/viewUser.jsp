<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>PACTS</title>
</head>

<body>

<%@ page import="com.topcoder.web.pacts.common.*" %>
<%
	UserProfile user = (UserProfile)
		request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
	NoteHeader[] notes = (NoteHeader[])
		request.getAttribute(PactsConstants.NOTE_HEADER_LIST);
	if (notes == null) {
		notes = new NoteHeader[0];
	}
	if (user == null) {
		out.println("no user!!!<br>");
		user = new UserProfile();
	}
%>

<h1>PACTS</h1>
<h2>View User</h2>

		<table border="0" cellpadding="5" cellspacing="5">
		<tr>
		<td><b>User:</b></td>
<% 			out.print("<td>"+user._header._handle+"</td>\n");
%>
		</tr>

		<tr>
		<td><b>First Name:</b></td>
<% 			out.print("<td>"+user._firstName+"</td>\n");
%>
		</tr>

		<tr>
		<td><b>Middle Name:</b></td>
<% 			out.print("<td>"+user._middleName+"</td>\n");
%>
		</tr>

		<tr>
		<td><b>Last Name:</b></td>
<% 			out.print("<td>"+user._lastName+"</td>\n");
%>
		</tr>

		<tr>
		<td><b>Email:</b></td>
<% 			out.print("<td><a href=\"mailto:"+user._email+"\">"+user._email+"</a></td>\n");
%>
		</tr>

		<tr>
		<td><b>Address 1:</b></td>
<% 			out.print("<td>"+user._address1+"</td>\n");
%>
		</tr>

		<tr>
		<td><b>Address 2:</b></td>
<% 			out.print("<td>"+user._address2+"</td>\n");
%>
		</tr>

		<tr>
		<td><b>City:</b></td>
<% 			out.print("<td>"+user._city+"</td>\n");
%>
		</tr>

		<tr>
		<td><b>State:</b></td>
<% 			out.print("<td>"+user._state+"</td><td>("+user._stateCode+")</td>\n");
%>
		</tr>

		<tr>
		<td><b>Zip Code:</b></td>
<% 			out.print("<td>"+user._zip+"</td>\n");
%>
		</tr>

		<tr>
		<td><b>Country:</b></td>
<% 			out.print("<td>"+user._country+"</td><td>("+user._countryCode+")</td>\n");
%>
		</tr>

		<tr>
		<td><b>Home Phone:</b></td>
<% 			out.print("<td>"+user._homePhone+"</td>\n");
%>
		</tr>

		<td><b>Work Phone:</b></td>
<% 			out.print("<td>"+user._workPhone+"</td>\n");
%>
		</tr>


</table>

<%  if (notes.length > 0) {
	out.println("<form action=\""+PactsConstants.INTERNAL_SERVLET_URL+"\" method=\"post\">");
	out.println("<input type=\"hidden\" name=\""+PactsConstants.TASK_STRING+"\" value=\""+PactsConstants.VIEW_TASK+"\">");
	out.println("<input type=\"hidden\" name=\""+PactsConstants.CMD_STRING+"\" value=\""+PactsConstants.NOTE_CMD+"\">");
	out.println("<input type=\"submit\" value=\"View Note\">");
	out.println("<select name=\""+PactsConstants.NOTE_ID+"\">");
	for (int n = 0; n < notes.length; n++) {
		out.println("<option value=\""+notes[n]._id+"\">"+notes[n]._creationDate+" by "+notes[n]._user._handle+"</option>");
	}
	out.println("</select></form>");
    }
%>
<p>

<% 
   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.LIST_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.PAYMENT_CMD+"&");
   out.println(PactsConstants.USER_ID+"="+user._header._id);
   out.println("\">Search for User's Payments</a><br>");

   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.LIST_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.AFFIDAVIT_CMD+"&");
   out.println(PactsConstants.USER_ID+"="+user._header._id);
   out.println("\">Search for User's Affidavits</a><br>");

   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.LIST_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.CONTRACT_CMD+"&");
   out.println(PactsConstants.USER_ID+"="+user._header._id);
   out.println("\">Search for User's Contracts</a><br>");

   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.LIST_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.USER_TAX_FORM_CMD+"&");
   out.println(PactsConstants.USER_ID+"="+user._header._id);
   out.println("\">Search for User's Tax Forms</a><br>");
   
   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.LIST_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.NOTE_CMD+"&");
   out.println(PactsConstants.IN_DEPTH_HANDLE+"="+user._header._handle);
   out.println("\">In-Depth Search for User's Notes</a><br>");

   out.println("<br>");

   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.ADD_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.NOTE_CMD+"&");
   out.println("object_id="+user._header._id+"&");
   out.println("user_id="+user._header._id+"&");
   out.println("object_type="+PactsConstants.USER_PROFILE_OBJ);
   out.println("\">Add Note</a><br>");

   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.ADD_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.PAYMENT_CMD+"&");
   out.println(PactsConstants.USER_ID+"="+user._header._id);
   out.println("\">Add Payment</a><br>");

   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.ADD_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.AFFIDAVIT_CMD+"&");
   out.println(PactsConstants.USER_ID+"="+user._header._id);
   out.println("\">Add Affidavit</a><br>");

   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.ADD_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.CONTRACT_CMD+"&");
   out.println(PactsConstants.USER_ID+"="+user._header._id);
   out.println("\">Add Contract</a><br>");

   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.ADD_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.USER_TAX_FORM_CMD+"&");
   out.println(PactsConstants.USER_ID+"="+user._header._id);
   out.println("\">Add Tax Form</a><br>");
%>


<jsp:include page="/pacts/internal/InternalFooter.jsp" flush="true" />

</body>

</html>