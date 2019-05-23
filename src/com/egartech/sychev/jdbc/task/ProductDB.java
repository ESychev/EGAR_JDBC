/**
 * 
 */
package com.egartech.sychev.jdbc.task;

import java.lang.reflect.InvocationTargetException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;

/**
 * @author Lenovo
 *
 */
public class ProductDB {
	public static void getStat() throws InstantiationException, IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException, ClassNotFoundException, SQLException {
		ArrayList<Product> products = new ArrayList<>();

		String url = "jdbc:mysql://localhost:3306/myshop?serverTimezone=Europe/Moscow&useSSL=false";
		String userName = "root";
		String pass = "root";

		ResultSet resultSet = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
			try (Connection сonn = DriverManager.getConnection(url, userName, pass)) {

				Statement stat = сonn.createStatement();
				resultSet = stat.executeQuery("SELECT * FROM product where p_product_id = 1  ");
				System.out.println("Таблица продуктов выводим запись где id=1");

				while (resultSet.next()) {
					int p_product_id = resultSet.getInt(1);
					String p_product_name = resultSet.getString(2);
					int p_price_product = resultSet.getInt(3);
					System.out.println(" id " + p_product_id + " name " + p_product_name + " price " + p_price_product);
				}

			}

		} catch (SQLException ex) {
			System.err.println("SQLException message: " + ex.getMessage());
			System.err.println("SQLException SQL state: " + ex.getSQLState());
			System.err.println("SQLException SQL error code: " + ex.getErrorCode());

		} finally {
			if (resultSet != null) {
				resultSet.close();
			} else {
				System.err.println("Ошибка чтения с БД”");
			}
		}

	}

	public static void getUpdate() throws InstantiationException, IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException, ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://localhost:3306/myshop?serverTimezone=Europe/Moscow&useSSL=false";
		String userName = "root";
		String pass = "root";
		Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();

		try (Connection conn = DriverManager.getConnection(url, userName, pass)) {
			PreparedStatement preparedStat = null;
			String sql = "UPDATE product SET p_product_name = ?, p_price_product = ? WHERE p_product_id = ?";
			System.out.println("Изменяем первую запись");
			try {
				preparedStat = conn.prepareStatement(sql);

				preparedStat.setString(1, "телефон");
				preparedStat.setInt(2, 1);
				preparedStat.setInt(3, 1);
				preparedStat.execute();

				ResultSet rs = null;
				try {
					rs = preparedStat.executeQuery("SELECT * FROM product");
					System.out.println("Таблица продуктов");
					while (rs.next()) {
						int p_product_id = rs.getInt(1);
						String p_product_name = rs.getString(2);
						int p_price_product = rs.getInt(3);
						System.out.println(
								" id " + p_product_id + " name " + p_product_name + " price " + p_price_product);
					}

				} catch (SQLException ex) {
					System.err.println("SQLException message: " + ex.getMessage());
					System.err.println("SQLException SQL state: " + ex.getSQLState());
					System.err.println("SQLException SQL error code: " + ex.getErrorCode());

				} finally {
					if (rs != null) {
						rs.close();
					} else {
						System.err.println("Ошибка чтения с БД”");
					}

				}
			} catch (SQLException ex) {
				ex.printStackTrace();
			} finally {
				preparedStat.close();
			}
		}
	}

	public static void getInsert() throws InstantiationException, IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException, ClassNotFoundException, SQLException {
		ArrayList<Product> products = new ArrayList<>();

		String url = "jdbc:mysql://localhost:3306/myshop?serverTimezone=Europe/Moscow&useSSL=false";
		String userName = "root";
		String pass = "root";
		Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();

		try (Connection conn = DriverManager.getConnection(url, userName, pass)) {
			PreparedStatement preparedStat = null;

			try {
				preparedStat = conn
						.prepareStatement("INSERT INTO product( p_product_name, p_price_product) VALUES(?,?)");

				preparedStat.setString(1, "Плита");
				preparedStat.setInt(2, 1);
				preparedStat.execute();

				ResultSet rs = null;
				try {
					rs = preparedStat.executeQuery("SELECT * FROM product");
					System.out.println("Сработала команда INSER вставили новую позициюT");
					while (rs.next()) {
						int p_product_id = rs.getInt(1);
						String p_product_name = rs.getString(2);
						int p_price_product = rs.getInt(3);

						System.out.println(
								" id " + p_product_id + " name " + p_product_name + " price " + p_price_product);
					}

				} catch (SQLException exc) {
					System.err.println("SQLException message: " + exc.getMessage());
					System.err.println("SQLException SQL state: " + exc.getSQLState());
					System.err.println("SQLException SQL error code: " + exc.getErrorCode());

				} finally {
					if (rs != null) {
						rs.close();
					} else {
						System.err.println("Ошибка чтения с БД”");
					}

				}
			} catch (SQLException ex) {
				ex.printStackTrace();
			} finally {
				preparedStat.close();
			}
			CallableStatement callStat = null;
			try {
				callStat = conn.prepareCall("{CALL count_procedure(?)}");
				callStat.registerOutParameter(1, Types.INTEGER);
				callStat.execute();
				System.out.println(" Сработала процедура количество запиесй в таблице " + callStat.getInt(1));
			} catch (SQLException exc) {
				System.err.println("SQLException message: " + exc.getMessage());
				System.err.println("SQLException SQL state: " + exc.getSQLState());
				System.err.println("SQLException SQL error code: " + exc.getErrorCode());

			} finally {
				callStat.close();
			}
		}

	}
}
