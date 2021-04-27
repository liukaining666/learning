package cn.entity;

import java.util.Set;

public class Record {
    private Integer id;

    private String time;

    private Integer uid;

    private Integer nid;

    private String content;

    private Integer role;
    
    private String username;
    
    private String nname;
    
    private Set<Hufu> hSet;
    
    private String kindname;
    

  
	public String getKindname() {
		return kindname;
	}

	public void setKindname(String kindname) {
		this.kindname = kindname;
	}

	public Set<Hufu> gethSet() {
		return hSet;
	}

	public void sethSet(Set<Hufu> hSet) {
		this.hSet = hSet;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getNname() {
		return nname;
	}

	public void setNname(String nname) {
		this.nname = nname;
	}

	public Record(Integer id, String time, Integer uid, Integer nid, String content, Integer role) {
        this.id = id;
        this.time = time;
        this.uid = uid;
        this.nid = nid;
        this.content = content;
        this.role = role;
    }

    public Record() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getNid() {
        return nid;
    }

    public void setNid(Integer nid) {
        this.nid = nid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }
}