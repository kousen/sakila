package sakila

import groovy.transform.ToString

@ToString(includes = ['rentalDate', 'returnDate'], includeNames = true)
class Rental {
    Integer id
    Date rentalDate
    Date returnDate
    Date lastUpdated

    Inventory inventory
    Staff staff

    static hasMany = [payments: Payment]
    static belongsTo = [customer: Customer]

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
