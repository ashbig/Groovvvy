package com.freezers

/**
 * Created by ashbig on 12/9/2014.
 */
class Plate implements Serializable{
    String name

    static belongsTo = [rack: Rack]

    static constraints = {
        name size: 1..30
    }

    def String toString () {
        return name
    }
}
