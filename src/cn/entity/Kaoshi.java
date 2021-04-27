package cn.entity;

public class Kaoshi {
    private Integer id;

    private Integer uid;

    private Integer tid;

    private String daan;

    private Integer sid;

    public Kaoshi(Integer id, Integer uid, Integer tid, String daan, Integer sid) {
        this.id = id;
        this.uid = uid;
        this.tid = tid;
        this.daan = daan;
        this.sid = sid;
    }

    public Kaoshi() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getDaan() {
        return daan;
    }

    public void setDaan(String daan) {
        this.daan = daan == null ? null : daan.trim();
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }
}