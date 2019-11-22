package johnson.sean.capstoneapi.controller;

import johnson.sean.capstoneapi.exception.NoSuchEntityException;
import johnson.sean.capstoneapi.model.Expense;
import johnson.sean.capstoneapi.model.Item;
import johnson.sean.capstoneapi.model.repositories.ItemJpaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/items")
public class ItemRestController {
    @Autowired
    private ItemJpaRepository itemRepo;
    @Autowired
    private ExpenseRestController expenseController;

    @RequestMapping(path = "/{expenseId}", method = RequestMethod.POST)
    @Transactional
    public Integer createItem(@PathVariable int expenseId, @RequestBody Item item) {
        Expense expense = expenseController.getById(expenseId);
        item.setExpense(expense);
        expense.setTotal(expense.getTotal() + item.getCost());
        expenseController.updateExpense(expense.getId(), expense);
        itemRepo.saveAndFlush(item);
        return item.getId();
    }

    @RequestMapping(path = "", method = RequestMethod.GET)
    public List<Item> getAllItems() {
        return itemRepo.findAll();
    }

    @RequestMapping(path = "/{itemId}", method = RequestMethod.GET)
    public Item getById(@PathVariable int itemId) {
        return itemRepo.findById(itemId).orElseThrow(() -> new NoSuchEntityException(itemId, Item.class));
    }

    @RequestMapping(path = "/{itemId}", method = RequestMethod.DELETE)
    @Transactional
    public void deleteItem(@PathVariable int itemId) {
        Item item = getById(itemId);
        Expense expense = expenseController.getById(item.getExpense().getId());
        expense.setTotal(expense.getTotal() - item.getCost());
        expenseController.updateExpense(expense.getId(), expense);
        itemRepo.deleteById(itemId);
    }

    @RequestMapping(path = "/{itemId}", method = RequestMethod.PUT)
    @Transactional
    public void updateItem(@PathVariable int itemId, @RequestBody Item newValues) {
        Item existingItem = getById(itemId);
        existingItem.copy(newValues);
        itemRepo.saveAndFlush(existingItem);
    }

    @RequestMapping(path = "/{itemId}", method = RequestMethod.PATCH)
    @Transactional
    public void updateItemProperties(@PathVariable int itemId, @RequestBody Map<String, Object> newValues) {
        Item existingItem = getById(itemId);
        existingItem.setName((String) newValues.get("name"));
        existingItem.setCost((float) newValues.get("cost"));
        itemRepo.saveAndFlush(existingItem);
    }
}
