/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author TuanAnh
 */
public class Flock {
    private int FID;
    private String FName;
    private Date Purchase_date;
    private Date Sale_date;

    public Flock() {
    }

    public Flock(int FID, String FName, Date Purchase_date, Date Sale_date) {
        this.FID = FID;
        this.FName = FName;
        this.Purchase_date = Purchase_date;
        this.Sale_date = Sale_date;
    }

    public int getFID() {
        return FID;
    }

    public void setFID(int FID) {
        this.FID = FID;
    }

    public String getFName() {
        return FName;
    }

    public void setFName(String FName) {
        this.FName = FName;
    }

    public Date getPurchase_date() {
        return Purchase_date;
    }

    public void setPurchase_date(Date Purchase_date) {
        this.Purchase_date = Purchase_date;
    }

    public Date getSale_date() {
        return Sale_date;
    }

    public void setSale_date(Date Sale_date) {
        this.Sale_date = Sale_date;
    }
}
