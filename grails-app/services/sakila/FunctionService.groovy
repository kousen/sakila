package sakila

import grails.transaction.Transactional
import groovy.sql.Sql

@Transactional
class FunctionService {
    def dataSource

    BigDecimal getCustomerBalanceAsOf(custId, date) {
        Sql sql = new Sql(dataSource)
        def output = sql.firstRow('select get_customer_balance(?,?) as result', [custId, date])
        return output.result
    }

    // return Customer holding the inventory (null if none)
    Customer getCustomerHoldingInventory(inventoryId) {
        Sql sql = new Sql(dataSource)
        def output = sql.firstRow('select inventory_held_by_customer(?) as result', inventoryId)
        return output.result ? Customer.get(output.result as short) : null
    }

    boolean isInventoryInStock(inventoryId) {
        Sql sql = new Sql(dataSource)
        def output = sql.firstRow('select inventory_in_stock(?) as result', inventoryId)
        return output.result
    }

}
