package com.dnbook.servlet;

import com.dnbook.dao.bookMapper;
import com.dnbook.entity.book;
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
import java.util.List;

@WebServlet(
        urlPatterns={"/book"},
        initParams={
                @WebInitParam(name = "pagesize",value = "4")
        }
)
public class BookServlet extends baseServlet {
    InputStream is = null;
    public String paing(HttpServletRequest req, HttpServletResponse resp){
        int pagesize = 3;
        String pagesize_ = getInitParameter("pagesize");
        if(pagesize_!=null){
            pagesize=Integer.parseInt(pagesize_);
        }
        try {
            is = Resources.getResourceAsStream("mybatis.xml");
            SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
            SqlSession session = factory.openSession();
            bookMapper dao = session.getMapper(bookMapper.class);
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
            List<book> list = dao.getpaing((pagesize*pageno)-pagesize,pagesize);
            req.setAttribute("list",list);
            req.setAttribute("pageno",pageno);
            req.setAttribute("pages",pagesize);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "goods.jsp";
    }
}
