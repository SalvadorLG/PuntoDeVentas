package PuntoVentas.model;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectorSQL {
	private static final String URL = "jdbc:sqlserver://localhost;databaseName=puntoventas;";
	private static final String USER = "salva";
	private static final String PASSWORD = "123";
	
	public static Connection getConection() {
		Connection con = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = (Connection) DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("No se pudo establecer la conexion "+e);
		}
		return con;
	}
}
