/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.object;

/**
 *
 * @author ADMIN
 */
public class Order {
    String orderID;
    String orderDate;
    String userID;
    String phone;
    String address;
    int total;

    public Order() {
    }

    public Order(String orderID, String orderDate, String userID, String phone, String address, int total) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.userID = userID;
        this.phone = phone;
        this.address = address;
        this.total = total;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
    
}
