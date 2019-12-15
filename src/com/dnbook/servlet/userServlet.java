package com.dnbook.servlet;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.dnbook.dao.bookMapper;
import com.dnbook.dao.userMapper;
import com.dnbook.entity.book;
import com.dnbook.entity.user;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectOutput;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@WebServlet(
        urlPatterns={"/user"},
        initParams={
                @WebInitParam(name = "pagesize",value = "8")
        }
)
public class userServlet extends baseServlet {
    InputStream is = null;
    public String loading(HttpServletRequest req, HttpServletResponse resp){
        //登陆验证方法
        try {
            req.setCharacterEncoding("utf-8");
            resp.setCharacterEncoding("utf-8");
            String loading =  req.getParameter("loading");
            JSONObject object = JSONObject.parseObject(loading);
            String name = object.get("name").toString();
            String password = object.get("password").toString();
            is = Resources.getResourceAsStream("mybatis.xml");
            SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
            SqlSession session = factory.openSession();
            userMapper dao = session.getMapper(userMapper.class);
            List<user> list = new ArrayList<user>();
            list = dao.login(name);
            if(list.size()==1) {
                Iterator<user> it = list.iterator();
                while (it.hasNext()) {
                    user user_ = new user();
                    user_=it.next();
                    if (user_.getPassword().equals(password)) {
                        int lv = user_.getLv();
                        req.getSession().setAttribute("userkey",name);
                        req.getSession().setAttribute("userlv",lv);
                        resp.getWriter().print(user_.getLv());
                    } else {
                        resp.getWriter().print(2);
                    }
                }
            }else{
                resp.getWriter().print(2);
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "ajax";
    }

    public String pan(HttpServletRequest req, HttpServletResponse resp){
        try {
            req.setCharacterEncoding("utf-8");
            String name = req.getParameter("name");
            is = Resources.getResourceAsStream("mybatis.xml");
            SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
            SqlSession session = factory.openSession();
            userMapper dao = session.getMapper(userMapper.class);
            List<user> list = dao.login(name);
            if(list.size()==0){
                //名字可用
                resp.getWriter().print(0);
            }else{
                //找得到，名字不可用
                resp.getWriter().print(1);
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "ajax";
    }

    public String add(HttpServletRequest req, HttpServletResponse resp){
        try {
            req.setCharacterEncoding("utf-8");
            String sub = req.getParameter("massge");
            JSONObject object = JSONObject.parseObject(sub);
            String name = object.get("name").toString();
            String password = object.get("pass").toString();
            String email = object.get("email").toString();
            user us = new user();
            us.setUsername(name);
            us.setPassword(password);
            us.setEmail(email);
            is = Resources.getResourceAsStream("mybatis.xml");
            SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
            SqlSession session = factory.openSession(true);
            userMapper dao = session.getMapper(userMapper.class);
            int a = dao.insert(us);
            resp.getWriter().print(a);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "ajax";
    }

    public String delet(HttpServletRequest req, HttpServletResponse resp){
        try {
            String nid_ = req.getParameter("nid");
            int nid = 0;
            if(nid_!=null){
                nid = Integer.parseInt(nid_);
            }
            is = Resources.getResourceAsStream("mybatis.xml");
            SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
            SqlSession session = factory.openSession(true);
            userMapper dao = session.getMapper(userMapper.class);
            resp.getWriter().print(dao.delet(nid));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "ajax";
    }

    public String paing(HttpServletRequest req, HttpServletResponse resp){
        int pagesize = 7;
        String pagesize_ = getInitParameter("pagesize");
        if(pagesize_!=null){
            pagesize=Integer.parseInt(pagesize_);
        }
        try {
            is = Resources.getResourceAsStream("mybatis.xml");
            SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
            SqlSession session = factory.openSession();
            userMapper dao = session.getMapper(userMapper.class);
            double total = dao.total();
            int pages = (int)Math.ceil(total/pagesize);
            int pageno = 1;
            String pageno_ = req.getParameter("pageno");
            if(pageno_!=null){
                pageno=Integer.parseInt(pageno_);
                if(pageno<1){
                    pageno=1;
                }else if(pageno>pages){
                    pageno=pages;
                }
            }
            List<user> list = dao.getpaing((pagesize*pageno)-pagesize,pagesize);
            req.setAttribute("list",list);
            req.setAttribute("pageno",pageno);
            req.setAttribute("pages",pagesize);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "home0.jsp";
    }

    public String getbyid(HttpServletRequest req, HttpServletResponse resp){
        List<user> list = new ArrayList<user>();
        try {
            is = Resources.getResourceAsStream("mybatis.xml");
            SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
            SqlSession session = factory.openSession(true);
            userMapper dao = session.getMapper(userMapper.class);
            int id =Integer.parseInt(req.getParameter("uuid"));
            System.out.println("我被执行到了"+id);
            list = dao.getbyid(id);
            req.setAttribute("mlist",list);
            //resp.getWriter().print(1);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "modify.jsp";
    }
}

