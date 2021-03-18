<%@ page import="bibliotecagroovy.Livro" %>



<div class="fieldcontain ${hasErrors(bean: livroInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="livro.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${livroInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: livroInstance, field: 'issbn', 'error')} required">
	<label for="issbn">
		<g:message code="livro.issbn.label" default="Issbn" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="issbn" required="" value="${livroInstance?.issbn}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: livroInstance, field: 'ano', 'error')} required">
	<label for="ano">
		<g:message code="livro.ano.label" default="Ano" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ano" maxlength="4" required="" value="${livroInstance?.ano}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: livroInstance, field: 'idioma', 'error')} required">
	<label for="idioma">
		<g:message code="livro.idioma.label" default="Idioma" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="idioma" required="" value="${livroInstance?.idioma}"/>
</div>

