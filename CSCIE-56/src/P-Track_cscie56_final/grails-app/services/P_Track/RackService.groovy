package P_Track

import com.freezers.Rack
import grails.transaction.Transactional

@Transactional
class RackService {

    void delete (Rack s) {
        r.delete()
    }

    void save (Rack r) {
        r.save()
    }
}
