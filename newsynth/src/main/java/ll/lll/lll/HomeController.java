package ll.lll.lll;

import java.io.ByteArrayInputStream;
import java.nio.charset.StandardCharsets;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ll.lll.lll.javaCC.*;
import ll.lll.lll.jv.*;

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

	@RequestMapping(value = "/sample5", method = RequestMethod.GET)
	public String sample5() {

		return "sample5";
	}

	@RequestMapping(value = "/sample6", method = RequestMethod.GET)
	public String sample6() {

		return "sample6";
	}

	@RequestMapping(value = "/sample7", method = RequestMethod.GET)
	public String sample7() {

		return "sample7";
	}

	@RequestMapping(value = "/sample8", method = RequestMethod.GET)
	public String sample8() {

		return "sample8";
	}

	@ResponseBody
	@RequestMapping(value = "/compile", method = RequestMethod.GET)
	public String compile(String source) {
		System.out.println(source);

		return "sample8";
	}

}
