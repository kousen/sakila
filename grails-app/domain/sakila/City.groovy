package sakila

class City {
    Short id
    String name
    Country country
    Date lastUpdated

    String toString() { name }

    static hasMany = [addresses:Address]

    static mapping = {
        id column: 'city_id'
        name column: 'city'
        lastUpdated column: 'last_update'
        version false
    }

    static constraints = {
        name blank: false
    }
}
