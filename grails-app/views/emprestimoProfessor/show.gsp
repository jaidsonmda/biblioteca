
<%@ page import="bibliotecagroovy.EmprestimoProfessor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'emprestimoProfessor.label', default: 'EmprestimoProfessor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-emprestimoProfessor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-emprestimoProfessor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list emprestimoProfessor">
			
				<g:if test="${emprestimoProfessorInstance?.livro}">
				<li class="fieldcontain">
					<span id="livro-label" class="property-label"><g:message code="emprestimoProfessor.livro.label" default="Livro" /></span>
					
						<span class="property-value" aria-labelledby="livro-label"><g:link controller="livro" action="show" id="${emprestimoProfessorInstance?.livro?.id}">${emprestimoProfessorInstance?.livro?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${emprestimoProfessorInstance?.professor}">
				<li class="fieldcontain">
					<span id="professor-label" class="property-label"><g:message code="emprestimoProfessor.professor.label" default="Professor" /></span>
					
						<span class="property-value" aria-labelledby="professor-label"><g:link controller="professor" action="show" id="${emprestimoProfessorInstance?.professor?.id}">${emprestimoProfessorInstance?.professor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${emprestimoProfessorInstance?.dataEmprestimo}">
				<li class="fieldcontain">
					<span id="dataEmprestimo-label" class="property-label"><g:message code="emprestimoProfessor.dataEmprestimo.label" default="Data Emprestimo" /></span>
					
						<span class="property-value" aria-labelledby="dataEmprestimo-label"><g:formatDate date="${emprestimoProfessorInstance?.dataEmprestimo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${emprestimoProfessorInstance?.dataDevolucao}">
				<li class="fieldcontain">
					<span id="dataDevolucao-label" class="property-label"><g:message code="emprestimoProfessor.dataDevolucao.label" default="Data Devolucao" /></span>
					
						<span class="property-value" aria-labelledby="dataDevolucao-label"><g:formatDate date="${emprestimoProfessorInstance?.dataDevolucao}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${emprestimoProfessorInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="emprestimoProfessor.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:link controller="status" action="show" id="${emprestimoProfessorInstance?.status?.id}">${emprestimoProfessorInstance?.status?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${emprestimoProfessorInstance?.id}" />
					<g:link class="edit" action="edit" id="${emprestimoProfessorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
