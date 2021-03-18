package bibliotecagroovy

class Turma {
    String nomeTurma
    static hasMany = [alunos: Aluno]
    static constraints = {
       nomeTurma (nullable: false, blank: false)
    }
    String toString(){
        "${this.nomeTurma}"
    }
}
