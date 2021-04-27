package cn.entity;

public class Score {
    private Integer id;

    private Integer uid;

    private String ctime;

    private Integer score;
    
    private String username;

    public Score(Integer id, Integer uid, String ctime, Integer score) {
        this.id = id;
        this.uid = uid;
        this.ctime = ctime;
        this.score = score;
    }

    public Score() {
        super();
    }

    public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

    public String getCtime() {
        return ctime;
    }

    public void setCtime(String ctime) {
        this.ctime = ctime == null ? null : ctime.trim();
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }
}