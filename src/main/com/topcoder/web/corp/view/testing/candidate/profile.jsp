<%@ page import="com.topcoder.web.corp.common.Constants,java.util.List,
                 com.topcoder.web.corp.common.JSPUtils"%>
<%@ taglib uri="screening.tld" prefix="screen" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Topcoder | Testing Application Management Tool</title>

<jsp:include page="../includes/script.jsp"/>

<SCRIPT LANGUAGE="JavaScript">
<!--
var MM_contentVersion = 6;
var MM_FlashCanPlay = false;
var plugin = (navigator.mimeTypes
              && navigator.mimeTypes["application/x-shockwave-flash"])
            ? navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin : 0;
if ( plugin ) {
  var words = navigator.plugins["Shockwave Flash"].description.split(" ");
  for (var i = 0; i < words.length; ++i) {
    if (isNaN(parseInt(words[i])))
      continue;
    var MM_PluginVersion = words[i];
  }
  MM_FlashCanPlay = MM_PluginVersion >= MM_contentVersion;
} else if (navigator.userAgent && navigator.userAgent.indexOf("MSIE")>=0
           && (navigator.appVersion.indexOf("Win") != -1)) {
  document.write('<SCR' + 'IPT LANGUAGE=VBScript\> \n');
  document.write('on error resume next \n');
  document.write('MM_FlashCanPlay = ( IsObject(CreateObject');
  document.write('("ShockwaveFlash.ShockwaveFlash." & MM_contentVersion)))\n');
  document.write('</SCR' + 'IPT\> \n');
}
//-->
</SCRIPT>

<SCRIPT TYPE="text/javascript">
<!--
function getProblemDetail(id) {
    var width = screen.availWidth * 2 / 3;
    var height = screen.availHeight / 2;
    var left = (screen.availWidth - width) / 2;
    var top = 0;
    var cmd = "toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes,top="
        + top + ",left=" + left + ",width=" + width + ",height=" + height + ",status=0";
    var name="problemDetail";

    window.open('/corp/testing/?module=PopulateProblemDetail&roundProblemId='+id,name,cmd);
    return;
  }
-->
</SCRIPT>

</HEAD>
<body>

<!-- Header begins -->
<%--<jsp:include page="../includes/top.jsp" />--%>
<jsp:include page="../includes/top.jsp" />
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- gutter begins -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Middle column begins -->
        <td width="100%" align="center"><img src="/i/corp/clear.gif" width="200" height="11" alt="" border="0"><br>
            <table border="0" cellspacing="0" cellpadding="0" width="700">
                <tr valign="top">
                    <td class="bodyText">
                        <p class=testHead>Candidate Info</p>
                    </td>
                </tr>
            </table>

            <table cellspacing="0" cellpadding="0" width="700" class="screeningFrameNB">
                <tr>
                    <td valign=top class=screeningCellBG>

                    <table cellspacing="0" cellpadding="0" border=0 class=bodyText width="100%">

                        <!-- Personal info -->
                        <tr>
                            <td class="screeningHeader" colspan=2>Personal Info</td>
                        </tr>
                        <screen:resultSetRowIterator id="row"
                            list="<%=(List) request.getAttribute(Constants.CANDIDATE_PERSONAL_INFO)%>">
                        <tr>
                            <td class="screeningCellOdd" align=right nowrap=nowrap>First Name:</td>
                            <td class="screeningCellOdd" width="100%">
                                <screen:resultSetItem row="<%=row%>" name="first_name" />
                            </td>
                        </tr>
                        <tr>
                            <td class="screeningCellEven" align=right nowrap=nowrap>Middle Initial:</td>
                            <td class="screeningCellEven">
                                <screen:resultSetItem row="<%=row%>" name="middle_name" />
                            </td>
                        </tr>
                        <tr>
                            <td class="screeningCellOdd" align=right nowrap=nowrap>Last Name:</td>
                            <td class="screeningCellOdd">
                                <screen:resultSetItem row="<%=row%>" name="last_name" />
                            </td>
                        </tr>
                        </screen:resultSetRowIterator>

                        <screen:resultSetRowIterator id="row"
                                list="<%=(List) request.getAttribute(Constants.CANDIDATE_EMAIL)%>">
                        <tr>
                            <!-- Email address -->
                            <td class="screeningCellEven" align=right nowrap=nowrap>Email Address:</td>
                            <td class="screeningCellEven">
                                <screen:resultSetItem row="<%=row%>" name="email_address" />
                            </td>
                        </tr>
                        </screen:resultSetRowIterator>

                        <!-- Address info -->
                        <screen:resultSetRowIterator id="row"
                                list="<%=(List) request.getAttribute(Constants.CANDIDATE_ADDRESS_INFO)%>">
                        <tr>
                            <td class="screeningCellOdd" align=right>Address 1:</td>
                            <td class="screeningCellOdd">
                                <screen:resultSetItem row="<%=row%>" name="address1" />
                            </td>
                        </tr>
                        <tr>
                            <td class="screeningCellEven" align=right>Address 2:</td>
                            <td class="screeningCellEven">
                                <screen:resultSetItem row="<%=row%>" name="address2" />
                            </td>
                        </tr>
                        <tr>
                            <td class="screeningCellOdd" align=right>Address 3:</td>
                            <td class="screeningCellOdd">
                                <screen:resultSetItem row="<%=row%>" name="address3" />
                            </td>
                        </tr>
                        <tr>
                            <td class="screeningCellEven" align=right>City:</td>
                            <td class="screeningCellEven">
                                <screen:resultSetItem row="<%=row%>" name="city" />
                            </td>
                        </tr>
                        <tr>
                            <td class="screeningCellOdd" align=right>State / Province:</td>
                            <td class="screeningCellOdd">
                                <screen:resultSetItem row="<%=row%>" name="state_code" />
                            </td>
                        </tr>
                        <tr>
                            <td class="screeningCellEven" align=right>Zip Code:</td>
                            <td class="screeningCellEven">
                                <screen:resultSetItem row="<%=row%>" name="zip" />
                            </td>
                        </tr>
                        <tr>
                            <td class="screeningCellOdd" align=right>Country:</td>
                            <td class="screeningCellOdd">
                                <screen:resultSetItem row="<%=row%>" name="country_name" />
                            </td>
                        </tr>
                        </screen:resultSetRowIterator>

                        <screen:resultSetRowIterator id="row"
                                list="<%=(List) request.getAttribute(Constants.CANDIDATE_PREFERENCE_INFO)%>">
                        <tr>
                            <td class="screeningCellEven" align=right>Preference Level:</td>
                            <td class="screeningCellEven" valign=middle>
