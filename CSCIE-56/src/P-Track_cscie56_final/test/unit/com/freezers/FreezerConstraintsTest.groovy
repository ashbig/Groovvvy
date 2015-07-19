package com.freezers

import grails.test.mixin.TestFor
/**
 * Created by ashbig on 12/24/2014.
 */
@TestFor(Freezer)
class FreezerConstraintsTest {

    /*
     * Testing all applicable constraints in freezer
     * names of things like shelf and rack and be redundant
     * as they are named once by the system, and optionally by the user,
     * and thus are not required and no need to test. This makes it so
     * most constraints tests can be handled by testing only the constraints of freezer.
     */


    void testNameNull() {
        def f = new Freezer (numShelves: 4, numRacksPerShelf: 4)
        assert !f.validate()

        f.name ='Bonnie'
        assert f.validate()
    }

    void testNameSizeTooSmall() {
        // check name length is not < 1
        def f = new Freezer (numShelves: 4, numRacksPerShelf: 4, name:"")
        assert !f.validate()

        f.name ='Bonnie'
        assert f.validate()
    }

    void testNameSizeTooLarge() {
        // check name length is not < 1
        def f = new Freezer (numShelves: 4, numRacksPerShelf: 4, name:"atsomepointhisrandomstringwillbelongerthan20charsihopeanywayyeaitisnowforsure")
        assert !f.validate()

        f.name ='Bonnie'
        assert f.validate()
    }

    void testShelfSize() {
        def f = new Freezer ( numRacksPerShelf: 4, name: "bonnie")
        assert !f.validate()

        f.numShelves = 4
        assert f.validate()
    }

    void testRackSize() {
        def f = new Freezer (numShelves: 4, name: 'bonnie')
        assert !f.validate()

        f.numRacksPerShelf = 4
        assert f.validate()
    }
}
