package bibliotecagroovy

class Livro {

    String nome
    String issbn
    String ano
    String idioma
    //static belongsTo= [autor: Autor]
    
    static constraints = {
        nome (nullable: false, blank: false)
        issbn (nullable: false, blank: false)
        ano (maxSize: 4, nullable: false, blank: false)
        idioma (nullable: false, blank: false)
    }
    String toString(){
        "${this.nome}"
    }
}
