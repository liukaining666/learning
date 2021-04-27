package cn.entity;

public class Timu {
    private Integer id;

    private Integer kindid;

    private String title;

    private String opa;

    private String opb;

    private String opc;

    private String opd;

    private String answer;

    private Integer score;
    
    private Integer isdel;
    
    private String daan;

    public Timu(Integer id, Integer kindid, String title, String opa, String opb, String opc, String opd, String answer, Integer score,Integer isdel) {
        this.id = id;
        this.kindid = kindid;
        this.title = title;
        this.opa = opa;
        this.opb = opb;
        this.opc = opc;
        this.opd = opd;
        this.answer = answer;
        this.score = score;
        this.isdel = isdel;
       
    }

    public Timu() {
        super();
    }

    
    public String getDaan() {
		return daan;
	}

	public void setDaan(String daan) {
		this.daan = daan;
	}

	public Integer getId() {
        return id;
    }

    public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}

	public void setId(Integer id) {
        this.id = id;
    }

    public Integer getKindid() {
        return kindid;
    }

    public void setKindid(Integer kindid) {
        this.kindid = kindid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getOpa() {
        return opa;
    }

    public void setOpa(String opa) {
        this.opa = opa == null ? null : opa.trim();
    }

    public String getOpb() {
        return opb;
    }

    public void setOpb(String opb) {
        this.opb = opb == null ? null : opb.trim();
    }

    public String getOpc() {
        return opc;
    }

    public void setOpc(String opc) {
        this.opc = opc == null ? null : opc.trim();
    }

    public String getOpd() {
        return opd;
    }

    public void setOpd(String opd) {
        this.opd = opd == null ? null : opd.trim();
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer == null ? null : answer.trim();
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }
}