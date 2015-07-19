package com.nerds

class Nerd {
    String firstName
    String lastName
    String middleInitial
    Date dateOfBirth
    String  eMail
    boolean acceptedTerms

    static constraints = {
        middleInitial(nullable: true)
    }
}
