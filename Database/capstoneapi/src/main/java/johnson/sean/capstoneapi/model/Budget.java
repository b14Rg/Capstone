package johnson.sean.capstoneapi.model;

import javax.persistence.*;

@Entity
@Table(name = "budget")
public class Budget {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Column(nullable = false)
    private float daily;
    private float weekly;
    private float monthly;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getDaily() {
        return daily;
    }

    public void setDaily(float daily) {
        this.daily = daily;
    }

    public float getWeekly() {
        return weekly;
    }

    public void setWeekly(float weekly) {
        this.weekly = weekly;
    }

    public float getMonthly() {
        return monthly;
    }

    public void setMonthly(float monthly) {
        this.monthly = monthly;
    }
}
