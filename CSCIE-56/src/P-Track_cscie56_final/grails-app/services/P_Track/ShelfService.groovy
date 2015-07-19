package P_Track

import com.freezers.Shelf
import grails.transaction.Transactional

@Transactional
class ShelfService {

    void delete (Shelf s) {
        s.delete()
    }

    void save (Shelf s) {
        s.save()
    }
}

