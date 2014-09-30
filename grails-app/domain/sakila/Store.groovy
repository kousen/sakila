package sakila

class Store {
    Byte id
    Date lastUpdated
    Address address
    Staff manager

    static hasMany = [customers: Customer,
                      inventories: Inventory]

    static mapping = {
        id column: 'store_id'
        manager column: 'manager_staff_id'
        lastUpdated column: 'last_update'
        version false
    }

    static constraints = {
    }
}
