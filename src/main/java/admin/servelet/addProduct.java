package admin.servelet;

import java.io.File;
import java.io.FileInputStream;
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

import controller.admin.allProduct;
import controller.base.common;

/**
 * Servlet implementation class addProduct
 */
@WebServlet("/admin/products")
@MultipartConfig
public class addProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatch = request.getRequestDispatcher("products.jsp");
		dispatch.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String seller = request.getParameter("seller");
		String brand = request.getParameter("brand");
		Float price = Float.parseFloat(request.getParameter("price"));
		Float sell = Float.parseFloat(request.getParameter("sell"));
		
		
		Part part = request.getPart("image");
		String filename = part.getSubmittedFileName();
		filename = getFilename(filename);
		String path = request.getRealPath("images"+File.separator+"products"+File.separator+filename);
		
		FileOutputStream fos = new FileOutputStream(path);
		InputStream is = part.getInputStream();		
	
		if(uploadFile(is,path,part,fos)){
	    	allProduct product = new allProduct();
	    	if(product.setProduct(name, filename, seller, brand, price, sell)){
	    		doGet(request,response);
	    	}
			
		}
		
		
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
