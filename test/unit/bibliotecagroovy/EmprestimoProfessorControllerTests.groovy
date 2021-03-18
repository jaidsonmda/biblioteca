package bibliotecagroovy



import org.junit.*
import grails.test.mixin.*

@TestFor(EmprestimoProfessorController)
@Mock(EmprestimoProfessor)
class EmprestimoProfessorControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/emprestimoProfessor/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.emprestimoProfessorInstanceList.size() == 0
        assert model.emprestimoProfessorInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.emprestimoProfessorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.emprestimoProfessorInstance != null
        assert view == '/emprestimoProfessor/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/emprestimoProfessor/show/1'
        assert controller.flash.message != null
        assert EmprestimoProfessor.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/emprestimoProfessor/list'

        populateValidParams(params)
        def emprestimoProfessor = new EmprestimoProfessor(params)

        assert emprestimoProfessor.save() != null

        params.id = emprestimoProfessor.id

        def model = controller.show()

        assert model.emprestimoProfessorInstance == emprestimoProfessor
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/emprestimoProfessor/list'

        populateValidParams(params)
        def emprestimoProfessor = new EmprestimoProfessor(params)

        assert emprestimoProfessor.save() != null

        params.id = emprestimoProfessor.id

        def model = controller.edit()

        assert model.emprestimoProfessorInstance == emprestimoProfessor
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/emprestimoProfessor/list'

        response.reset()

        populateValidParams(params)
        def emprestimoProfessor = new EmprestimoProfessor(params)

        assert emprestimoProfessor.save() != null

        // test invalid parameters in update
        params.id = emprestimoProfessor.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/emprestimoProfessor/edit"
        assert model.emprestimoProfessorInstance != null

        emprestimoProfessor.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/emprestimoProfessor/show/$emprestimoProfessor.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        emprestimoProfessor.clearErrors()

        populateValidParams(params)
        params.id = emprestimoProfessor.id
        params.version = -1
        controller.update()

        assert view == "/emprestimoProfessor/edit"
        assert model.emprestimoProfessorInstance != null
        assert model.emprestimoProfessorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/emprestimoProfessor/list'

        response.reset()

        populateValidParams(params)
        def emprestimoProfessor = new EmprestimoProfessor(params)

        assert emprestimoProfessor.save() != null
        assert EmprestimoProfessor.count() == 1

        params.id = emprestimoProfessor.id

        controller.delete()

        assert EmprestimoProfessor.count() == 0
        assert EmprestimoProfessor.get(emprestimoProfessor.id) == null
        assert response.redirectedUrl == '/emprestimoProfessor/list'
    }
}
