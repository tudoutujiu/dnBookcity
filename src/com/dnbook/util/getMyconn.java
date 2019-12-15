package com.dnbook.util;

import java.sql.*;

public class getMyconn {
	private static Connection conn =null;
	
	public getMyconn() {}
	
	public Connection getOracleconn() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(conn==null) {
			try {
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/MYSCHOOL","SYSTEM","1822");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return conn;
	}

    public Connection getMysqlconn() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        if(conn==null) {
            try {
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dnbookcity","root","1215");
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        return conn;
    }


	public void closeAll(ResultSet rs, PreparedStatement ps,Connection conn){
        if(rs!=null){
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if(ps!=null){
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if(conn!=null){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
