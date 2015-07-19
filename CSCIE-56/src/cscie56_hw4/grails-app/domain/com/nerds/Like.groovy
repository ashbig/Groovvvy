package com.nerds

/**
 * Created by ashbig on 11/15/2014.
 */
class Like {
    boolean liked
    Date likedOn

    static belongsTo = [post:Post]
}
