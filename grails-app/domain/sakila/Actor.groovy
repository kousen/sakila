package sakila

class Actor {
    Short id
    String firstName
    String lastName
    Date lastUpdated

    String toString() { "$firstName $lastName" }

    static hasMany = [films: Film]
    static belongsTo = Film

    static mapping = {
        id column: 'actor_id'
        films joinTable: 'film_actor'
        lastUpdated column: 'last_update'
        version false
    }

    static constraints = {
    }
}
