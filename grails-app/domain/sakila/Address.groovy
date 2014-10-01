package sakila

class Address {
    Short id
    String street1
    String street2
    String district
    String postalCode
    String phone
    Date lastUpdated

    String toString() { "$street1, $city, $district" }

    static belongsTo = [city: City]

    static mapping = {
        id column: 'address_id'
        street1 column: 'address'
        street2 column: 'address2'
        lastUpdated column: 'last_update'
        version false
    }

    static constraints = {
        street1 blank: false
        street2 nullable: true
        district()
        postalCode nullable: true
        phone()
        city()
    }
}
