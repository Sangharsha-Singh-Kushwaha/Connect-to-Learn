/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctl.dao;
import com.ctl.entities.User;
import java.sql.*;

public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    //method to insert user to data base
    
    public boolean saveUser(User user){
        boolean f=false;
        try {
            String query="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
            
            PreparedStatement pstmt=this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            
            pstmt.executeUpdate();
            f=true;
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    //get user by useremail and userpassword:
    public User getUserByEmailAndPassword(String email, String password){
        User user=null;
        
        try {
           
            String query="select * from user where email =? and password =?";
            
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
            ResultSet set=pstmt.executeQuery();
            
            if(set.next()){
                
                user=new User();
                //data featching from db
                String name=set.getString("name");
                //data setting in user object
                user.setName(name);
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
                
            }
            
            
        } catch (Exception e) {
            
            e.printStackTrace();
        }
       
        return  user;
 
    }
    
    //update user detail
    
    public boolean updateUser(User user){
        boolean f=false;
        try {
            
            String query="update user set name=?, email=?, password=?, gender=?, about=?, profile=? where id=?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            pstmt.setString(6, user.getProfile());
            pstmt.setInt(7, user.getId());
            
            pstmt.executeUpdate();
            f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public User getUserByUserId(int userId){
        User user=null;
        
        try {
            String query="select * from user where id=? ";
            PreparedStatement psmt=con.prepareStatement(query);
            psmt.setInt(1, userId);
            ResultSet set= psmt.executeQuery();
            if(set.next()){
                
                user=new User();
                //data featching from db
                String name=set.getString("name");
                //data setting in user object
                user.setName(name);
        }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return user;
    }
    
    
    public User getUserByPostId(int postId){
        User user=null;
        
        try {
            String query="select * from user where pid=? ";
            PreparedStatement psmt=con.prepareStatement(query);
            psmt.setInt(1, postId);
            ResultSet set= psmt.executeQuery();
            if(set.next()){
                
                user=new User();
                //data featching from db
                String name=set.getString("name");
                //data setting in user object
                user.setName(name);
        }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return user;
    }
}
