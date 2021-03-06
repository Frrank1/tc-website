<%--
  - Author: pulky, snow01, FireIce, lmmortal, TCSASSEMBLER
  - Version: 1.4
  - Since: Specification Review Integration 1.0
  - Copyright (C) 2004 - 2013 TopCoder Inc., All Rights Reserved.
  -
  - Description: This is a simple include page that that helps avoiding duplicated code in review board pages.
  - It will resolve included global left navigation bar according to the project type.
  -
  - Version 1.1 (Content Creation Contest Online Review and TC Site Integration Assembly version 1.0) changes:
  - Added support for new content creation competitions.
  -
  - Version 1.2 (Add Reporting Contest Type) changes:
  - Added support for new reporting competitions.
  -
  - Version 1.3 (Release Assembly - TopCoder BugHunt Competition Integration) changes:
  - Added support for new Bug Hunt competitions.
  -
  - Version 1.4 (Release Assembly - TC Community Site and Online Review Update for F2F and Code contest types)
  - Added support the new contest types First2Finish and Code.
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<td width="180">
	<c:choose>
	        <c:when test="${projectType == CONCEPTUALIZATION_PROJECT_TYPE ||
	    projectType == CONCEPTUALIZATION_SPECIFICATION_PROJECT_TYPE}">
	            <jsp:include page="/includes/global_left.jsp">
	                <jsp:param name="node" value="conceptualization_review"/>
	            </jsp:include>
	        </c:when>
	        <c:when test="${projectType == SPECIFICATION_PROJECT_TYPE ||
	    projectType == SPECIFICATION_SPECIFICATION_PROJECT_TYPE}">
	            <jsp:include page="/includes/global_left.jsp">
	                <jsp:param name="node" value="specification_review"/>
	            </jsp:include>
	        </c:when>
	        <c:when test="${projectType == TEST_SUITES_PROJECT_TYPE ||
	    projectType == TEST_SUITES_SPECIFICATION_PROJECT_TYPE}">
	            <jsp:include page="/includes/global_left.jsp">
	                <jsp:param name="node" value="test_suites_review"/>
	            </jsp:include>
	        </c:when>
	        <c:when test="${projectType == TEST_SCENARIOS_PROJECT_TYPE ||
	    projectType == TEST_SCENARIOS_SPECIFICATION_PROJECT_TYPE}">
	            <jsp:include page="/includes/global_left.jsp">
	                <jsp:param name="node" value="test_scenarios_review"/>
	            </jsp:include>
	        </c:when>
	        <c:when test="${projectType == UI_PROTOTYPE_PROJECT_TYPE ||
	    projectType == UI_PROTOTYPE_SPECIFICATION_PROJECT_TYPE}">
	            <jsp:include page="/includes/global_left.jsp">
	                <jsp:param name="node" value="ui_prototype_review"/>
	            </jsp:include>
	        </c:when>
	        <c:when test="${projectType == RIA_BUILD_PROJECT_TYPE ||
	    projectType == RIA_BUILD_SPECIFICATION_PROJECT_TYPE}">
	            <jsp:include page="/includes/global_left.jsp">
	                <jsp:param name="node" value="ria_build_review"/>
	            </jsp:include>
	        </c:when>
	        <c:when test="${projectType == RIA_COMPONENT_PROJECT_TYPE ||
	    projectType == RIA_COMPONENT_SPECIFICATION_PROJECT_TYPE}">
	            <jsp:include page="/includes/global_left.jsp">
	                <jsp:param name="node" value="ria_component_review"/>
	            </jsp:include>
	        </c:when>
		<c:when test="${projectType == ARCHITECTURE_PROJECT_TYPE ||
            projectType == ARCHITECTURE_SPECIFICATION_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="architecture_review"/>
            </jsp:include>
        </c:when>
        <c:when test="${projectType == ASSEMBLY_PROJECT_TYPE ||
            projectType == ASSEMBLY_SPECIFICATION_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="assembly_review"/>
            </jsp:include>
        </c:when>
        <c:when test="${projectType == CONTENT_CREATION_PROJECT_TYPE ||
            projectType == CONTENT_CREATION_SPECIFICATION_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="content_creation_review"/>
            </jsp:include>
        </c:when>
        <c:when test="${projectType == REPORTING_PROJECT_TYPE ||
            projectType == REPORTING_SPECIFICATION_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="reporting_review"/>
            </jsp:include>
        </c:when>
        <c:when test="${projectType == BUG_HUNT_PROJECT_TYPE ||
            projectType == BUG_HUNT_SPECIFICATION_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="bug_hunt_review"/>
            </jsp:include>
        </c:when>
        <c:when test="${projectType == FIRST2FINISH_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="first2finish_review"/>
            </jsp:include>
        </c:when>
        <c:when test="${projectType == CODE_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="code_review"/>
            </jsp:include>
        </c:when>
        <c:when test="${projectType == DESIGN_PROJECT_TYPE ||
        	projectType == DESIGN_SPECIFICATION_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="des_review"/>
            </jsp:include>
        </c:when>
        <c:when test="${projectType == DEVELOPMENT_PROJECT_TYPE ||
        	projectType == DEVELOPMENT_SPECIFICATION_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="dev_review"/>
            </jsp:include>
        </c:when>
	</c:choose>
</td>
