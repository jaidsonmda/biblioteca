package bibliotecagroovy

class EmprestimoAluno{
    Aluno aluno
    Livro livro
    Date dataEmprestimo
    Date dataDevolucao
    Status status
    static constraints = {
        livro(nullable: false, blank: false)
        aluno(nullable: false, blank: false)
        dataEmprestimo(nullable: false, blank: false)
        dataDevolucao(nullable: false, blank: false)
        status(nullable: false, blank: false);
    }
    String toString(){
        "${this.livro.nome}"
    }
} 
