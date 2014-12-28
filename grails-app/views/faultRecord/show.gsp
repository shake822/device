
<%@ page import="com.comtop.device.FaultRecord" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'faultRecord.label', default: 'FaultRecord')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-faultRecord" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-faultRecord" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list faultRecord">
			

			
				<g:if test="${faultRecordInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="faultRecord.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${faultRecordInstance}" field="code"/></span>
					
				</li>
				</g:if>

				<g:if test="${faultRecordInstance?.reportUserName}">
					<li class="fieldcontain">
						<span id="reportUserName-label" class="property-label"><g:message code="faultRecord.reportUserName.label" default="Report User Name" /></span>

						<span class="property-value" aria-labelledby="reportUserName-label"><g:fieldValue bean="${faultRecordInstance}" field="reportUserName"/></span>

					</li>
				</g:if>

				<g:if test="${faultRecordInstance?.reportUserDept}">
					<li class="fieldcontain">
						<span id="reportUserDept-label" class="property-label"><g:message code="faultRecord.reportUserDept.label" default="Report User Dept" /></span>

						<span class="property-value" aria-labelledby="reportUserDept-label"><g:fieldValue bean="${faultRecordInstance}" field="reportUserDept"/></span>

					</li>
				</g:if>
				<g:if test="${faultRecordInstance?.deviceNo}">
					<li class="fieldcontain">
						<span id="deviceNo-label" class="property-label"><g:message code="faultRecord.deviceNo.label" default="Device No" /></span>

						<span class="property-value" aria-labelledby="deviceNo-label"><g:fieldValue bean="${faultRecordInstance}" field="deviceNo"/></span>

					</li>
				</g:if>

				<g:if test="${faultRecordInstance?.faultType}">
					<li class="fieldcontain">
						<span id="faultType-label" class="property-label"><g:message code="faultRecord.faultType.label" default="Fault Type" /></span>

						<span class="property-value" aria-labelledby="faultType-label"> ${faultRecordInstance?.faultType?.name}</span>

					</li>
				</g:if>

				<g:if test="${faultRecordInstance?.description}">
					<li class="fieldcontain">
						<span id="description-label" class="property-label"><g:message code="faultRecord.description.label" default="Description" /></span>

						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${faultRecordInstance}" field="description"/></span>

					</li>
				</g:if>

				<g:if test="${faultRecordInstance?.createTime}">
				<li class="fieldcontain">
					<span id="createTime-label" class="property-label"><g:message code="faultRecord.createTime.label" default="Create Time" /></span>
					
						<span class="property-value" aria-labelledby="createTime-label"><g:formatDate date="${faultRecordInstance?.createTime}" /></span>
					
				</li>
				</g:if>



			

			
				<g:if test="${faultRecordInstance?.updateTime}">
				<li class="fieldcontain">
					<span id="updateTime-label" class="property-label"><g:message code="faultRecord.updateTime.label" default="Update Time" /></span>
					
						<span class="property-value" aria-labelledby="updateTime-label"><g:formatDate date="${faultRecordInstance?.updateTime}" /></span>
					
				</li>
				</g:if>

				<g:if test="${faultRecordInstance?.repairUser}">
					<li class="fieldcontain">
						<span id="repairUser-label" class="property-label"><g:message code="faultRecord.repairUser.label" default="Repair User" /></span>

						<span class="property-value" aria-labelledby="repairUser-label"><g:link controller="user" action="show" id="${faultRecordInstance?.repairUser?.id}">${faultRecordInstance?.repairUser?.name}</g:link></span>

					</li>
				</g:if>

				<g:if test="${faultRecordInstance?.repairDesc}">
					<li class="fieldcontain">
						<span id="repairDesc-label" class="property-label"><g:message code="faultRecord.repairDesc.label" default="Repair Desc" /></span>

						<span class="property-value" aria-labelledby="repairDesc-label"><g:fieldValue bean="${faultRecordInstance}" field="repairDesc"/></span>

					</li>
				</g:if>

				<g:if test="${faultRecordInstance?.repairTime}">
					<li class="fieldcontain">
						<span id="repairTime-label" class="property-label"><g:message code="faultRecord.repairTime.label" default="Repair Time" /></span>

						<span class="property-value" aria-labelledby="repairTime-label"><g:formatDate   date="${faultRecordInstance?.repairTime}" /></span>

					</li>
				</g:if>

			</ol>
			<g:if test="${faultRecordInstance.repairUser == null}">
				<g:form url="[resource:faultRecordInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						<g:link class="edit" action="edit" resource="${faultRecordInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</g:if>
		</div>
	</body>
</html>
