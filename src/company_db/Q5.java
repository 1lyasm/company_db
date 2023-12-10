package company_db;

import java.io.IOException;
import java.sql.*;
import java.util.Scanner;

public class Q5 {
	public static void main(String[] args) throws SQLException, IOException {
		String username = "postgres", password = "postgres";
		Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/company", username, password);
		String query = """
				select
					lname,
					salary
				from
					employee
				where
					ssn = ?
				""";
		PreparedStatement statement = connection.prepareStatement(query);
		Scanner input = new Scanner(System.in);
		System.out.print("SSN no: ");
		String ssn = input.nextLine();
		input.close();
		statement.clearParameters();
		statement.setString(1, ssn);
		ResultSet results = statement.executeQuery();
		while (results.next()) {
			String lname = results.getString(1);
			String salary = results.getString(2);
			System.out.println(lname + " " + salary);
		}
		statement.close();
		connection.close();
	}
}
