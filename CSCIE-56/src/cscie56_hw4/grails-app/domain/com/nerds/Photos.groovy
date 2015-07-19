package com.nerds

/**
 * Created by ashbig on 11/15/2014.
 */
class Photos {

    byte [] images
    String title
    Date datePosted

    static constraints = {
        images  size: 1..5
    }
}
