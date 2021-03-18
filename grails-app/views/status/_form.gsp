<%@ page import="bibliotecagroovy.Status" %>



<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="status.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${statusInstance?.nome}"/>
</div>

