package com.ds.snowstore.exception;

import java.io.PrintWriter;
import java.io.StringWriter;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobalDefaultExceptionHandler {
	
	@ExceptionHandler(NoHandlerFoundException.class)
	public String handlerNoHandlerFoundException(Model model) {
		
		model.addAttribute("errorTitle", "The page is not constructed!");
		
		model.addAttribute("errorDescription", "The page you are looking for is not available now!");
		
		model.addAttribute("title", "404 Error Page");
		
		return "error";
	}
	
	@ExceptionHandler(ProductNotFoundException.class)
	public String handlerProductNotFoundException(Model model) {
		
		model.addAttribute("errorTitle", "Product not available!");
		
		model.addAttribute("errorDescription", "The product you are looking for is not available right now!");
		
		model.addAttribute("title", "Product Unavailable");
		
		return "error";
	}
	
	@ExceptionHandler(Exception.class)
	public String handlerException(Model model, Exception ex) {
		
		model.addAttribute("errorTitle", "Contact Your Administrator!");
		
		// Only for debugging the application, not meant for production, only for dev level
		
/*		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw);
		
		ex.printStackTrace(pw);
		
		model.addAttribute("errorDescription", sw.toString());*/
		
		model.addAttribute("errorDescription", ex.toString());
		
		model.addAttribute("title", "Error");
		
		return "error";
	}

}
