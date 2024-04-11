/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.object;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class DAO {

    private static final String LOGIN = "SELECT fullName, roleID FROM tbl_Users WHERE userID = ? AND password = ?";
    private static final String REGISTER = "INSERT INTO tbl_Users (userID, fullName, password, roleID) VALUES (?, ?, ?, ?)";
    private static final String CREATEUSER = "INSERT INTO tbl_Users (userID, fullName, password, roleID) VALUES (?, ?, ?, ?)";
    private static final String UPDATEUSER = "UPDATE tbl_Users SET fullName = ?, password = ?, roleID = ? WHERE userID = ?";
    private static final String DELETEUSER = "DELETE tbl_Users WHERE userID = ?";
    private static final String MANAGEUSER = "SELECT userID, fullName, password, roleID FROM tbl_Users WHERE userID LIKE ?";
    private static final String MANAGEORDER = "SELECT orderID, orderDate, userID, phone, address, total FROM tbl_Orders WHERE orderID LIKE ?";
    private static final String DELETEORDER = "DELETE tbl_Orders WHERE orderID = ?";
    private static final String SEARCHCLOTHES = "SELECT id,name ,description ,price, quantity ,status, image FROM tbl_Clothes WHERE name LIKE ?";
    private static final String SEARCHCLOTHESWITHOUTSEARCH = "SELECT id,name ,description ,price, quantity ,status, image FROM tbl_Clothes";
    private static final String CREATECLOTHES = "INSERT INTO tbl_Clothes (id, name, description, price, quantity, status, image) VALUES (?, ?, ?, ?, ?, ?, ?)";
    private static final String UPDATECLOTHES = "UPDATE tbl_Clothes SET name = ?, description = ?, price = ?, quantity = ?, status = ? WHERE id LIKE ?";
    private static final String UPDATECLOTHES2 = "UPDATE tbl_Clothes SET price = ?, quantity = ?, status = ? WHERE name LIKE ?";
    private static final String DELETECLOTHES = "DELETE tbl_Clothes WHERE id = ?";
    private static final String CHECKOUT = "INSERT INTO tbl_Orders (orderID, orderDate, userID, phone, address, total) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String CHECKOUTQUANTITY = "UPDATE tbl_Clothes SET quantity = ? WHERE name = ?";
    private static final String GETQUANTITY = "SELECT price, quantity FROM tbl_Clothes WHERE name LIKE ?";

    public User checkLogin(String userID, String password) throws SQLException {
        User user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, userID);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    user = new User(userID, fullName, "", roleID);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    public boolean checkRegister(User user) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(REGISTER);
                ptm.setString(1, user.getUserID());
                ptm.setString(2, user.getFullName());
                ptm.setString(3, user.getPassword());
                ptm.setString(4, user.getRoleID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean createUser(User user) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATEUSER);
                ptm.setString(1, user.getUserID());
                ptm.setString(2, user.getFullName());
                ptm.setString(3, user.getPassword());
                ptm.setString(4, user.getRoleID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean updateUser(User user) throws SQLException {
        boolean checkUpdate = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(UPDATEUSER);
                ps.setString(1, user.getFullName());
                ps.setString(2, user.getPassword());
                ps.setString(3, user.getRoleID());
                ps.setString(4, user.getUserID());
                checkUpdate = ps.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return checkUpdate;
    }

    public boolean deleteUser(String userID) throws SQLException {
        boolean checkDelete = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(DELETEUSER);
                ps.setString(1, userID);
                checkDelete = ps.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return checkDelete;
    }

    public boolean createClothes(Clothes clothes) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATECLOTHES);
                ptm.setString(1, clothes.getId());
                ptm.setString(2, clothes.getName());
                ptm.setString(3, clothes.getDescription());
                ptm.setInt(4, clothes.getPrice());
                ptm.setInt(5, clothes.getQuantity());
                ptm.setBoolean(6, clothes.isStatus());
                ptm.setString(7, clothes.getImage());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean updateClothes(Clothes clothes) throws SQLException {
        boolean checkUpdate = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(UPDATECLOTHES);
                ps.setString(1, clothes.getName());
                ps.setString(2, clothes.getDescription());
                ps.setInt(3, clothes.getPrice());
                ps.setInt(4, clothes.getQuantity());
                ps.setBoolean(5, clothes.isStatus());
                ps.setString(6, clothes.getId());
                checkUpdate = ps.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return checkUpdate;
    }
    
    public boolean updateClothes2(Clothes clothes) throws SQLException {
        boolean checkUpdate = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(UPDATECLOTHES2);
                ps.setInt(1, clothes.getPrice());
                ps.setInt(2, clothes.getQuantity());
                ps.setBoolean(3, clothes.isStatus());
                ps.setString(4, clothes.getName());
                checkUpdate = ps.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return checkUpdate;
    }

    public boolean deleteClothes(String id) throws SQLException {
        boolean checkDelete = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(DELETECLOTHES);
                ps.setString(1, id);
                checkDelete = ps.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return checkDelete;
    }

    public List<Clothes> getClothes(String search) throws SQLException, ClassNotFoundException {
        List<Clothes> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(SEARCHCLOTHES);
                ps.setString(1, '%' + search + '%');
                rs = ps.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("id");
                    String name = rs.getString("name");
                    String description = rs.getString("description");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    boolean status = rs.getBoolean("status");
                    String image = rs.getString("image");
                    list.add(new Clothes(id, name, description, price, quantity, status, image));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                rs.close();
            }
            if (con != null) {
                rs.close();
            }
        }
        return list;
    }

    public List<Clothes> getClothesWithoutSearch() throws SQLException, ClassNotFoundException {
        List<Clothes> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(SEARCHCLOTHESWITHOUTSEARCH);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("id");
                    String name = rs.getString("name");
                    String description = rs.getString("description");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    boolean status = rs.getBoolean("status");
                    String image = rs.getString("image");
                    list.add(new Clothes(id, name, description, price, quantity, status, image));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                rs.close();
            }
            if (con != null) {
                rs.close();
            }
        }
        return list;
    }

    public List<User> getUser(String search) throws SQLException, ClassNotFoundException {
        List<User> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(MANAGEUSER);
                ps.setString(1, '%' + search + '%');
                rs = ps.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String password = rs.getString("password");
                    String roleID = rs.getString("roleID");
                    list.add(new User(userID, fullName, password, roleID));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                rs.close();
            }
            if (con != null) {
                rs.close();
            }
        }
        return list;
    }

    public List<Order> getOrder(String search) throws SQLException, ClassNotFoundException {
        List<Order> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(MANAGEORDER);
                ps.setString(1, '%' + search + '%');
                rs = ps.executeQuery();
                while (rs.next()) {
                    String orderID = rs.getString("orderID");
                    String orderDate = rs.getString("orderDate");
                    String userID = rs.getString("userID");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    int total = rs.getInt("total");
                    list.add(new Order(orderID, orderDate, userID, phone, address, total));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                rs.close();
            }
            if (con != null) {
                rs.close();
            }
        }
        return list;
    }

    public boolean checkOut(Order order) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECKOUT);
                ptm.setString(1, order.getOrderID());
                ptm.setString(2, order.getOrderDate());
                ptm.setString(3, order.getUserID());
                ptm.setString(4, order.getPhone());
                ptm.setString(5, order.getAddress());
                ptm.setInt(6, order.getTotal());        
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean deleteOrder(String orderID) throws SQLException {
        boolean checkDelete = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(DELETEORDER);
                ps.setString(1, orderID);
                checkDelete = ps.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return checkDelete;
    }

    public boolean checkOutQuantity(Clothes clothes) throws SQLException {
        boolean checkUpdate = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(CHECKOUTQUANTITY);
                ps.setInt(1, clothes.getQuantity());
                ps.setString(2, clothes.getName());
                checkUpdate = ps.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return checkUpdate;
    }

    public Clothes getQuantity(String name) throws SQLException {
        Clothes clo = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETQUANTITY);
                ptm.setString(1, name);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int price = rs.getInt("price");
                    int newQuantity = rs.getInt("quantity");
                    clo = new Clothes("", name, "", price, newQuantity, true, "");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return clo;
    }
}
