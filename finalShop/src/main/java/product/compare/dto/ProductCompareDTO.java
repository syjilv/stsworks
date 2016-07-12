package product.compare.dto;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="danawa")

public class ProductCompareDTO {
	public String shop;
	public String price;
	
	public ProductCompareDTO(){}

	public ProductCompareDTO(String shop, String price) {
		super();
		this.shop = shop;
		this.price = price;
	}

	public String getShop() {
		return shop;
	}

	public void setShop(String shop) {
		this.shop = shop;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "ProductCompareDTO [shop=" + shop + ", price=" + price + "]";
	}
	
	
	
}