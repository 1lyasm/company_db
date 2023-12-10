package company_db;

import java.io.IOException;
import java.sql.*;

public class Q1 {
	public static void main(String[] args) throws SQLException, IOException {
		String username = "postgres", password = "postgres";
		Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/company",
				username, password);
		String query = "select fname as fName, lname, salary from employee as e, works_on as w, project as p"
				+ " where w.essn = e.ssn and w.pno = p.pnumber and e.sex = 'F' and pname = 'DatabaseSystems'";
		Statement statement = connection.createStatement();
		ResultSet results = statement.executeQuery(query);
		ResultSetMetaData metaData = results.getMetaData();
		System.out.println("Column count: " + metaData.getColumnCount());
		System.out.println("Type of column 3: " + metaData.getColumnTypeName(3));
		while (results.next()) {
			String fname = results.getString("fName");
			String lname = results.getString(2);
			double salary = results.getDouble(3);
			System.out.println(fname + " " + lname + " " + salary);
		}
		statement.close();
		connection.close();
	}
}
