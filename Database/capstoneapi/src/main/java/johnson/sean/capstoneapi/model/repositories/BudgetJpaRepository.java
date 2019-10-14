package johnson.sean.capstoneapi.model.repositories;

import johnson.sean.capstoneapi.model.Budget;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BudgetJpaRepository extends JpaRepository<Budget, Integer> {
}
