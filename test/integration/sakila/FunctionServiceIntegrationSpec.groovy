package sakila


import spock.lang.*

/**
 *
 */
class FunctionServiceIntegrationSpec extends Specification {
    def functionService

    void "Customer 366 holds inventory 9"() {
        expect:
        functionService.getCustomerHoldingInventory(9) == Customer.get(366)
    }

    void "No customer holds inventory 8"() {
        expect:
        !functionService.getCustomerHoldingInventory(8)
    }

    void 'Inventory 8 is in stock'() {
        expect:
        functionService.isInventoryInStock(8)
    }

    void 'Inventory 9 is not in stock'() {
        expect:
        !functionService.isInventoryInStock(9)
    }

    void 'Listed customers have non-zero balances as of today'() {
        given:
        Date now = new Date()

        when:
        def custsWithNonZeroBalance = Customer.list().findAll { c ->
            functionService.getCustomerBalanceAsOf(c.id, now)
        }

        then:
        custsWithNonZeroBalance*.id.sort() == [16, 259, 401, 546, 554, 577]
    }
}
