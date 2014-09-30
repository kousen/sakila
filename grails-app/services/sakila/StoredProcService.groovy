package sakila

import grails.transaction.Transactional
import groovy.sql.Sql

@Transactional
class StoredProcService {
    def dataSource

    int getFilmsInStock(filmId, storeId) {
        String sqlTxt = "{call film_in_stock(?,?,?)}"
        return callProc(sqlTxt, filmId, storeId)
    }

    int getFilmsNotInStock(filmId, storeId) {
        String sqlTxt = "{call film_not_in_stock(?,?,?)}"
        return callProc(sqlTxt, filmId, storeId)
    }

    int getRewardsReport(minMonthlyPurchases, minDollarAmountPurchased) {
        String sqlTxt = "{call rewards_report(?,?,?)}"
        return callProc(sqlTxt, minMonthlyPurchases, minDollarAmountPurchased)
    }

    private int callProc(String sqlTxt, arg1, arg2) {
        Sql db = new Sql(dataSource)
        int result = 0
        db.call(sqlTxt, [arg1, arg2, Sql.INTEGER]) { count ->
            result = count
        }
        return result
    }
}
