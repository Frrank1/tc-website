<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.privatelabel.view.tag.DemographicInput,
                 com.topcoder.web.common.BaseProcessor, 
                 com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="/privatelabel.tld" prefix="pl" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.FullRegInfo" scope="session" />
<jsp:usebean id="questionList" class="java.util.List" scope="request" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/google04.css"/>
<title>Google Code Jam 2004, Powered by TopCoder</title>
<jsp:include page="../script.jsp" />
</head>
<body>

<SCRIPT type="text/javascript">
function submitEnter(e) {
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;
    if (keycode == 13) {
     document.frmLogin.submit();
     return false;
    } else return true;
  }
</SCRIPT>

<table border=0 width=100% cellpadding=0 cellspacing=0>
	<tr>
		<td width="49%">&#160;</td>
		<td align=center>
			<table border=0 width=100% cellpadding=0 cellspacing=0>
				<tr>
					<td width="49%"></td>
					<td valign=bottom align=center><img border=0 src="/i/events/google2004/codejamLogo.gif" alt="Google Code Jam logo"></td>
					<td width="49%" valign=bottom align=right><a href="/"><img align="right" src="/i/events/google2003/google_pbtc.gif" border="0"></a></td>
				</tr>
			</table>
		</td>
		<td width="49%"></td>
	</tr>
	<tr>
		<td width="49%">&#160;</td>
		<td>
			<div class=greenBigBox>
			
			<!-- Tab bar links-->
			<div align=center>
			<jsp:include page="links.jsp" >
			<jsp:param name="selectedTab" value="registration"/>
			</jsp:include>
			</div>


			<br/><br/>
			<span class=bigTitle>Registration</span>

			<table cellpadding="0" cellspacing="5" class="bodyText" align="center" width="100%" border="0">
			<form action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>" method="POST" name="regForm" enctype="multipart/form-data">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.GOOGLE04_REG_CONFIRM%>"/>
            <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="CompanyId"/>"/>
            <input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="EventId"/>"/>
            <pl:questionIterator id="question" list="<%=questionList%>">
                <tr>
                    <td colspan="2" class="errorText" align="center">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.DEMOG_PREFIX+question.getId()%>"><%=err%><br/></tc-webtag:errorIterator>
                    </td>
                </tr>
                <tr>
                    <td align="right" nowrap>
                        <%=question.getText()%>
                    </td>
                    <td align="left">
                        <pl:demographicInput question="<%=question%>"/>
                    </td>
               </tr>
            </pl:questionIterator>
           <tr>
                <td colspan="2" class="errorText" align="center">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.FILE%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
           <tr>
                <td align="right" nowra> 
                    Resume
                </td>
                <td align="left">
                    <input type=file name="Resume">
                </td>
           </tr>
            <tr>
               <td colspan="2" align="center">
                  <p align="center"><a href="javascript: document.regForm.submit();">Submit</a></p>
               </td>
            </tr>
         </form>
         </table>

			<br/><br/>
			To find out more detailed information about the Google Code Jam 2004, including a list of the prizes, please read the <a href="/pl/?&module=Static&d1=google04&d2=rules">Terms and Conditions</a>.
			</div>
		</td>
		<td width="49%">&#160;</td>
	<tr>
</table>
<jsp:include page="foot.jsp" />
</body>
</html>