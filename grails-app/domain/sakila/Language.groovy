package sakila

class Language {
    Byte id
    String name
    Date lastUpdated

    String toString() { name }

    static mapping = {
        id column: 'language_id'
        name sqlType: 'char'
        lastUpdated column: 'last_update'
        version false
    }

    static constraints = {
        name(maxSize: 20)
    }
}
