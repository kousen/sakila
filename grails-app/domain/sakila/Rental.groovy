package sakila

class Rental {
    Integer id
    Date rentalDate
    Date returnDate
    Date lastUpdated

    Inventory inventory
    Customer customer
    Staff staff

    static hasMany = [payments: Payment]

    static mapping = {
        id column: 'rental_id'
        lastUpdated column: 'last_update'
        version false
    }

    static constraints = {
        rentalDate()
        returnDate nullable: true
    }
}
