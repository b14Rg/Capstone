package johnson.sean.capstoneapi.controller;

import johnson.sean.capstoneapi.exception.NoSuchEntityException;
import johnson.sean.capstoneapi.model.Bill;
import johnson.sean.capstoneapi.model.User;
import johnson.sean.capstoneapi.model.repositories.BillJpaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/bills")
public class BillRestController {
    @Autowired
    private BillJpaRepository billRepo;
    @Autowired
    private UserRestController userController;

    @RequestMapping(path = "/{userId}", method = RequestMethod.GET)
    @Transactional
    public Integer createBill(@PathVariable int userId, @RequestBody Bill bill) {
        User user = userController.getById(userId);
        bill.setUser(user);
        billRepo.saveAndFlush(bill);
        return bill.getId();
    }

    @RequestMapping(path = "", method = RequestMethod.GET)
    public List<Bill> getAllBills() {
        return billRepo.findAll();
    }

    @RequestMapping(path = "/{billId}", method = RequestMethod.GET)
    public Bill getById(@PathVariable int billId) {
        return billRepo.findById(billId).orElseThrow(() -> new NoSuchEntityException(billId, Bill.class));
    }

    @RequestMapping(path = "/{billId}", method = RequestMethod.DELETE)
    @Transactional
    public void deleteBill(@PathVariable int billId) {
        billRepo.deleteById(billId);
    }

    @RequestMapping(path = "/{billId}", method = RequestMethod.PUT)
    @Transactional
    public void updateBill(@PathVariable int billId, @RequestBody Bill newValues) {
        Bill existingBill = getById(billId);
        existingBill.copy(newValues);
        billRepo.saveAndFlush(existingBill);
    }

    @RequestMapping(path = "/{billId}", method = RequestMethod.PATCH)
    @Transactional
    public void updateBillProperties(@PathVariable int billId, @RequestBody Map<String, Object> newValues) {
        Bill existingBill = getById(billId);
        existingBill.setName((String) newValues.get("name"));
        existingBill.setAmount((Float) newValues.get("amount"));
        billRepo.saveAndFlush(existingBill);
    }
}
