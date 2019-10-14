package johnson.sean.capstoneapi.model.repositories;

import johnson.sean.capstoneapi.model.Credentials;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CredentialsJpaRepository extends JpaRepository<Credentials, Integer> {
}
