package Entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "learn", schema = "learningweb", catalog = "")
public class LearnEntity {
    private String id;
    private String studentid;
    private String courseid;


    @Id
    @GeneratedValue(generator = "uuid") @GenericGenerator(name = "uuid", strategy = "uuid")
    @Column(name = "id", nullable = false, length = 50)
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Basic
    @Column(name = "studentid", nullable = false, length = 50)
    public String getStudentid() {
        return studentid;
    }

    public void setStudentid(String studentid) {
        this.studentid = studentid;
    }

    @Basic
    @Column(name = "courseid", nullable = false, length = 50)
    public String getCourseid() {
        return courseid;
    }

    public void setCourseid(String courseid) {
        this.courseid = courseid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        LearnEntity that = (LearnEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (studentid != null ? !studentid.equals(that.studentid) : that.studentid != null) return false;
        if (courseid != null ? !courseid.equals(that.courseid) : that.courseid != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (studentid != null ? studentid.hashCode() : 0);
        result = 31 * result + (courseid != null ? courseid.hashCode() : 0);
        return result;
    }
}
