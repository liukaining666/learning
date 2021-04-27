package cn.entity;

public class Message {
    private Integer id;

    private Integer uid;

    private Integer nid;

    private Integer isread;

    private String content;
    
    private String username;
    
    

    public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Message(Integer id, Integer uid, Integer nid, Integer isread, String content) {
        this.id = id;
        this.uid = uid;
        this.nid = nid;
        this.isread = isread;
        this.content = content;
    }

    public Message() {
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

    public Integer getNid() {
        return nid;
    }

    public void setNid(Integer nid) {
        this.nid = nid;
    }

    public Integer getIsread() {
        return isread;
    }

    public void setIsread(Integer isread) {
        this.isread = isread;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}