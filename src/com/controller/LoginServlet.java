package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.RecorModel;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Fuser = request.getParameter("user");
		String Fpass = request.getParameter("pass");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		@SuppressWarnings("unused")
		RecorModel record = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaku?useSSL=false", "root", "root");
			PreparedStatement statement = connection.prepareStatement("select * from empl where username = ? and password = ?");
			statement.setString(1, Fuser);
			statement.setString(2, Fpass);
			
			ResultSet rs = statement.executeQuery();
			if (rs.next()) {
				
				session.setAttribute("id", rs.getInt("id"));
				session.setAttribute("user", rs.getString("username"));
				session.setAttribute("Admin", rs.getString("admin"));
				dispatcher = request.getRequestDispatcher("list");
			}else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("login.jsp");
			}
			dispatcher.forward(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}