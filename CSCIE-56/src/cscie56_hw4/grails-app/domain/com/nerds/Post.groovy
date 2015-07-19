package com.nerds

import mood.ShareMood

/**
 * Created by ashbig on 11/15/2014.
 */
class Post {
    String message
    Date posted

    // Setting relationships of the post
    static hasOne = [ photos: Photos ]
    static hasMany = [ like: Like, dislike: Dislike]
    static constraints = {
        message size: 1..2000
        photos unique: true
        photos nullable: true
        like unique: true
        dislike unique: true
    }
}
