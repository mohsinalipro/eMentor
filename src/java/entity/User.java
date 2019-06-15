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
public class User implements Serializable {

    private int userid;
    private String username;
    private String password;
    private String email;
    private String fname;
    private String lname;
    private String city;
    private String country;
    private int usertype;
    private String registeredon;
    private int balance;

    private String profileimage;

    public User() {
    }

    public User(int userid, String username, String password, String email, String fname, String lname, String city, String country, int usertype, String registeredon, int balance, String profileimage) {
        this.userid = userid;
        this.username = username;
        this.password = password;
        this.email = email;
        this.fname = fname;
        this.lname = lname;
        this.city = city;
        this.country = country;
        this.usertype = usertype;
        this.registeredon = registeredon;
        this.balance = balance;
        this.profileimage = profileimage;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public int getUsertype() {
        return usertype;
    }

    public void setUsertype(int usertype) {
        this.usertype = usertype;
    }

    public String getRegisteredon() {
        return registeredon;
    }

    public void setRegisteredon(String registeredon) {
        this.registeredon = registeredon;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }

    public String getProfileimage() {
        return profileimage;
    }

    public void setProfileimage(String profileimage) {
        this.profileimage = profileimage;
    }

    public String getProfileLink() {
        return "<a href=\"/eMentor/profile.jsp?id=" + userid + "\">" + username + "</a>";
    }

     public static String getProfileImageCard(User u, boolean controls, boolean returnAdmin) {
        String out = "    <div class=\"card hovercard container-fluid\">"
                + "        <div class=\"card-background\">"
                + "            <img class=\"card-bkimg\" alt=\"\" src=\"" + u.getProfileimage() + "\">"
                + "        </div>"
                + "        <div class=\"useravatar\">"
                + "            <img alt=\"\" src=\"" + u.getProfileimage() + "\">"
                + "        </div>"
                + "        <div class=\"card-info\">"
                + "            <span class=\"card-title\">"+ u.getFname() + " " + u.getLname() +"</span>";

        if (controls) {
            out += "     <form method=\"post\" action=\"upload?belongsto=profile_img&type=img&refid=" + u.getUserid() + "\" enctype=\"multipart/form-data\">";
            if (returnAdmin) {
                out += "<input name=\"updatefrom\" type=\"hidden\" value=\"admin\" />";
            }
            out += "            <input name=\"file\" type=\"file\" />"
                    + "            <input class=\"btn btn-sm btn-primary\" value=\"Set Profile Picture\" type=\"submit\" />"
                    + "    </form>";
        }
        out += "        </div>";
        out += "    </div>";
        return out;
    }
}
