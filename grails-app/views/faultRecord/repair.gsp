<%@ page import="com.comtop.device.FaultRecord" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'faultRecord.label', default: 'FaultRecord')}" />
		<title>完成维修单</title>
	</head>
	<body>
		<a href="#edit-faultRecord" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-faultRecord" class="content scaffold-edit" role="main">
			<h1>完成维修单</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${faultRecordInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${faultRecordInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:faultRecordInstance, action:'updateForRepair']" method="PUT" >
				<g:hiddenField name="version" value="${faultRecordInstance?.version}" />
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: faultRecordInstance, field: 'repairDesc', 'error')} ">
						<label for="repairDesc">
							<g:message code="faultRecord.repairDesc.label" default="Repair Desc"/>

						</label>
						<g:textField name="repairDesc" value="${faultRecordInstance?.repairDesc}"/>

					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="updateForRepair" value="完成工单" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
