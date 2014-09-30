package sakila

class Staff {
    Byte id
    String firstName
    String lastName
    byte[] picture
    String email
    boolean active
    String userName
    String password
    Date lastUpdated

    Address address
    Store store

    String toString() { "$firstName $lastName" }

    static hasMany = [rentals: Rental, payments: Payment]

    static mapping = {
        id column: 'staff_id'
        lastUpdated column: 'last_update'
        userName column: 'username'
        picture sqlType: 'blob'
        version false
    }

    static constraints = {
        firstName()
        lastName()
        picture nullable: true
        email nullable: true, email: true
        password nullable: true
    }
}
