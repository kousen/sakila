package sakila

class Inventory {
    Integer id
    Date lastUpdated

    Film film
    Store store

    String toString() { "$film.title at $store.address" }

    static hasMany = [rentals:Rental]

    static mapping = {
        id column: 'inventory_id'
        lastUpdated column: 'last_update'
        version false
    }
    static constraints = {
    }
}
