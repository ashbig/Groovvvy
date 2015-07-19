package com.freezers

class Rack implements Serializable{

    String name
    static belongsTo = [shelf: Shelf]
    static hasMany = [plates: Plate]

    def String toString () {
        return name
    }
}
