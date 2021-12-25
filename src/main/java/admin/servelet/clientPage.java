package admin.servelet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.admin.allClient;
import controller.admin.allProduct;

/**
 * Servlet implementation class clientPage
 */
@MultipartConfig
@WebServlet("/admin/clients")
public class clientPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public clientPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatch = request.getRequestDispatcher("clients.jsp");
		dispatch.forward(request, response);
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String info = request.getParameter("info");
		
		Part part = request.getPart("image");
		String filename = part.getSubmittedFileName();
		filename = getFilename(filename);
		String path = request.getRealPath("images"+File.separator+"clients"+File.separator+filename);
		
		FileOutputStream fos = new FileOutputStream(path);
		InputStream is = part.getInputStream();		
	
		if(uploadFile(is,path,part,fos)){
	    	allClient client = new allClient();
	    	if(client.setClient(name, filename, info)) {
	    		doGet(request, response);
	    	}
			
		}
		
		
		
		doGet(request, response);
	}
	
	
	public String getFilename(String name) {
		int min = 100000000;  
		int max = 999999999;
		int random =  (int)(Math.random()*(max-min+1)+min);
		
		name = String.valueOf(random) + name;
		
		return name;
	}
	
	public boolean uploadFile(InputStream iss,String path,Part part,FileOutputStream fos ) {
		try {			
			byte []data = new byte[iss.available()];
			iss.read(data);
			fos.write(data);
			fos.close();
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return false;
	}

}
