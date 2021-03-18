<%@ page import="bibliotecagroovy.Aluno" %>



<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="aluno.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${alunoInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'emprestimo', 'error')} ">
	<label for="emprestimo">
		<g:message code="aluno.emprestimo.label" default="Emprestimo" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${alunoInstance?.emprestimo?}" var="e">
    <li><g:link controller="emprestimoAluno" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="emprestimoAluno" action="create" params="['aluno.id': alunoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'emprestimoAluno.label', default: 'EmprestimoAluno')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'turma', 'error')} required">
	<label for="turma">
		<g:message code="aluno.turma.label" default="Turma" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="turma" name="turma.id" from="${bibliotecagroovy.Turma.list()}" optionKey="id" required="" value="${alunoInstance?.turma?.id}" class="many-to-one"/>
</div>

