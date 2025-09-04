package com.example.webbshopbackend;

import com.example.webbshopbackend.model.CategoryInfo;
import com.example.webbshopbackend.model.PurchaseInfo;
import com.example.webbshopbackend.model.SalesInfo;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class Repository {
    private Connection con;
    private Properties p = new Properties();

    public Repository() {
//        try{InputStream in = getClass().getResourceAsStream("Settings.properties");
//            p.load(in);
//            System.out.println(in);
//        }
//        catch(Exception e){
//            e.printStackTrace();
//        }
    }

    public List<PurchaseInfo> getWhoBoughtWhat(String itemName, String itemSize, String itemColor, String brandName) throws SQLException {
        List<PurchaseInfo> results = new ArrayList<>();
                String sql = "select \n" +
                        "    c.name as firstName,\n" +
                        "    c.lastname as lastName,\n" +
                        "    i.name as itemName,\n" +
                        "    i.size as itemSize,\n" +
                        "    i.color as itemColor,\n" +
                        "    b.name as brand,\n" +
                        "    oi.count as quantity\n" +
                        "from customer c\n" +
                        "join orders o on c.id = o.customerId\n" +
                        "join orderItems oi on o.id = oi.orderId\n" +
                        "join item i on oi.itemId = i.id\n" +
                        "join brand b on i.brand = b.id\n" +
                        "where b.name = ?" +
                        "  and i.color = ?" +
                        "  and i.name like ?" +
                        "  and i.size = ?" +
                        "order by quantity desc;";


        // Jag vet att detta ser hemskt ut men det fungerade verkligen inte med Settings.properties varesig den var i
        // samma filepath some Repository eller om den var i resources foldern.
        // Provade att ange path som du gjort i dina exempel repositories och har också provat den lösning som finns längre upp
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webbshop?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true",
                                                        "root",
                                                    "secret")){
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, brandName);
            stmt.setString(2, itemColor);
            stmt.setString(3, "%" + itemName + "%");
            stmt.setString(4, itemSize);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                results.add(new PurchaseInfo(
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("itemName"),
                        rs.getString("itemSize"),
                        rs.getString("itemColor"),
                        rs.getString("brand"),
                        rs.getInt("quantity")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return results;
    }

    public List<CategoryInfo> getHowManyCategory(String categoryName, int quantity){
        List<CategoryInfo> list = new ArrayList<>();
        return  null;
    }

    public List<SalesInfo> getHowManySales(String date, int sumSales){
        List<SalesInfo> list = new ArrayList<>();
        return  null;
    }


}
