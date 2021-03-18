package bibliotecagroovy

class Professor {
    String nome
    String matriculaFuncional
    static hasMany=[emprestimo: EmprestimoProfessor]
    static constraints = {
        nome(nullable: false, blank: false)
        matriculaFuncional(nullable: false, blank: false)
        emprestimo(nullable: true, blank:true)
    }
    String toString(){
        "${this.nome}"
    }
}
