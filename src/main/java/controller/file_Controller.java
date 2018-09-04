package controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
public class file_Controller {
	@RequestMapping("upload")
    public @ResponseBody String  fileUpload2(@RequestParam CommonsMultipartFile file,HttpServletRequest req) throws IOException {
         long  startTime=System.currentTimeMillis();
         String filepath = req.getServletContext().getRealPath("/");
 	   	File ww = new File(new File(filepath).getParent()+"/uploadFile");
 		if (!ww.exists()) {
 			ww.mkdirs();
 		}
 		
 		String filename = file.getOriginalFilename();
		int pos = filename.lastIndexOf(".");
		String ff;
		if (pos > 0) {
			 ff = startTime + filename.substring(pos);
		}else {
			ff = startTime+"";
		}
		filename = ww.toString() + '/' + ff;
        file.transferTo(new File(filename));
        String p =  "/uploadFile/" + ff;
		String json="{\"status\":1,\"url\":\""+p+"\"}";
        return json; 
    }
}
