package company_db;

import java.io.IOException;
import java.sql.*;

public class Q2 {
	public static void main(String[] args) throws SQLException, IOException {
		String username = "postgres", password = "postgres";
		Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/company",
				username, password);
		String query = """
				select
					e.fname,
					e.lname,
					e.salary
				from
					employee as e,
					dept_locations as dl
				where
					e.dno = dl.dnumber and
					dl.dlocation = 'Chicago'
				""";
		Statement statement = connection.createStatement();
		ResultSet results = statement.executeQuery(query);
		while (results.next()) {
			String fname = results.getString(1);
			String lname = results.getString(2);
			double salary = results.getDouble(3);
			System.out.println(fname + " " + lname + " " + salary);
		}
		statement.close();
		connection.close();
	}
}
