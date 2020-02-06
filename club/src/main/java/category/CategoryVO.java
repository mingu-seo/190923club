package category;

public class CategoryVO {

	private int category_id;
	private String name;
	private int board_id;
	private int spot_num;
	
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
