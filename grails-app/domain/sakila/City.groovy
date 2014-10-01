package sakila

class City {
    Short id
    String name
    Date lastUpdated

    String toString() { name }

    static hasMany = [addresses: Address]
    static belongsTo = [country: Country]

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
