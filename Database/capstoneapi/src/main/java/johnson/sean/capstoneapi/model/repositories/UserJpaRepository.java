package johnson.sean.capstoneapi.model.repositories;

import johnson.sean.capstoneapi.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserJpaRepository extends JpaRepository<User, Integer> {
    User findByEmail(String user_email);
}