<SCRIPT language="JavaScript">
<!--
if ( MM_FlashCanPlay ) {
                    document.write(' <object ');
                    document.write(' classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ');
                    document.write(' codebase="http://fpdownload.macromedia.com" ');
                    document.write('/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" ');
                    document.write(' width="80" ');
                    document.write(' height="12" ');
                    document.write(' id="tc_card" ');
                    document.write(' align="middle">');
                    document.write(' <param name="allowScriptAccess" value="sameDomain" />');
                    document.write(' <param name="movie" ');
                    document.write(' value="/i/corp/screeningRatingEven.swf?preference=<screen:resultSetItem row="<%=row%>" name="level"/>&sendurl=/corp/testing/?module=UpdatePreference&userId=<%=request.getAttribute(Constants.USER_ID)%>&cid=<screen:resultSetItem row="<%=row%>" name="user_id"/>"/>');
                    document.write(' <param name="menu" value="false" />');
                    document.write(' <param name="quality" value="high" />');
                    document.write(' <param name="bgcolor" value="#ffffff" />');
                    document.write(' <embed ');
                    document.write(' src="/i/corp/screeningRatingEven.swf?preference=<screen:resultSetItem row="<%=row%>" name="level"/>&sendurl=/corp/testing/?module=UpdatePreference&userId=<%=request.getAttribute(Constants.USER_ID)%>&cid=<screen:resultSetItem row="<%=row%>" name="user_id"/>" ');
                    document.write(' menu="false" ');
                    document.write(' quality="high" ');
                    document.write(' bgcolor="#ffffff" ');
                    document.write(' width="80" ');
                    document.write(' height="12" ');
                    document.write(' name="tc_card" ');
                    document.write(' align="middle" ');
                    document.write(' allowScriptAccess="sameDomain" ');
                    document.write(' type="application/x-shockwave-flash" ');
                    document.write(' pluginspage="http://www.macromedia.com/go/getflashplayer" /> ');
                    document.write(' </object> ');
}
// -->
</SCRIPT>
                            </td>
                        </tr>
                         </screen:resultSetRowIterator>
                    </table>
                    </td>

                    <td><img src="/i/clear.gif" border=0 width=10 height=1/></td>

                    <!-- Demographic questions -->
                    <td valign=top class=screeningCellBG>
                    <table cellspacing="0" cellpadding="0" border=0 class=bodyText width="100%">
                        <tr>
                            <td class="screeningHeader" colspan=2>Demographic Info</td>
                        </tr>

                        <%
                            int counter = 0;
                            String[] cssClasses = {"screeningCellOdd", "screeningCellEven"};
                        %>
                        <screen:resultSetRowIterator id="row"
                                list="<%=(List) request.getAttribute(Constants.CANDIDATE_DEMOGRAPHIC_INFO)%>">
                        <tr>
                            <td class="<%=cssClasses[counter % 2]%>">
                                <screen:resultSetItem row="<%=row%>" name="demographic_question_text" />
                            </td>
                            <td class="<%=cssClasses[counter++ % 2]%>" nowrap=nowrap>
                                <screen:resultSetItem row="<%=row%>" name="demographic_answer_text" />
                            </td>
                        </tr>
                        </screen:resultSetRowIterator>
                    </table>
                    </td>
                </tr>
            </table>

            <!-- Notes -->
            <table cellspacing="0" cellpadding="0" width="700" class="screeningFrame">
                <tr>
                    <td width="70%" class="screeningHeader">Notes</td>
                    <td width="15%" align="center" class="screeningHeader">Author</td>
                    <td width="15%" align="center" class="screeningHeader">Date Created</td>
                </tr>

               <screen:resultSetRowIterator id="row"
                       list="<%=(List) request.getAttribute(Constants.CANDIDATE_NOTES)%>">
                <tr>
                    <td valign=top width="70%"class="<%=cssClasses[counter % 2]%>">
                      <strong>
                        <screen:resultSetItem row="<%=row%>" name="text" />
                      </strong>
                    </td>

                    <td valign=top width="15%"class="<%=cssClasses[counter % 2]%>" align=center>
                        <screen:resultSetItem row="<%=row%>" name="created_by" />
                    </td>

                    <td valign=top width="15%"class="<%=cssClasses[counter++ % 2]%>" align=center>
                        <screen:resultSetItem row="<%=row%>" name="create_date" />
                    </td>
                </tr>
               </screen:resultSetRowIterator>

                <tr>
                    <td class="screeningCellEven" colspan="3" align=center>
                        <screen:resultSetRowIterator id="row"
                                list="<%=(List) request.getAttribute(Constants.CANDIDATE_PERSONAL_INFO)%>">
                        <a href='/corp/testing/?<%=Constants.MODULE_KEY%>=<%=Constants.NOTE_CREATE_PROCESSOR%>&<%=Constants.CANDIDATE_ID%>=<screen:resultSetItem row="<%=row%>" name="user_id"/>'>
                                <img src="/i/corp/addNoteButton.gif" border=0 />
                        </a>
                        </screen:resultSetRowIterator>
                     </td>
                </tr>
            </table>

            <table cellspacing="0" cellpadding="0" width="700" class="screeningFrame">
                <tr>
                    <td width="30%" class="screeningHeader">Problem Name</td>
                    <td width="14%" align="center" class="screeningHeader">Language</td>
                    <td width="14%" align="center" class="screeningHeader">Status</td>
                    <td width="14%" align="center" class="screeningHeader">Time</td>
                    <td width="14%" align="center" class="screeningHeader">Percentile</td>
                    <td width="14%" align="center" class="screeningHeader">Results</td>
                </tr>

               <screen:resultSetRowIterator id="row"
                       list="<%=(List) request.getAttribute(Constants.CANDIDATE_PROBLEMS_INFO)%>">
                <tr>
                    <td width="30%" class="<%=cssClasses[counter % 2]%>">
                        <A href="javascript:getProblemDetail('<screen:resultSetItem row="<%=row%>" name="session_round_id" />,<screen:resultSetItem row="<%=row%>" name="problem_id" />');">
                            <screen:resultSetItem row="<%=row%>" name="problem_name" />
                        </A>
                    </td>

                    <td width="14%" align="center" class="<%=cssClasses[counter % 2]%>">
                        <screen:resultSetItem row="<%=row%>" name="language_name" />
                    </td>

                    <td width="14%" align="center" class="<%=cssClasses[counter % 2]%>">
                        <screen:resultSetItem row="<%=row%>" name="status_desc" />
                    </td>

                    <td width="14%" align="center" class="<%=cssClasses[counter % 2]%>">
                        <screen:resultSetItem row="<%=row%>" name="total_time" />
                    </td>

                    <td width="14%" align="center" class="<%=cssClasses[counter % 2]%>">
                        <screen:resultSetItem row="<%=row%>" name="candidate_percentile" />
                    </td>

                    <td width="14%" align="center" class="<%=cssClasses[counter++ % 2]%>">
                        
                        <A href="/corp/testing/?module=ProblemResult&sid=<screen:resultSetItem row="<%=row%>" name="session_id" />&rid=<screen:resultSetItem row="<%=row%>" name="session_round_id" />&pid=<screen:resultSetItem row="<%=row%>" name="problem_id" />&ptid=4">
                            view
                        </A>
                    </td>
                </tr>
               </screen:resultSetRowIterator>

            </table>

            <p><br></p>
        </td>
<!-- Middle Column ends --> 

<!-- Gutter -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="../../foot.jsp" />

</body>
</html>
