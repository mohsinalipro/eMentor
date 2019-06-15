/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Mohsin Ali
 */
public abstract class Models {
    public static UserModel userModel = new UserModel();
    public static CourseModel courseModel = new CourseModel();
    public static CategoryModel categoryModel = new CategoryModel();
    public static LectureModel lectureModel = new LectureModel();
    public static ReviewModel reviewModel = new ReviewModel();
    public static TransactionModel transactionModel = new TransactionModel();
}
