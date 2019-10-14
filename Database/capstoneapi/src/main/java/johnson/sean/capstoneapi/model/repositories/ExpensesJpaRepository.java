package johnson.sean.capstoneapi.model.repositories;

import johnson.sean.capstoneapi.model.Expense;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ExpensesJpaRepository extends JpaRepository<Expense, Integer> {
}
