/* To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctl.dao;
import com.ctl.entities.Category;
import com.ctl.entities.Post;
import com.ctl.entities.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;


/**
 *
 * @author HP
 */
public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
     Post p=new Post();
        
      
    public ArrayList<Category> getAllCategories(){
        
        ArrayList<Category> list=new ArrayList<>();
        try {
            
            String query="select * from categories";
            Statement st=con.createStatement();
            ResultSet set=st.executeQuery(query);
            while(set.next()){
                int cid=set.getInt("cid");
                String  name=set.getString("name");
                String  description=set.getString("description");
                
                Category c=new Category(cid, name,description);
                list.add(c);
                       
                       
                
            }
            
        } catch (Exception e) {
            
            e.printStackTrace();
        }
        
        return list;
    }
    
    public boolean savePost(Post p){
        boolean f=false;
        
        try {
            
            String query="insert into posts(pTitle,pContent,pCode,pPic,catId,userId)values(?,?,?,?,?,?)";
            PreparedStatement  p1= con.prepareStatement(query);
            p1.setString(1, p.getpTitle());
            p1.setString(2, p.getpContent());
            p1.setString(3, p.getpCode());
            p1.setString(4, p.getpPic());
            p1.setInt(5, p.getCatId());
            p1.setInt(6, p.getUserId());
            
            p1.executeUpdate();
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
        
    }
    
    public List<Post> getAllPost(){
        List<Post> list11=new ArrayList<>();
       
          try {
            
            String query="select * from posts order by pid desc";
            PreparedStatement st=con.prepareStatement(query);
            ResultSet set=st.executeQuery();
            while(set.next()){
                int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String  pContent=set.getString("pContent");
                String  pCode=set.getString("pCode");
                String  pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
                int catId=set.getInt("catId");
                int userId=set.getInt("userId");
                
                Post c=new Post(pid, pTitle, pContent, pCode, pPic,date, catId, userId);
                list11.add(c);
                       
                       
                
            }
            
        } catch (Exception e) {
            
            e.printStackTrace();
        }
        
        return list11;
    }
    
    
    public List<Post> getPostByCatId(int catId){
        List<Post> list11=new ArrayList<>();
         
          try {
            
            String query="select * from posts where catId = ?";
            PreparedStatement st=con.prepareStatement(query);
            st.setInt(1, catId);
            ResultSet set=st.executeQuery();
            while(set.next()){
                int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String  pContent=set.getString("pContent");
                String  pCode=set.getString("pCode");
                String  pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
                
                int userId=set.getInt("userId");
                
                Post c=new Post(pid, pTitle, pContent, pCode, pPic,date,catId,userId);
                list11.add(c);
                       
                       
                
            }
            
        } catch (Exception e) {
            
            e.printStackTrace();
        }
        
        
        return list11;
    }
    
    
    public List<Post> getPostByPostId(int postId) {
         List<Post> list11=new ArrayList<>();
        String query="select * from posts where pid=?";
        try {
            PreparedStatement p=con.prepareStatement(query);
            p.setInt(1, postId);
            
            ResultSet set=p.executeQuery();
            
            while(set.next()){
                
                
                 int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String  pContent=set.getString("pContent");
                String  pCode=set.getString("pCode");
                String  pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
                int catId=set.getInt("catId");
                int userId=set.getInt("userId");
                
              Post  post=new Post(pid, pTitle, pContent, pCode, pPic,date,catId,userId);
               list11.add(post);
               
            }
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list11;
        
    }
    
    
    
    
    
}
