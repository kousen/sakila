package sakila

enum Rating {
    G('G'), PG('PG'), PG_13('PG-13'),
    R('R'), NC_17('NC-17')
    String id

    Rating(String id) {
        this.id = id
    }
}
