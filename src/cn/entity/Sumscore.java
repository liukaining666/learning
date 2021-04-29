package cn.entity;

import java.util.Date;

public class Sumscore {
    private Integer trueNum;//答对人数

    private Integer falseNum;//名称

    public Integer getTrueNum() {
        return trueNum;
    }

    public void setTrueNum(Integer trueNum) {
        this.trueNum = trueNum;
    }

    public Integer getFalseNum() {
        return falseNum;
    }

    public void setFalseNum(Integer falseNum) {
        this.falseNum = falseNum;
    }

    public Sumscore(Integer trueNum, Integer falseNum) {
        super();
        this.trueNum = trueNum;
        this.falseNum = falseNum;
    }

    public Sumscore() {
        super();
        // TODO Auto-generated constructor stub
    }
    

    


    
   
}