<%@ page import="com.comtop.device.FaultRecord" %>

<div class="fieldcontain ${hasErrors(bean: faultRecordInstance, field: 'code', 'error')} required">
    <label for="code">
        <g:message code="faultRecord.code.label" default="Code"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="code"  readonly="true" required="" value="${faultRecordInstance?.code}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: faultRecordInstance, field: 'reportUserName', 'error')} required">
    <label for="reportUserName">
        <g:message code="faultRecord.reportUserName.label" default="Report User Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="reportUserName" required="" value="${faultRecordInstance?.reportUserName}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: faultRecordInstance, field: 'reportUserDept', 'error')} required">
    <label for="reportUserDept">
        <g:message code="faultRecord.reportUserDept.label" default="Report User Dept"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="reportUserDept" required="" value="${faultRecordInstance?.reportUserDept}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: faultRecordInstance, field: 'deviceNo', 'error')} required">
    <label for="deviceNo">
        <g:message code="faultRecord.deviceNo.label" default="Device No"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="deviceNo" required="" value="${faultRecordInstance?.deviceNo}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: faultRecordInstance, field: 'faultType', 'error')} required">
    <label for="faultType">
        <g:message code="faultRecord.faultType.label" default="Fault Type"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="faultType" name="faultType.id" from="${com.comtop.device.FaultType.list()}" optionValue="name" optionKey="id" required=""
              value="${faultRecordInstance?.faultType?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: faultRecordInstance, field: 'description', 'error')} required">
    <label for="description">
        <g:message code="faultRecord.description.label" default="Description"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="description" required="" value="${faultRecordInstance?.description}"/>

</div>
%{--

<div class="fieldcontain ${hasErrors(bean: faultRecordInstance, field: 'repairUser', 'error')} ">
    <label for="repairUser">
        <g:message code="faultRecord.repairUser.label" default="Repair User"/>

    </label>
    <g:select id="repairUser" name="repairUser.id" from="${com.comtop.device.User.list()}" optionKey="id"
              optionValue="name" value="${faultRecordInstance?.repairUser?.id}" class="many-to-one"
              noSelection="['null': '']"/>

</div>
--}%


%{--
<div class="fieldcontain ${hasErrors(bean: faultRecordInstance, field: 'repairTime', 'error')} ">
    <label for="repairTime">
        <g:message code="faultRecord.repairTime.label" default="Repair Time"/>

    </label>
    <g:datePicker name="repairTime" precision="day" value="${faultRecordInstance?.repairTime}" default="none"
                  noSelection="['': '']"/>

</div>



<div class="fieldcontain ${hasErrors(bean: faultRecordInstance, field: 'createTime', 'error')} required">
    <label for="createTime">
        <g:message code="faultRecord.createTime.label" default="Create Time"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="createTime" precision="day" value="${faultRecordInstance?.createTime}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: faultRecordInstance, field: 'updateTime', 'error')} required">
    <label for="updateTime">
        <g:message code="faultRecord.updateTime.label" default="Update Time"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="updateTime" precision="day" value="${faultRecordInstance?.updateTime}"/>

</div>--}%

