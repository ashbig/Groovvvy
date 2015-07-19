package com.freezers

class Freezer implements Serializable{

    String name
    Integer numShelves
    Integer numRacksPerShelf

    static hasMany = [shelves:Shelf]

    static constraints = {
        name size: 1..20, nullable: false
        numShelves minSize: 1
        numRacksPerShelf minSize : 1
        shelves nullable: true, blank : true, minSize: 0, cascade: 'all'
    }

   /*
    * Before the freezer persists to the database
    * Add the number of shelves it will contain
    *
    * param1 - user input for number of shelves
    * param2 - user input for number of racks per shelf
    */
    def beforeInsert() {
        for ( int j = 0; j < numShelves; j ++){
            Shelf shelf = new Shelf()
            shelf.racksPerShelf = numRacksPerShelf
            shelf.name = "Shelf " + j
            addToShelves(shelf)
        }
    }

    def String toString () {
        return name
    }
}
