<%@ page import="com.comtop.device.FaultType" %>



%{--<div class="fieldcontain ${hasErrors(bean: faultTypeInstance, field: 'createTime', 'error')} required">
	<label for="createTime">
		<g:message code="faultType.createTime.label" default="Create Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createTime" precision="day"  value="${faultTypeInstance?.createTime}"  />

</div>--}%
<div class="fieldcontain ${hasErrors(bean: faultTypeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="faultType.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${faultTypeInstance?.name}"/>

</div>

