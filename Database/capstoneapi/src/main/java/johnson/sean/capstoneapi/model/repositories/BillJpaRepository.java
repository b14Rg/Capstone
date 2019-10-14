package johnson.sean.capstoneapi.model.repositories;

import johnson.sean.capstoneapi.model.Bill;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BillJpaRepository extends JpaRepository<Bill, Integer> {
}
