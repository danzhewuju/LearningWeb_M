package Entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "association", schema = "learningweb", catalog = "")
public class AssociationEntity {
    private String id;
    private String chapterid;
    private String prochapterid;

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
    @Column(name = "chapterid", nullable = false, length = 50)
    public String getChapterid() {
        return chapterid;
    }

    public void setChapterid(String chapterid) {
        this.chapterid = chapterid;
    }

    @Basic
    @Column(name = "prochapterid", nullable = false, length = 50)
    public String getProchapterid() {
        return prochapterid;
    }

    public void setProchapterid(String prochapterid) {
        this.prochapterid = prochapterid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AssociationEntity that = (AssociationEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (chapterid != null ? !chapterid.equals(that.chapterid) : that.chapterid != null) return false;
        if (prochapterid != null ? !prochapterid.equals(that.prochapterid) : that.prochapterid != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (chapterid != null ? chapterid.hashCode() : 0);
        result = 31 * result + (prochapterid != null ? prochapterid.hashCode() : 0);
        return result;
    }
}
