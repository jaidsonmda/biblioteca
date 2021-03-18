<%@ page import="bibliotecagroovy.Professor" %>



<div class="fieldcontain ${hasErrors(bean: professorInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="professor.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${professorInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: professorInstance, field: 'matriculaFuncional', 'error')} required">
	<label for="matriculaFuncional">
		<g:message code="professor.matriculaFuncional.label" default="Matricula Funcional" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="matriculaFuncional" required="" value="${professorInstance?.matriculaFuncional}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: professorInstance, field: 'emprestimo', 'error')} ">
	<label for="emprestimo">
		<g:message code="professor.emprestimo.label" default="Emprestimo" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${professorInstance?.emprestimo?}" var="e">
    <li><g:link controller="emprestimoProfessor" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="emprestimoProfessor" action="create" params="['professor.id': professorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'emprestimoProfessor.label', default: 'EmprestimoProfessor')])}</g:link>
</li>
</ul>

</div>

