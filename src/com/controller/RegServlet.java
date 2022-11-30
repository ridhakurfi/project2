package com.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String username = request.getParameter("user");
		String password = request.getParameter("pass");
		String repass = request.getParameter("re_pass");
		String phone = request.getParameter("contact");
		String photo = request.getParameter("photo");
		
		RequestDispatcher dispatcher = null;
		Connection connection = null;
		if (password.equals(repass)) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaku?useSSL=false", "root", "root");
			PreparedStatement statement = connection.prepareStatement("insert into empl (name, email, username, password, phone, photo) values(?,?,?,?,?,?)");
			statement.setString(1, name);
			statement.setString(2, email);
			statement.setString(3, username);
			statement.setString(4, password);
			statement.setString(5, phone);
			File file = new File (photo);
			FileInputStream fis = new FileInputStream(file);
			statement.setBlob(6, fis);
			
			int rowCount = statement.executeUpdate();
			dispatcher = request.getRequestDispatcher("registration.jsp");
			
			if (rowCount > 0) {
				request.setAttribute("status", "success");
				
			}else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		}else {	
			dispatcher = request.getRequestDispatcher("registration.jsp");
			request.setAttribute("status", "notsame");
			dispatcher.forward(request, response);
		}
		
	}

}