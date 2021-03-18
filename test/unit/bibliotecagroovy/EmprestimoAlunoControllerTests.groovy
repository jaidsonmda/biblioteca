package bibliotecagroovy



import org.junit.*
import grails.test.mixin.*

@TestFor(EmprestimoAlunoController)
@Mock(EmprestimoAluno)
class EmprestimoAlunoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/emprestimoAluno/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.emprestimoAlunoInstanceList.size() == 0
        assert model.emprestimoAlunoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.emprestimoAlunoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.emprestimoAlunoInstance != null
        assert view == '/emprestimoAluno/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/emprestimoAluno/show/1'
        assert controller.flash.message != null
        assert EmprestimoAluno.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/emprestimoAluno/list'

        populateValidParams(params)
        def emprestimoAluno = new EmprestimoAluno(params)

        assert emprestimoAluno.save() != null

        params.id = emprestimoAluno.id

        def model = controller.show()

        assert model.emprestimoAlunoInstance == emprestimoAluno
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/emprestimoAluno/list'

        populateValidParams(params)
        def emprestimoAluno = new EmprestimoAluno(params)

        assert emprestimoAluno.save() != null

        params.id = emprestimoAluno.id

        def model = controller.edit()

        assert model.emprestimoAlunoInstance == emprestimoAluno
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/emprestimoAluno/list'

        response.reset()

        populateValidParams(params)
        def emprestimoAluno = new EmprestimoAluno(params)

        assert emprestimoAluno.save() != null

        // test invalid parameters in update
        params.id = emprestimoAluno.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/emprestimoAluno/edit"
        assert model.emprestimoAlunoInstance != null

        emprestimoAluno.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/emprestimoAluno/show/$emprestimoAluno.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        emprestimoAluno.clearErrors()

        populateValidParams(params)
        params.id = emprestimoAluno.id
        params.version = -1
        controller.update()

        assert view == "/emprestimoAluno/edit"
        assert model.emprestimoAlunoInstance != null
        assert model.emprestimoAlunoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/emprestimoAluno/list'

        response.reset()

        populateValidParams(params)
        def emprestimoAluno = new EmprestimoAluno(params)

        assert emprestimoAluno.save() != null
        assert EmprestimoAluno.count() == 1

        params.id = emprestimoAluno.id

        controller.delete()

        assert EmprestimoAluno.count() == 0
        assert EmprestimoAluno.get(emprestimoAluno.id) == null
        assert response.redirectedUrl == '/emprestimoAluno/list'
    }
}
