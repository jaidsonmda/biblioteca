package bibliotecagroovy

import org.springframework.dao.DataIntegrityViolationException

class EmprestimoAlunoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [emprestimoAlunoInstanceList: EmprestimoAluno.list(params), emprestimoAlunoInstanceTotal: EmprestimoAluno.count()]
    }

    def create() {
        [emprestimoAlunoInstance: new EmprestimoAluno(params)]
    }

    def save() {
        def emprestimoAlunoInstance = new EmprestimoAluno(params)
        if (!emprestimoAlunoInstance.save(flush: true)) {
            render(view: "create", model: [emprestimoAlunoInstance: emprestimoAlunoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'emprestimoAluno.label', default: 'EmprestimoAluno'), emprestimoAlunoInstance.id])
        redirect(action: "show", id: emprestimoAlunoInstance.id)
    }

    def show(Long id) {
        def emprestimoAlunoInstance = EmprestimoAluno.get(id)
        if (!emprestimoAlunoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'emprestimoAluno.label', default: 'EmprestimoAluno'), id])
            redirect(action: "list")
            return
        }

        [emprestimoAlunoInstance: emprestimoAlunoInstance]
    }

    def edit(Long id) {
        def emprestimoAlunoInstance = EmprestimoAluno.get(id)
        if (!emprestimoAlunoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'emprestimoAluno.label', default: 'EmprestimoAluno'), id])
            redirect(action: "list")
            return
        }

        [emprestimoAlunoInstance: emprestimoAlunoInstance]
    }

    def update(Long id, Long version) {
        def emprestimoAlunoInstance = EmprestimoAluno.get(id)
        if (!emprestimoAlunoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'emprestimoAluno.label', default: 'EmprestimoAluno'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (emprestimoAlunoInstance.version > version) {
                emprestimoAlunoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'emprestimoAluno.label', default: 'EmprestimoAluno')] as Object[],
                          "Another user has updated this EmprestimoAluno while you were editing")
                render(view: "edit", model: [emprestimoAlunoInstance: emprestimoAlunoInstance])
                return
            }
        }

        emprestimoAlunoInstance.properties = params

        if (!emprestimoAlunoInstance.save(flush: true)) {
            render(view: "edit", model: [emprestimoAlunoInstance: emprestimoAlunoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'emprestimoAluno.label', default: 'EmprestimoAluno'), emprestimoAlunoInstance.id])
        redirect(action: "show", id: emprestimoAlunoInstance.id)
    }

    def delete(Long id) {
        def emprestimoAlunoInstance = EmprestimoAluno.get(id)
        if (!emprestimoAlunoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'emprestimoAluno.label', default: 'EmprestimoAluno'), id])
            redirect(action: "list")
            return
        }

        try {
            emprestimoAlunoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'emprestimoAluno.label', default: 'EmprestimoAluno'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'emprestimoAluno.label', default: 'EmprestimoAluno'), id])
            redirect(action: "show", id: id)
        }
    }
}
