package johnson.sean.capstoneapi.model.repositories;

import johnson.sean.capstoneapi.model.Income;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IncomeJpaRepository extends JpaRepository<Income, Integer> {
}
