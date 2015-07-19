package com.freezers

class Shelf implements Serializable{

    String name
    Integer racksPerShelf
    static belongsTo = [freezer: Freezer]
    static hasMany = [racks:Rack]


    /*
     * Before the shelf persists to the database
     * Add the number of racks it will contain
     *
     * param1 - user input for number of racks
     */
    def beforeInsert() {
        for ( int j = 0; j < racksPerShelf; j ++){
            Rack rack = new Rack()
            rack.name = "Rack " + j
            addToRacks(rack)
        }
    }
    def String toString () {
        return name
    }
}