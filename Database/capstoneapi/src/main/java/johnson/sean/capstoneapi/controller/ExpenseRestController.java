package johnson.sean.capstoneapi.controller;

import johnson.sean.capstoneapi.exception.NoSuchEntityException;
import johnson.sean.capstoneapi.model.Expense;
import johnson.sean.capstoneapi.model.Item;
import johnson.sean.capstoneapi.model.User;
import johnson.sean.capstoneapi.model.repositories.ExpensesJpaRepository;
import johnson.sean.capstoneapi.model.repositories.ItemJpaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/expenses")
public class ExpenseRestController {
    @Autowired
    private ExpensesJpaRepository expenseRepo;
    @Autowired
    private ItemJpaRepository itemRepo;
    @Autowired
    private UserRestController userController;

    @RequestMapping(path = "/{userId}", method = RequestMethod.POST)
    @Transactional
    public Integer createExpense(@PathVariable int userId, @RequestBody Expense expense){
        User user = userController.getById(userId);
        expense.setUser(user);
        expenseRepo.saveAndFlush(expense);
        return expense.getId();
    }

    @RequestMapping(path = "", method = RequestMethod.GET)
    public List<Expense> getAllExpenses() {
        return expenseRepo.findAll();
    }

    @RequestMapping(path = "/{expenseId}")
    public Expense getById(@PathVariable int expenseId) {
        return expenseRepo.findById(expenseId).orElseThrow(() -> new NoSuchEntityException(expenseId, Expense.class));
    }

    @RequestMapping(path = "/{expenseId}", method = RequestMethod.DELETE)
    @Transactional
    public void deleteExpense(@PathVariable int expenseId) {
        Expense expense = getById(expenseId);
        for(Item item : expense.getItems()){
            itemRepo.deleteById(item.getId());
        }
        expenseRepo.deleteById(expenseId);
    }

    @RequestMapping(path = "/{expenseId}", method = RequestMethod.PUT)
    @Transactional
    public void updateExpense(@PathVariable int expenseId, @RequestBody Expense newValues) {
        Expense existingExpense = getById(expenseId);
        existingExpense.copy(newValues);
        expenseRepo.saveAndFlush(existingExpense);
    }

    @RequestMapping(path = "/{expenseId}", method = RequestMethod.PATCH)
    @Transactional
    public void updateExpenseProperties(@PathVariable int expenseId, @RequestBody Map<String, Object> newValues) {
        Expense existingExpense = getById(expenseId);
        existingExpense.setItems((List<Item>)newValues.get("items"));
        existingExpense.setTotal((float)newValues.get("total"));
    }
}
