package com.dnbook.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class baseServlet extends HttpServlet {
    public static String REDIRECTPATH = "redirect:";
    public void service(HttpServletRequest req, HttpServletResponse resp){
        try {
            //统一请求和响应的编码方式
            req.setCharacterEncoding("utf-8");
            resp.setCharacterEncoding("utf-8");
            //获取请求的方法
            String method = req.getParameter("method");
            //创建method的映射实例
            Method m = this.getClass().getMethod(method,HttpServletRequest.class,HttpServletResponse.class);
            //得到实例，开始执行方法
            String returnVal = (String)m.invoke(this,req,resp);
            if(returnVal.equals("ajax")){
                //不做任何跳转操作
            }else{
                if(returnVal.startsWith(REDIRECTPATH)){
                    //做重定向
                    resp.sendRedirect(returnVal.substring(REDIRECTPATH.length()));
                }else{
                    req.getRequestDispatcher(returnVal).forward(req,resp);
                }
            }
        } catch (UnsupportedEncodingException | NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }
}
