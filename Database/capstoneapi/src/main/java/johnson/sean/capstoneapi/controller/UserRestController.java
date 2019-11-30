package johnson.sean.capstoneapi.controller;

import johnson.sean.capstoneapi.exception.NoSuchEntityException;
import johnson.sean.capstoneapi.model.Budget;
import johnson.sean.capstoneapi.model.Expense;
import johnson.sean.capstoneapi.model.Income;
import johnson.sean.capstoneapi.model.User;
import johnson.sean.capstoneapi.model.repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/users")
public class UserRestController {
    @Autowired
    private UserJpaRepository userRepo;
    @Autowired
    private ExpensesJpaRepository expensesRepo;
    @Autowired
    private IncomeJpaRepository incomeRepo;
    @Autowired
    private BudgetJpaRepository budgetRepo;

    @RequestMapping(path = "", method = RequestMethod.POST)
    @Transactional
    public Integer createUser(@RequestBody User user) {
        incomeRepo.saveAndFlush(user.getIncome());
        budgetRepo.saveAndFlush(user.getBudget());
        userRepo.saveAndFlush((user));
        return user.getId();
    }

    @RequestMapping(path = "", method = RequestMethod.GET)
    public List<User> getAllUsers() {
        return userRepo.findAll();
    }


    @RequestMapping(path = "/{userId}", method = RequestMethod.GET)
    public User getById(@PathVariable int userId) {
        return userRepo.findById(userId).orElseThrow(() -> new NoSuchEntityException(userId, User.class));
    }

    @RequestMapping(path = "/{userId}", method = RequestMethod.DELETE)
    @Transactional
    public void deleteUser(@PathVariable int userId) {
        User user = getById(userId);
        for(Expense expense : user.getExpenses()){
            expensesRepo.deleteById(expense.getId());
        }
        userRepo.deleteById(user.getId());
        incomeRepo.deleteById(user.getIncome().getId());
        budgetRepo.deleteById(user.getBudget().getId());

    }

    @RequestMapping(path = "/{userId}", method = RequestMethod.PUT)
    @Transactional
    public int updateUser(@PathVariable int userId, @RequestBody User newValues) {
        User existingUser = getById(userId);
        existingUser.copy(newValues);
        incomeRepo.saveAndFlush(existingUser.getIncome());
        budgetRepo.saveAndFlush(existingUser.getBudget());
        userRepo.saveAndFlush(existingUser);
        return existingUser.getId();
    }

    @RequestMapping(path = "/{userId}", method = RequestMethod.PATCH)
    @Transactional
    public int updateUserProperties(@PathVariable int userId, @RequestBody Map<String, Object> newValues) {
        User existingUser = getById(userId);
        existingUser.setIncome((Income) newValues.get("income"));
        existingUser.setBudget((Budget) newValues.get("budget"));
        incomeRepo.saveAndFlush(existingUser.getIncome());
        budgetRepo.saveAndFlush(existingUser.getBudget());
        userRepo.saveAndFlush(existingUser);
        return existingUser.getId();
    }

    @RequestMapping(path = "/searchByEmail", method = RequestMethod.GET)
    public User searchUserByEmail(@RequestParam(name = "email", required = true) String searchEmail) {
        return userRepo.findByEmail(searchEmail);
    }
}
