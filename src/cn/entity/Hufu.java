package cn.entity;

import java.util.Date;

public class Hufu {
    private Integer id;

    private Integer uid;

    private Integer rid;

    private String content;
    
    private String username;

    private String time;
    
    

    public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Hufu(Integer id, Integer uid, Integer rid, String content, String time) {
        this.id = id;
        this.uid = uid;
        this.rid = rid;
        this.content = content;
        this.time = time;
    }

    public Hufu() {
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

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}