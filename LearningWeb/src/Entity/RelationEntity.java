package Entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "relation", schema = "learningweb", catalog = "")
public class RelationEntity {
    private String id;
    private String courseid;
    private String frontcourseid;

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
    @Column(name = "courseid", nullable = false, length = 50)
    public String getCourseid() {
        return courseid;
    }

    public void setCourseid(String courseid) {
        this.courseid = courseid;
    }

    @Basic
    @Column(name = "frontcourseid", nullable = false, length = 50)
    public String getFrontcourseid() {
        return frontcourseid;
    }

    public void setFrontcourseid(String frontcourseid) {
        this.frontcourseid = frontcourseid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        RelationEntity that = (RelationEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (courseid != null ? !courseid.equals(that.courseid) : that.courseid != null) return false;
        if (frontcourseid != null ? !frontcourseid.equals(that.frontcourseid) : that.frontcourseid != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (courseid != null ? courseid.hashCode() : 0);
        result = 31 * result + (frontcourseid != null ? frontcourseid.hashCode() : 0);
        return result;
    }
}
