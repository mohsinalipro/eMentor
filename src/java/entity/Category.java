/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;

/**
 *
 * @author Mohsin Ali
 */
public class Category implements Serializable {
 private int categoryid;
 private String name;
 
 
 private String icon;

    public Category() {
    }

    public Category(int categoryid, String name, String icon) {
        this.categoryid = categoryid;
        this.name = name;
        this.icon = icon;
    }
    

    public int getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    @Override
    public String toString() {
        return "<a id=cat_" + name.toLowerCase().replace(' ', '_') + " href=\"/eMentor/category.jsp?id=" + categoryid + "\"><i class=\"fa fa-" + icon + "\"></i> <span>" + name + "</span></a>";
    }
    
    
 
}
