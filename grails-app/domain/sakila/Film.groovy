package sakila

class Film {
    Short id
    String title
    String description
    int releaseYear
    Byte rentalDuration
    BigDecimal rentalRate
    Short length
    BigDecimal replacementCost
    String specialFeatures
    Date lastUpdated
    Rating rating

    Language language
    Language originalLanguage

    String toString() { title }

    static hasMany = [inventories: Inventory, actors: Actor, categories: Category]

    static mapping = {
        id column: 'film_id'
        description sqlType: 'text'
        rating sqlType: 'enum'
        releaseYear sqlType: 'year'
        specialFeatures sqlType: 'set'
        actors joinTable: 'film_actor'
        categories joinTable: 'film_category'
        lastUpdated column: 'last_update'
        version false
    }

    static constraints = {
        title()
        description nullable: true
        releaseYear nullable: true
        length nullable: true
        rating nullable: true
        specialFeatures nullable: true
    }
}
