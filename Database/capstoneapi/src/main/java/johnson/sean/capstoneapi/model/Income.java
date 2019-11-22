package johnson.sean.capstoneapi.model;

import javax.persistence.*;

@Entity
@Table(name = "income")
public class Income {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Column(nullable = false)
    private float daily;

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
}
