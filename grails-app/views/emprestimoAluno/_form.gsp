<%@ page import="bibliotecagroovy.EmprestimoAluno" %>



<div class="fieldcontain ${hasErrors(bean: emprestimoAlunoInstance, field: 'aluno', 'error')} required">
	<label for="aluno">
		<g:message code="emprestimoAluno.aluno.label" default="Aluno" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="aluno" name="aluno.id" from="${bibliotecagroovy.Aluno.list()}" optionKey="id" required="" value="${emprestimoAlunoInstance?.aluno?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: emprestimoAlunoInstance, field: 'livro', 'error')} required">
	<label for="livro">
		<g:message code="emprestimoAluno.livro.label" default="Livro" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="livro" name="livro.id" from="${bibliotecagroovy.Livro.list()}" optionKey="id" required="" value="${emprestimoAlunoInstance?.livro?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: emprestimoAlunoInstance, field: 'dataEmprestimo', 'error')} required">
	<label for="dataEmprestimo">
		<g:message code="emprestimoAluno.dataEmprestimo.label" default="Data Emprestimo" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataEmprestimo" precision="day"  value="${emprestimoAlunoInstance?.dataEmprestimo}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: emprestimoAlunoInstance, field: 'dataDevolucao', 'error')} required">
	<label for="dataDevolucao">
		<g:message code="emprestimoAluno.dataDevolucao.label" default="Data Devolucao" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataDevolucao" precision="day"  value="${emprestimoAlunoInstance?.dataDevolucao}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: emprestimoAlunoInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="emprestimoAluno.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="status" name="status.id" from="${bibliotecagroovy.Status.list()}" optionKey="id" required="" value="${emprestimoAlunoInstance?.status?.id}" class="many-to-one"/>
</div>

