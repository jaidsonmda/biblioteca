package bibliotecagroovy

class Status {
    String nome
    static constraints = {
        nome(nullable: false, blank: false)
    }
    String toString(){
        "${this.nome}"
    }
}
