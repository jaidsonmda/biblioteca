package bibliotecagroovy

class Aluno{
    String nome
    static belongsTo= [turma: Turma]
    static hasMany=[emprestimo: EmprestimoAluno]
    static constraints = {
        nome(nullable: false, blank: false)
        emprestimo(nullable: true, blank:true)
    }
    String toString(){
        "${this.nome}"
    }
}
