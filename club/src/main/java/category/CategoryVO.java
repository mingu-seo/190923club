package category;

public class CategoryVO {

	private int category_id;
	private int category_id1;
	private int category_id2;
	private int category_id3;
	private String name;
	private int board_id;
	private int spot_num;
	private String empty_name;
	
	
	public String getEmpty_name() {
		return empty_name;  
	}
	public void setEmpty_name(String empty_name) {
		this.empty_name = empty_name;
	}
	public int getCategory_id1() {
		return category_id1;
	}
	public void setCategory_id1(int category_id1) {
		this.category_id1 = category_id1;
	}
	public int getCategory_id2() {
		return category_id2;
	}
	public void setCategory_id2(int category_id2) {
		this.category_id2 = category_id2;
	}
	public int getCategory_id3() {
		return category_id3;
	}
	public void setCategory_id3(int category_id3) {
		this.category_id3 = category_id3;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getSpot_num() {
		return spot_num;
	}
	public void setSpot_num(int spot_num) {
		this.spot_num = spot_num;
	}
}
