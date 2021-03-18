
<%@ page import="bibliotecagroovy.EmprestimoAluno" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'emprestimoAluno.label', default: 'EmprestimoAluno')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-emprestimoAluno" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-emprestimoAluno" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="emprestimoAluno.aluno.label" default="Aluno" /></th>
					
						<th><g:message code="emprestimoAluno.livro.label" default="Livro" /></th>
					
						<g:sortableColumn property="dataEmprestimo" title="${message(code: 'emprestimoAluno.dataEmprestimo.label', default: 'Data Emprestimo')}" />
					
						<g:sortableColumn property="dataDevolucao" title="${message(code: 'emprestimoAluno.dataDevolucao.label', default: 'Data Devolucao')}" />
					
						<th><g:message code="emprestimoAluno.status.label" default="Status" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${emprestimoAlunoInstanceList}" status="i" var="emprestimoAlunoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${emprestimoAlunoInstance.id}">${fieldValue(bean: emprestimoAlunoInstance, field: "aluno")}</g:link></td>
					
						<td>${fieldValue(bean: emprestimoAlunoInstance, field: "livro")}</td>
					
						<td><g:formatDate date="${emprestimoAlunoInstance.dataEmprestimo}" /></td>
					
						<td><g:formatDate date="${emprestimoAlunoInstance.dataDevolucao}" /></td>
					
						<td>${fieldValue(bean: emprestimoAlunoInstance, field: "status")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${emprestimoAlunoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
