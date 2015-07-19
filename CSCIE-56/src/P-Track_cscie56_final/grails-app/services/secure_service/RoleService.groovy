package secure_service

import com.springsecure.Role
import grails.transaction.Transactional

@Transactional
class RoleService {

    void delete(Role role) {
        role.delete()
    }

    void save(Role r) {
        role.save()
    }
}