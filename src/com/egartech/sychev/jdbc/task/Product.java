/**
 * 
 */
package com.egartech.sychev.jdbc.task;

/**
 * @author Lenovo
 *
 */
public class Product {

	private int p_product_id;
	private String p_product_name;
	private int p_price_product;

	/**
	 * @param p_product_id
	 */
	public Product(int p_product_id) {
		super();
		this.p_product_id = p_product_id;
	}

	/**
	 * @param p_product_id
	 * @param p_product_name
	 */
	public Product(int p_product_id, String p_product_name) {
		super();
		this.p_product_id = p_product_id;
		this.p_product_name = p_product_name;
	}

	/**
	 * @param p_product_id
	 * @param p_product_name
	 * @param p_price_product
	 */
	public Product(int p_product_id, String p_product_name, int p_price_product) {
		super();
		this.p_product_id = p_product_id;
		this.p_product_name = p_product_name;
		this.p_price_product = p_price_product;
	}

	public int getP_product_id() {
		return p_product_id;
	}

	public void setP_product_id(int p_product_id) {
		this.p_product_id = p_product_id;
	}

	public String getP_product_name() {
		return p_product_name;
	}

	public void setP_product_name(String p_product_name) {
		this.p_product_name = p_product_name;
	}

	public int getP_price_product() {
		return p_price_product;
	}

	public void setP_price_product(int p_price_product) {
		this.p_price_product = p_price_product;
	}

	@Override
	public String toString() {
		return "Product [p_product_id=" + p_product_id + ", p_product_name=" + p_product_name + ", p_price_product="
				+ p_price_product + "]";
	}
}
