package kr.or.ddit.vo;

import org.json.JSONObject;

import lombok.Data;

@Data
public class SearchItemVO {
	private String title;
    private String link;
    private String image;
    private String productId;
    private int lprice;
    private String category1;
    private String category2;
    private String category3;
    private String category4;

    public SearchItemVO(JSONObject itemJson) {
        this.title = itemJson.getString("title");
        this.link = itemJson.getString("link");
        this.image = itemJson.getString("image");
        this.productId = itemJson.getString("productId");
        this.lprice = itemJson.getInt("lprice");
        this.category1 = itemJson.getString("category1");
        this.category2 = itemJson.getString("category2");
        this.category3 = itemJson.getString("category3");
        this.category4 = itemJson.getString("category4");
    }
    
}
