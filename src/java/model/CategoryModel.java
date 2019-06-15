/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import database.Database;
import entity.Category;
import entity.Course;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

/**
 *
 * @author Mohsin Ali
 */
public class CategoryModel extends Database {

    public boolean deleteCategory(String catId) {
        String query = "DELETE FROM categories WHERE categoryid = '" + catId + "'";
        boolean flag = false;
        try {
            flag = (updateSQL(query) > 0);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());

        }
        return flag;
    }

    public boolean updateCategory(Category cat) {
        String query = "UPDATE categories SET  name = '" + cat.getName() + "', " + " icon = '" + cat.getIcon() + "' WHERE categoryid = '" + cat.getCategoryid() + "'";
        boolean flag = false;
        try {
            flag = (updateSQL(query) > 0);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());

        }
        return flag;
    }

    public int getLastCategoryId() {
        int id = -1;
        String query = "SELECT categoryid from categories ORDER BY categoryid DESC LIMIT 1";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                id = rs.getInt("categoryid");
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return id;
    }

    public int addCategory(Category cat) {
        int id = -1;
        String query = "INSERT INTO categories (name, icon) VALUES ('" + cat.getName() + "', '" + cat.getIcon() + "')";
        try {
            if (updateSQL(query) > 0) {
                id = getLastCategoryId();
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return id;
    }

    public Category getCategoryById(String categoryId) {
        Category result = null;
        String query = "SELECT * FROM categories WHERE categoryid = '" + categoryId + "' LIMIT 1";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                result = new Category(
                        rs.getInt("categoryid"),
                        rs.getString("name"),
                        rs.getString("icon")
                );
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return result;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> categories = new ArrayList<>();
        String query = "SELECT * FROM categories ORDER BY name ASC";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                categories = new ArrayList<>();
                do {
                    Category c = new Category(
                            rs.getInt("categoryid"),
                            rs.getString("name"),
                            rs.getString("icon")
                    );
                    categories.add(c);
                } while (rs.next());
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return categories;
    }
}
