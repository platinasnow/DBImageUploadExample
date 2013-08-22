import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class MainController {

	@RequestMapping("/index.do")
	public String Test(){
		
		return "/index.jsp";
	}
}
