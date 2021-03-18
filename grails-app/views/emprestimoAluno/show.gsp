
<%@ page import="bibliotecagroovy.EmprestimoAluno" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'emprestimoAluno.label', default: 'EmprestimoAluno')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-emprestimoAluno" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-emprestimoAluno" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list emprestimoAluno">
			
				<g:if test="${emprestimoAlunoInstance?.aluno}">
				<li class="fieldcontain">
					<span id="aluno-label" class="property-label"><g:message code="emprestimoAluno.aluno.label" default="Aluno" /></span>
					
						<span class="property-value" aria-labelledby="aluno-label"><g:link controller="aluno" action="show" id="${emprestimoAlunoInstance?.aluno?.id}">${emprestimoAlunoInstance?.aluno?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${emprestimoAlunoInstance?.livro}">
				<li class="fieldcontain">
					<span id="livro-label" class="property-label"><g:message code="emprestimoAluno.livro.label" default="Livro" /></span>
					
						<span class="property-value" aria-labelledby="livro-label"><g:link controller="livro" action="show" id="${emprestimoAlunoInstance?.livro?.id}">${emprestimoAlunoInstance?.livro?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${emprestimoAlunoInstance?.dataEmprestimo}">
				<li class="fieldcontain">
					<span id="dataEmprestimo-label" class="property-label"><g:message code="emprestimoAluno.dataEmprestimo.label" default="Data Emprestimo" /></span>
					
						<span class="property-value" aria-labelledby="dataEmprestimo-label"><g:formatDate date="${emprestimoAlunoInstance?.dataEmprestimo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${emprestimoAlunoInstance?.dataDevolucao}">
				<li class="fieldcontain">
					<span id="dataDevolucao-label" class="property-label"><g:message code="emprestimoAluno.dataDevolucao.label" default="Data Devolucao" /></span>
					
						<span class="property-value" aria-labelledby="dataDevolucao-label"><g:formatDate date="${emprestimoAlunoInstance?.dataDevolucao}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${emprestimoAlunoInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="emprestimoAluno.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label">${emprestimoAlunoInstance?.status?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${emprestimoAlunoInstance?.id}" />
					<g:link class="edit" action="edit" id="${emprestimoAlunoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
