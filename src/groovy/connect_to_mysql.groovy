import groovy.sql.Sql

Sql db = Sql.newInstance(url:'jdbc:mysql://localhost:3306/sakila',
    user:'root', password:'', driver:'com.mysql.jdbc.Driver')

String sqlTxt = 'select * from city'
db.eachRow(sqlTxt) { row ->
    println "$row.city_id, $row.city, $row.country_id, $row.last_update"
}

db.close()