package form_app;

import java.sql.*;

import javax.swing.JFrame;

public class DepInfo extends JFrame {
	public static void main(String[] args) throws SQLException, IOException {
		String url = "jdbc:postgresql://localhost:5432/company";
		String user = "postgres";
		String password = "postgres";
		Connection connection = DriverManager.getConnection(url, user, password);
		JFrame frame = new TDFrame(connection);
		frame.setVisible(true);
	}
}
