<%@ page import="bibliotecagroovy.EmprestimoProfessor" %>



<div class="fieldcontain ${hasErrors(bean: emprestimoProfessorInstance, field: 'livro', 'error')} required">
	<label for="livro">
		<g:message code="emprestimoProfessor.livro.label" default="Livro" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="livro" name="livro.id" from="${bibliotecagroovy.Livro.list()}" optionKey="id" required="" value="${emprestimoProfessorInstance?.livro?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: emprestimoProfessorInstance, field: 'professor', 'error')} required">
	<label for="professor">
		<g:message code="emprestimoProfessor.professor.label" default="Professor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="professor" name="professor.id" from="${bibliotecagroovy.Professor.list()}" optionKey="id" required="" value="${emprestimoProfessorInstance?.professor?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: emprestimoProfessorInstance, field: 'dataEmprestimo', 'error')} required">
	<label for="dataEmprestimo">
		<g:message code="emprestimoProfessor.dataEmprestimo.label" default="Data Emprestimo" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataEmprestimo" precision="day"  value="${emprestimoProfessorInstance?.dataEmprestimo}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: emprestimoProfessorInstance, field: 'dataDevolucao', 'error')} required">
	<label for="dataDevolucao">
		<g:message code="emprestimoProfessor.dataDevolucao.label" default="Data Devolucao" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataDevolucao" precision="day"  value="${emprestimoProfessorInstance?.dataDevolucao}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: emprestimoProfessorInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="emprestimoProfessor.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="status" name="status.id" from="${bibliotecagroovy.Status.list()}" optionKey="id" required="" value="${emprestimoProfessorInstance?.status?.id}" class="many-to-one"/>
</div>

