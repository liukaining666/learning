package cn.entity;

public class Kind {
    private Integer id;

    private String kindname;

    private Integer isexamine;
    
    private Integer userid;
    
    public Kind(Integer id, String kindname, Integer isexamine,Integer userid) {
        this.id = id;
        this.kindname = kindname;
        this.isexamine = isexamine;
        this.userid = userid;
    }

    public Kind() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getKindname() {
        return kindname;
    }

    public void setKindname(String kindname) {
        this.kindname = kindname == null ? null : kindname.trim();
    }

    public Integer getIsexamine() {
        return isexamine;
    }

    public void setIsexamine(Integer isexamine) {
        this.isexamine = isexamine;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }


}