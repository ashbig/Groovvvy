package P_Track

import com.freezers.Plate
import grails.transaction.Transactional

@Transactional
class PlateService {

    void delete (Plate p) {
        p.delete()
    }

    void save (Plate p) {
        p.save()
    }
}
