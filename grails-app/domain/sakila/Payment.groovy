package sakila

import java.text.NumberFormat

class Payment {
    Short id
    BigDecimal amount
    Date paymentDate
    Date lastUpdated

    Staff staff
    Rental rental

    String toString() {
        String amtString = NumberFormat.currencyInstance.format(amount ?: 0.0)
        "$amtString on $paymentDate"
    }

    static belongsTo = [customer: Customer]

    static mapping = {
        id column: 'payment_id'
        lastUpdated column: 'last_update'
        version false
    }

    static constraints = {
    }
}
