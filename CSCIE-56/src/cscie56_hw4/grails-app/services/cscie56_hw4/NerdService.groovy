package cscie56_hw4

import com.nerds.Nerd
import grails.transaction.Transactional


// I did not modify create as it only made a response request
// and no actual transaction, save was modified in its place.
@Transactional
class NerdService {

    void update(Nerd n) {
        n.save()
    }

    void delete (Nerd n) {
        n.delete()
    }

    void save (Nerd n) {
        n.save()
    }

}
