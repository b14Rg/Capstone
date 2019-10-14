package johnson.sean.capstoneapi.model.repositories;

import johnson.sean.capstoneapi.model.Item;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ItemJpaRepository extends JpaRepository<Item, Integer> {
}
