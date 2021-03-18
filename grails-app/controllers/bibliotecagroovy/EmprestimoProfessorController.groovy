package bibliotecagroovy

import org.springframework.dao.DataIntegrityViolationException

class EmprestimoProfessorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [emprestimoProfessorInstanceList: EmprestimoProfessor.list(params), emprestimoProfessorInstanceTotal: EmprestimoProfessor.count()]
    }

    def create() {
        [emprestimoProfessorInstance: new EmprestimoProfessor(params)]
    }

    def save() {
        def emprestimoProfessorInstance = new EmprestimoProfessor(params)
        if (!emprestimoProfessorInstance.save(flush: true)) {
            render(view: "create", model: [emprestimoProfessorInstance: emprestimoProfessorInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'emprestimoProfessor.label', default: 'EmprestimoProfessor'), emprestimoProfessorInstance.id])
        redirect(action: "show", id: emprestimoProfessorInstance.id)
    }

    def show(Long id) {
        def emprestimoProfessorInstance = EmprestimoProfessor.get(id)
        if (!emprestimoProfessorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'emprestimoProfessor.label', default: 'EmprestimoProfessor'), id])
            redirect(action: "list")
            return
        }

        [emprestimoProfessorInstance: emprestimoProfessorInstance]
    }

    def edit(Long id) {
        def emprestimoProfessorInstance = EmprestimoProfessor.get(id)
        if (!emprestimoProfessorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'emprestimoProfessor.label', default: 'EmprestimoProfessor'), id])
            redirect(action: "list")
            return
        }

        [emprestimoProfessorInstance: emprestimoProfessorInstance]
    }

    def update(Long id, Long version) {
        def emprestimoProfessorInstance = EmprestimoProfessor.get(id)
        if (!emprestimoProfessorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'emprestimoProfessor.label', default: 'EmprestimoProfessor'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (emprestimoProfessorInstance.version > version) {
                emprestimoProfessorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'emprestimoProfessor.label', default: 'EmprestimoProfessor')] as Object[],
                          "Another user has updated this EmprestimoProfessor while you were editing")
                render(view: "edit", model: [emprestimoProfessorInstance: emprestimoProfessorInstance])
                return
            }
        }

        emprestimoProfessorInstance.properties = params

        if (!emprestimoProfessorInstance.save(flush: true)) {
            render(view: "edit", model: [emprestimoProfessorInstance: emprestimoProfessorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'emprestimoProfessor.label', default: 'EmprestimoProfessor'), emprestimoProfessorInstance.id])
        redirect(action: "show", id: emprestimoProfessorInstance.id)
    }

    def delete(Long id) {
        def emprestimoProfessorInstance = EmprestimoProfessor.get(id)
        if (!emprestimoProfessorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'emprestimoProfessor.label', default: 'EmprestimoProfessor'), id])
            redirect(action: "list")
            return
        }

        try {
            emprestimoProfessorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'emprestimoProfessor.label', default: 'EmprestimoProfessor'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'emprestimoProfessor.label', default: 'EmprestimoProfessor'), id])
            redirect(action: "show", id: id)
        }
    }
}
