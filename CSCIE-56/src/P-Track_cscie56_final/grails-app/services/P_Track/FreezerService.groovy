package P_Track

import com.freezers.Freezer
import grails.transaction.Transactional

@Transactional
class FreezerService {

    void delete (Freezer f) {
        f.delete()
    }

    void save (Freezer f) {
        f.save()
    }
}
