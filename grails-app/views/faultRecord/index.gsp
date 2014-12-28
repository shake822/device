<%@ page import="com.comtop.device.FaultRecord" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'faultRecord.label', default: 'FaultRecord')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-faultRecord" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-faultRecord" class="content scaffold-list" role="main">
    %{--<h1><g:message code="default.list.label" args="[entityName]"/></h1>--}%
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <div id="searchDiv" >
        <g:form url="[resource:faultRecordInstance, action:'index']" >
                <div class="fieldcontain">
                    <label for="reportUser">
                        <g:message code="faultRecord.reportUserName.label" default="Report User Name"/>
                    </label>
                    <g:textField name="reportUser"   value="${flash?.reportUser}"/>
                    <g:hiddenField name="fromPage" value="true" />
                </div>
                <div class="fieldcontain">
                    <label for="isEnd">
                        待处理
                    </label>
                    <g:checkBox name="isEnd"  value="${flash?.isEnd}" />
                </div>
            <fieldset class="buttons">
                <g:submitButton name="create" class="query" value="查询" />
            </fieldset>
        </g:form>
    </div>


    <table>
        <thead>
        <tr>
            <g:sortableColumn property="code" title="${message(code: 'faultRecord.code.label', default: 'Code')}"/>
            <th><g:message code="faultRecord.reportUserName.label" default="Report User"/></th>
            <th><g:message code="faultRecord.reportUserDept.label" default="Report User Dept"/></th>
            <g:sortableColumn property="faultType"
                              title="${message(code: 'faultRecord.faultType.label', default: 'Fault Type')}"/>
            <th><g:message code="faultRecord.description.label" default="Description"/></th>
            <g:sortableColumn property="createTime"
                              title="${message(code: 'faultRecord.createTime.label', default: 'Create Time')}"/>
            <th><g:message code="faultRecord.option.label" default="Option"/></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${faultRecordInstanceList}" status="i" var="faultRecordInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${faultRecordInstance.id}">${fieldValue(bean: faultRecordInstance, field: "code")}</g:link></td>

                <td>${fieldValue(bean: faultRecordInstance, field: "reportUserName")}</td>
                <td>${fieldValue(bean: faultRecordInstance, field: "reportUserDept")}</td>
                <td>${fieldValue(bean: faultRecordInstance, field: "faultType.name")}</td>
                <td>${fieldValue(bean: faultRecordInstance, field: "description")}</td>
                <td><g:formatDate date="${faultRecordInstance.createTime}"/></td>

                <td><g:if test="${faultRecordInstance.repairUser != null}">
                    已处理
                </g:if><g:else>
                    <g:link action="repair"
                            id="${faultRecordInstance.id}">待处理</g:link>
                </g:else></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${faultRecordInstanceCount ?: 0}" action="index"  controller="faultRecord" params="${params}"/>
    </div>
</div>
</body>
</html>
