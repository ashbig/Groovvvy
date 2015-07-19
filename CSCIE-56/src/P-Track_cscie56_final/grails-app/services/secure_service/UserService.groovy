package secure_service

import com.springsecure.User
import grails.transaction.Transactional

@Transactional
class UserService {

    void delete(User user) {
        role.delete()
    }

    void save(User user) {
        role.save()
    }
}
