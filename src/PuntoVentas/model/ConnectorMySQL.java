package PuntoVentas.model;
import java.sql.DriverManager;
import java.sql.Connection;

public class ConnectorMySQL {
	public static Connection getConnection() {
		Connection conn;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/puntoventas?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
			return conn;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
