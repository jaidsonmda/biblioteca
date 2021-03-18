package bibliotecagroovy

class EmprestimoProfessor{
    Professor professor
    Livro livro
    Date dataEmprestimo
    Date dataDevolucao
    Status status
    static constraints = {
        livro(nullable: false, blank: false)
        professor(nullable: false, blank: false)
        dataEmprestimo(nullable: false, blank: false)
        dataDevolucao(nullable: false, blank: false)
        status(nullable: false, blank: false);
    }
}
