package sakila

class Category {
    Byte id
    String name
    Date lastUpdated

    String toString() { name }

    static hasMany = [films: Film]
    static belongsTo = Film

    static mapping = {
        id column: 'category_id'
        films joinTable: 'film_category'
        lastUpdated column: 'last_update'
        version false
    }

    static constraints = {
    }
}
