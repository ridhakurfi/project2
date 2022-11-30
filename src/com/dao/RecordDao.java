package com.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.RecorModel;
  
public class RecordDao {
	private String jdbcURL = "jdbc:mysql://localhost:3306/javaku?useSSL=false";
	private String jdbcUsername = "root";
	private String jdbcPassword = "root";
	
	
	private static final String SELECT_REGI_BY_ID = "select id, name, email, username from empl where id=?; ";
	private static final String DELETE_REGI_SQL = "delete from empl where id = ?;";
	private static final String UPDATE_FILE = "update empl set file =?, comment =? where id = ?;";
	private static final String UPDATE_ACC = "update empl set name =?, email =?, username =?, password =?, phone =?, photo =? where id = ?;";
	private static final String VIEW_DATA = "select id, name, email, username, password, phone, photo, file, comment from empl where id=?;";
	private static final String DATA_PEEK = "select id, username from empl where admin IS NULL;";
	public RecordDao() {
	}
	
	// connection
		protected Connection getConnection() {
			Connection connection = null;
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return connection;
		}
		
		// delete
		public boolean deleteRegi (int id) throws SQLException {
			boolean rowDeleted;
			try (Connection connection = getConnection();
					PreparedStatement statement = connection.prepareStatement(DELETE_REGI_SQL);) {
				statement.setInt(1, id);
				rowDeleted = statement.executeUpdate() > 0;
			}
			return rowDeleted;
		}
		
		//View record
		public List<RecorModel> PeekRecord() {
			List<RecorModel> record = new ArrayList<>();
			try (Connection connection = getConnection();
					PreparedStatement statement = connection.prepareStatement(DATA_PEEK);) {
				System.out.println(statement);
				ResultSet rs = statement.executeQuery();
				while (rs.next()) {
					int id = rs.getInt("id"); //id, name, date, city
					String username = rs.getString("username");
					record.add(new RecorModel(id, username));
				}
			}catch (SQLException e) {
				printSQLException(e);
			}
			return record;
		}
		
		public RecorModel viewRd (int id) {
		RecorModel record = null;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(SELECT_REGI_BY_ID);) {
			statement.setInt(1, id);
			System.out.println(statement);
			ResultSet rs = statement.executeQuery();//id, name, email, username, photo, file
			while (rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				String username = rs.getString("username");
				record = new RecorModel(id, name, email, username);
			}
			}catch (SQLException e) {
				printSQLException(e);
			}
			return record;
		}
		
		public boolean updatefile (RecorModel record) throws SQLException, FileNotFoundException {
			boolean rowUpdate;
			try (Connection connection = getConnection();
					PreparedStatement statement = connection.prepareStatement(UPDATE_FILE);){
				System.out.println("Update Record "+statement);
				String t = record.getFile();
				File f = new File (t);
				FileReader fr = new FileReader(f);
				statement.setCharacterStream(1, fr, (int)f.length()); 
				statement.setString(2, record.getComment());
				statement.setInt(3, record.getId());
				rowUpdate = statement.executeUpdate() > 0;
			}
			return rowUpdate;
		}
		
		public boolean updateacc (RecorModel record) throws SQLException, FileNotFoundException {
			boolean rowUpdate;
			try (Connection connection = getConnection();
					PreparedStatement statement = connection.prepareStatement(UPDATE_ACC);){
				System.out.println("Update Account "+statement); //name =?, email =?, username =?, password =?, phone =?, photo =?
				System.out.println(record.getId()+record.getName()+record.getEmail()+ record.getUsername()+record.getPhone()+record.getPhoto());
				statement.setString(1, record.getName()); 
				statement.setString(2, record.getEmail());
				statement.setString(3, record.getUsername());
				statement.setString(4, record.getPassword());
				statement.setString(5, record.getPhone());
				File file = new File (record.getPhoto());
				FileInputStream fis = new FileInputStream(file);
				statement.setBlob(6, fis);
				statement.setInt(7, record.getId());;				
				
				rowUpdate = statement.executeUpdate() > 0;
				
			}
			return rowUpdate;
		}
		public RecorModel viewall (int id) {
		RecorModel record = null;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(VIEW_DATA);) {
			statement.setInt(1, id);
			System.out.println(statement);
			ResultSet rs = statement.executeQuery();//id, name, email, username, photo, file
			while (rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String phone = rs.getString("phone");
				String photo = rs.getString("photo");
				String file = rs.getString("file");
				String comment = rs.getString("comment");
				record = new RecorModel(id, name, email, username, password, phone, photo, file, comment);
			}
			}catch (SQLException e) {
				printSQLException(e);
			}
			return record;
		
		
}
		

		private void printSQLException(SQLException ex) {
			for (Throwable e : ex) {
				if (e instanceof SQLException) {
					e.printStackTrace(System.err);
					System.err.println("SQLState: " + ((SQLException) e).getSQLState());
					System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
					System.err.println("Message: " + e.getMessage());
					Throwable t = ex.getCause();
					while (t != null) {
						System.out.println("Cause: " + t);
						t = t.getCause();
					}
				}
			}
		}
			
		
}