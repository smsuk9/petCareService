package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductVO {
	
	private int p_idx;
	private String p_name;
	private String p_info;
	private int p_price;
	private MultipartFile photo;
	private String p_photo;

}
