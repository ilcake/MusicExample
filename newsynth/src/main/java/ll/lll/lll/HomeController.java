package ll.lll.lll;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

		return "home";
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {

		return "index";
	}

	@RequestMapping(value = "/sample", method = RequestMethod.GET)
	public String sample() {

		return "sample";
	}

	@RequestMapping(value = "/sample2", method = RequestMethod.GET)
	public String sample2() {

		return "sample2";
	}

	@RequestMapping(value = "/sample3", method = RequestMethod.GET)
	public String sample3() {

		return "sample3";
	}

	@RequestMapping(value = "/sample4", method = RequestMethod.GET)
	public String sample4() {

		return "sample4";
	}

}
