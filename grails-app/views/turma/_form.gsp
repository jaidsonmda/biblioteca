<%@ page import="bibliotecagroovy.Turma" %>



<div class="fieldcontain ${hasErrors(bean: turmaInstance, field: 'nomeTurma', 'error')} required">
	<label for="nomeTurma">
		<g:message code="turma.nomeTurma.label" default="Nome Turma" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nomeTurma" required="" value="${turmaInstance?.nomeTurma}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: turmaInstance, field: 'alunos', 'error')} ">
	<label for="alunos">
		<g:message code="turma.alunos.label" default="Alunos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${turmaInstance?.alunos?}" var="a">
    <li><g:link controller="aluno" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="aluno" action="create" params="['turma.id': turmaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'aluno.label', default: 'Aluno')])}</g:link>
</li>
</ul>

</div>

