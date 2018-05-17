package Entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "addcourse", schema = "learningweb", catalog = "")
public class AddcourseEntity {
    private String id;
    private String teacherid;
    private String result;
    private String course;
    private String precourseid1;
    private String precourseid2;
    private String precourseid3;
    private String precourseid4;


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
    @Column(name = "teacherid", nullable = false, length = 50)
    public String getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(String teacherid) {
        this.teacherid = teacherid;
    }

    @Basic
    @Column(name = "result", nullable = true, length = 50)
    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    @Basic
    @Column(name = "course", nullable = false, length = 50)
    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    @Basic
    @Column(name = "precourseid1", nullable = true, length = 50)
    public String getPrecourseid1() {
        return precourseid1;
    }

    public void setPrecourseid1(String precourseid1) {
        this.precourseid1 = precourseid1;
    }

    @Basic
    @Column(name = "precourseid2", nullable = true, length = 50)
    public String getPrecourseid2() {
        return precourseid2;
    }

    public void setPrecourseid2(String precourseid2) {
        this.precourseid2 = precourseid2;
    }

    @Basic
    @Column(name = "precourseid3", nullable = true, length = 50)
    public String getPrecourseid3() {
        return precourseid3;
    }

    public void setPrecourseid3(String precourseid3) {
        this.precourseid3 = precourseid3;
    }

    @Basic
    @Column(name = "precourseid4", nullable = true, length = 50)
    public String getPrecourseid4() {
        return precourseid4;
    }

    public void setPrecourseid4(String precourseid4) {
        this.precourseid4 = precourseid4;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AddcourseEntity that = (AddcourseEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (teacherid != null ? !teacherid.equals(that.teacherid) : that.teacherid != null) return false;
        if (result != null ? !result.equals(that.result) : that.result != null) return false;
        if (course != null ? !course.equals(that.course) : that.course != null) return false;
        if (precourseid1 != null ? !precourseid1.equals(that.precourseid1) : that.precourseid1 != null) return false;
        if (precourseid2 != null ? !precourseid2.equals(that.precourseid2) : that.precourseid2 != null) return false;
        if (precourseid3 != null ? !precourseid3.equals(that.precourseid3) : that.precourseid3 != null) return false;
        if (precourseid4 != null ? !precourseid4.equals(that.precourseid4) : that.precourseid4 != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result1 = id != null ? id.hashCode() : 0;
        result1 = 31 * result1 + (teacherid != null ? teacherid.hashCode() : 0);
        result1 = 31 * result1 + (result != null ? result.hashCode() : 0);
        result1 = 31 * result1 + (course != null ? course.hashCode() : 0);
        result1 = 31 * result1 + (precourseid1 != null ? precourseid1.hashCode() : 0);
        result1 = 31 * result1 + (precourseid2 != null ? precourseid2.hashCode() : 0);
        result1 = 31 * result1 + (precourseid3 != null ? precourseid3.hashCode() : 0);
        result1 = 31 * result1 + (precourseid4 != null ? precourseid4.hashCode() : 0);
        return result1;
    }
}
