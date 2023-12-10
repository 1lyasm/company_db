package company_db;

import java.io.IOException;
import java.sql.*;

public class Q4 {
	public static void main(String[] args) throws SQLException, IOException {
		String username = "postgres", password = "postgres";
		Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/company",
				username, password);
		String query = """
				select
					count(*) as n_emp,
					avg(e.salary) as avg_salary
				from
					works_on as w,
					project as p,
					employee as e
				where
					e.ssn = w.essn and
					w.pno = p.pnumber and
					p.pname = 'ProductX'
				""";
		Statement statement = connection.createStatement();
		ResultSet results = statement.executeQuery(query);
		while (results.next()) {
			String n_emp = results.getString(1);
			String avg_salary = results.getString(2);
			System.out.println(n_emp + " " + avg_salary);
		}
		statement.close();
		connection.close();
	}
}
