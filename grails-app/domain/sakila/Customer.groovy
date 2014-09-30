package sakila

class Customer {
    Short id
    String firstName
    String lastName
    String email
    boolean active

    Date dateCreated
    Date lastUpdated

    Store store
    Address address

    String toString() { "$firstName $lastName" }

    static hasMany = [rentals: Rental, payments: Payment]

    static mapping = {
        id column: 'customer_id'
        dateCreated column: 'create_date'
        lastUpdated column: 'last_update'
        version false
    }

    static constraints = {
        firstName()
        lastName()
        email nullable: true, email: true
    }
}
