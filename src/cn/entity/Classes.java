package cn.entity;

import java.util.Date;

public class Classes {
    private Integer id;

    private String name;//名称
    
    private String msg;//口号

    


	public Classes(Integer id,  String name, String msg) {
        this.id = id;
        this.name = name;
        this.msg = msg;
    }

    public Classes() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    
   
}