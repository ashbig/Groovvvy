package com.nerds

class Nerd {

    String firstname
    String lastname
    String intials
    Date birthdate
    Boolean acceptedTerms

    static constraints = {
        intials nullable: true, blank: true
    }
}
