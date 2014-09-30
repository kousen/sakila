package sakila



import spock.lang.*

class StoreProcServiceIntegrationSpec extends Specification {
    def storedProcService

    void "call film_in_stock stored procedure"() {
        expect:
        storedProcService.getFilmsInStock(1, 1) == 4
    }

    void "call film_not_in_stock stored procedure"() {
        expect:
        storedProcService.getFilmsNotInStock(2, 2.0) == 1
    }

    void "call rewards_report stored procedure"() {
        expect: 'procedure uses current date, which is beyond all included data'
        storedProcService.getRewardsReport(7, 20.0) == 0
    }
}
