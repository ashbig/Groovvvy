package com.nerds

/**
 * Created by ashbig on 11/15/2014.
 */
class Dislike {
    boolean disliked
    Date dislikedOn

    static belongsTo = [post: Post]
}
