<%@ page import="com.comtop.device.User" %>


<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="user.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${userInstance?.name}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'deptName', 'error')} required">
	<label for="deptName">
		<g:message code="user.deptName.label" default="Dept Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="deptName" required="" value="${userInstance?.deptName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'account', 'error')} required">
	<label for="account">
		<g:message code="user.account.label" default="Account" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="account" required="" value="${userInstance?.account}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwd', 'error')} required">
	<label for="passwd">
		<g:message code="user.passwd.label" default="Passwd" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="passwd" required="" value="${userInstance?.passwd}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'canLogin', 'error')} ">
	<label for="canLogin">
		<g:message code="user.canLogin.label" default="Can Login" />
		
	</label>
	<g:checkBox name="canLogin" value="${userInstance?.canLogin}" />

</div>


<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'isLock', 'error')} ">
	<label for="isLock">
		<g:message code="user.isLock.label" default="Is Lock" />
		
	</label>
	<g:checkBox name="isLock" value="${userInstance?.isLock}" />

</div>




