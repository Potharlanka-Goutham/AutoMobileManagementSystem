package com.klef.jfsd.springboot.controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired
;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.BookTechnician;
import com.klef.jfsd.springboot.model.Booking;
import com.klef.jfsd.springboot.model.BookingDetails;
import com.klef.jfsd.springboot.model.Customer;
import com.klef.jfsd.springboot.model.Product;
import com.klef.jfsd.springboot.model.ProductBooking;
import com.klef.jfsd.springboot.model.Technician;
import com.klef.jfsd.springboot.model.Vehicle;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.CustomerService;
import com.klef.jfsd.springboot.service.EmailService;
import com.klef.jfsd.springboot.service.ProductService;
import com.klef.jfsd.springboot.service.TechnicianService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ClientController 
{
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
    private HttpSession httpSession;
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private TechnicianService technicianService;
	
	
	
	@GetMapping("/")
	public String main() 
	{
		return "index";
	}
	
	@GetMapping("cards")
	public String cards() 
	{
		return "cardscheck";
	}
	
	@GetMapping("logininterface")
	public String logininterface() 
	{
		return "logininterface";
	}
    
	@GetMapping("userloginform")
	public String userloginform() 
	{
		return "userloginform";
	}
	
	@GetMapping("customerregistration")
	public String customerregistration() 
	{
		return "customerregistration";
	}
	
	@GetMapping("services")
	public String services() 
	{
		return "servicepage";
	}
	
	
	
	@PostMapping("insertcustomer")
	public ModelAndView insertaction(HttpServletRequest request,@RequestParam("profilepic") MultipartFile file) throws IOException, SerialException, SQLException
	{
		String msg = null;
		ModelAndView mv = new ModelAndView();
		
		try 
		{
			String fullname = request.getParameter("fullname");
			String username = request.getParameter("username");
		    String gender = request.getParameter("gender");
		    String email = request.getParameter("email");
		    String password = request.getParameter("password");
		    String phonenumber = request.getParameter("phonenumber");
		    
		      byte[] bytes = file.getBytes();
			  Blob profilepic = new javax.sql.rowset.serial.SerialBlob(bytes);
			
		    
		      Customer c = new Customer();
		      c.setFullname(fullname);
		      c.setUsername(username);
		      c.setGender(gender);
		      c.setEmail(email);
		      c.setPassword(password);
		      c.setPhonenumber(phonenumber);
		      c.setProfilepic(profilepic);
		      
		    
		      msg = customerService.addcustomer(c);
		      
		      String welcomeMessage = "Welcome, " + fullname + "!\n\n"
		              + "Thank you for registering with our service. Here are your registration details:\n"
		              + "Username: " + username + "\n"
		              + "Email: " + email + "\n"
		              + "Phone Number: " + phonenumber + "\n\n"
		              + "If you have any questions or need assistance, please feel free to reach out to us.";

		      emailService.sendEmail(c.getEmail(), "Welcome to Our Service", welcomeMessage);

		      
		      mv.setViewName("userloginform");
		      
		      mv.addObject("message", "Registration Successful!");

		        
		} 
		catch (Exception e) 
		{
			String errorMessage = e.getMessage();
		    msg = errorMessage.length() > 150 ? errorMessage.substring(0, 100) + "..." : errorMessage;
		    mv.setViewName("displaymsg");
		    mv.addObject("message", msg);
		    mv.addObject("goback", "customerregistration");
		}
	   
		return mv;
	    
	}
	
	
	@PostMapping("checkcustomerlogin")
	public ModelAndView checkemplogin(HttpServletRequest request) 
	{
		 ModelAndView mv = new ModelAndView();
	
		 String username = request.getParameter("username");
	     String password = request.getParameter("password");
	     
	    Customer c = customerService.checkcustomerlogin(username, password);
	    
	    if(c!=null)
	    {
	    	//session
	    	
	    	HttpSession session = request.getSession();
	    	
	    	session.setAttribute("cid", c.getId()); // eid is a session variable
	    	session.setAttribute("cname",c.getFullname()); // ename is a session variable
	    	
	    	//session
	    	
	    	mv.setViewName("customerhome");
	      
	    }
	    else
	    {
	      mv.setViewName("forbiddenpage");
	      mv.addObject("message","Login Failed");
	    }
		
	    return mv;
	}
	
	@GetMapping("viewprofile")
    public ModelAndView updateemp(HttpServletRequest request)
    {
		  ModelAndView mv = new ModelAndView();
	      
	      HttpSession session = request.getSession();
	      
	      mv.setViewName("customerprofile");
	      
	      mv.addObject("cid", session.getAttribute("cid"));
	      mv.addObject("cname", session.getAttribute("cname"));
	      
	      int id =  (int) session.getAttribute("cid");
	      
	      Customer c = customerService.viewprofile(id);
	      
	      mv.addObject("c", c);
	      
	      return mv;
    }
	
	@GetMapping("logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		//session.invalidate();
		session.removeAttribute("cid");
		return "redirect:/";
	} 
	
	
	@GetMapping("customerhome")
	public ModelAndView customerhome(HttpServletRequest request) 
	{
    	ModelAndView mv = new ModelAndView();
    	
    	mv.setViewName("customerhome");
    	
    	return mv ;
	}
	
	
	@GetMapping("updateprofile")
	public ModelAndView updateprofile(HttpServletRequest request) 
	{
		  ModelAndView mv = new ModelAndView();
	      
	      HttpSession session = request.getSession();
	      
	      mv.setViewName("updatecustomerprofile");
	      
	      
	      mv.addObject("cid", session.getAttribute("cid"));
	      mv.addObject("cname", session.getAttribute("cname"));
	      
	      int id = (int) session.getAttribute("cid");
	      
	      Customer c = customerService.findbyid(id);
	      
	      
	      mv.addObject("customer", c);
	      
	      
		
		return mv;
		
	}
	
	@PostMapping("updatecustomerdetails")
	public ModelAndView updatecustomerdetails(HttpServletRequest request,@RequestParam("profilepic") MultipartFile file) throws IOException, SerialException, SQLException 
	{
		  String msg = null;
	      
	      ModelAndView mv = new ModelAndView();
	      
	      HttpSession session = request.getSession();
	      mv.addObject("cid", session.getAttribute("cid"));
	      mv.addObject("cname", session.getAttribute("cname"));
	     
	      
	      int id = (int) session.getAttribute("cid");
	      
	      try 
	      {
	    	  String username = request.getParameter("username");
	    	  String email = request.getParameter("email");
	    	  String phonenumber = request.getParameter("phonenumber");
	    	  
	    	  byte[] bytes = file.getBytes();
			  Blob profilepic = new javax.sql.rowset.serial.SerialBlob(bytes);
	    	  
	    	  
	    	  Customer cus = new Customer();
	    	  cus.setId(id);
	    	  cus.setUsername(username);
	    	  cus.setEmail(email);
	    	  cus.setPhonenumber(phonenumber);
	    	  cus.setProfilepic(profilepic);
	    	  
	    	  
	    	  
	    	  msg = customerService.updateprofile(cus);
	    	  
	    	  mv.setViewName("customerprofile");
	    	 
		      
		     Customer c = customerService.viewprofile(id);
		      
		      mv.addObject("c", c);
		      
	    	  mv.addObject("message", msg);
			
		  } 
	      catch (Exception e) 
	      {
	    	  msg = e.getMessage();
	    	  
	    	  mv.setViewName("customerprofile");
	    	  mv.addObject("message", msg);
		 }
		
		
		return mv;
		
	}
	
	
	@GetMapping("displayprofilepic")
	public ResponseEntity<byte[]> displayprodimagedemo(@RequestParam("id") int id) throws IOException, SQLException
	{
	  Customer product =  customerService.viewbyid(id);
	  byte [] imageBytes = null;
	  imageBytes = product.getProfilepic().getBytes(1,(int) product.getProfilepic().length());

	  return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	}
	
	
	
	
	
	//--------------------------> Admin <----------------------------------------------//
	
	@GetMapping("adminhome")
	public String adminhome() 
	{
		return "adminhome";
	}
	
	@GetMapping("adminlogin")  // URI & METHOD NAMR CAN BE DIFFERENT 
	public ModelAndView adminlogin() 
	{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminlogin");
		
		return mv;
		
	}
	
	@PostMapping("checkadminlogin")
	public ModelAndView checkadminlogin(HttpServletRequest request) 
	{
		 ModelAndView mv = new ModelAndView();
	
		String auname = request.getParameter("auname");
	    String apwd = request.getParameter("apwd");
	     
	    Admin admin = adminService.checkadminlogin(auname, apwd);
	    
	    if(admin!=null)
	    {
	    	
	    	mv.setViewName("adminhome");
	      
	    }
	    else
	    {
	      mv.setViewName("adminlogin");
	      mv.addObject("message","Login Failed");
	    }
		
	    return mv;
	}
	
	
	   @GetMapping("adminviewallproducts")
	   public ModelAndView adminviewallproducts()
	   {
		   List<Product> productlist = productService.ViewAllProducts();
		   
		   ModelAndView mv = new ModelAndView("adminviewallproducts");
		   
		   mv.addObject("productlist", productlist);
		   
		   return mv;
	   }

	   @GetMapping("adminviewproduct")
		public String adminviewproduct() 
		{
			
			return "adminviewproduct";
		}
	   
	   
	   
	   
	      @GetMapping("adminviewproductbyid")
		  public ModelAndView adminviewproductbyid(@RequestParam("id") int id)
		  {
		    Product product = productService.ViewProductByID(id);
		    
		    List<Product> productlist = productService.ViewAllProducts();
		   
		    ModelAndView mv = new ModelAndView();
		    mv.setViewName("adminviewproduct");
		    mv.addObject("product", product);
		    mv.addObject("productlist", productlist);
		    return mv;
		  }
	
	      @GetMapping("adminviewcustomerorders")
	      public ModelAndView adminviewcustomerorders() 
	      {
			return null;
	    	  
	      }
	      
	      
	      @GetMapping("updateproduct")
			public ModelAndView updateproduct(@RequestParam("id") int id) 
			{
	    	  Product product = productService.ViewProductByID(id);
	    	  
	    	  ModelAndView mv = new ModelAndView("updateproduct");
	    	  mv.addObject("product", product);
	    	  
	    	  return mv;
				
				
			}
	      
	      
	      @PostMapping("updateproductaction")
	      public ModelAndView updateProductAction (HttpServletRequest request,@RequestParam("firstpic") MultipartFile file1,@RequestParam("secondpic") MultipartFile file2,@RequestParam("thirdpic") MultipartFile file3,@RequestParam("fourthpic") MultipartFile file4) throws IOException, SerialException, SQLException {
	          
	    	    int id = Integer.parseInt(request.getParameter("id"));
	    	    String category = request.getParameter("category");
				String name = request.getParameter("name");
			    String description = request.getParameter("description");
			    Double cost = Double.valueOf(request.getParameter("cost"));
			    Integer stock = Integer.valueOf(request.getParameter("stock"));
			    
			    
			      byte[] bytes1 = file1.getBytes();
				  Blob pic1 = new javax.sql.rowset.serial.SerialBlob(bytes1);
				  
				  byte[] bytes2 = file2.getBytes();
				  Blob pic2 = new javax.sql.rowset.serial.SerialBlob(bytes2);
				  
				  byte[] bytes3 = file3.getBytes();
				  Blob pic3 = new javax.sql.rowset.serial.SerialBlob(bytes3);
				  
				  byte[] bytes4 = file4.getBytes();
				  Blob pic4 = new javax.sql.rowset.serial.SerialBlob(bytes4);
	          
	          // Retrieve other product attributes as needed
	          
                  Product p  = new Product();
			      p.setId(id);
			      p.setCategory(category);
			      p.setCost(cost);
			      p.setDescription(description);
			      p.setName(name);
			      p.setStock(stock);
			      p.setProductimage1(pic1);
			      p.setProductimage2(pic2);
			      p.setProductimage3(pic3);
			      p.setProductimage4(pic4);
	          
	          // Update other product attributes as needed
	          
	          productService.updateProduct(p);
	          
	          ModelAndView mv = new ModelAndView();
	          mv.setViewName("redirect:/adminviewproductbyid?id=" + p.getId());
	          return mv;
	      }

	      
	      @GetMapping("deleteproduct/{id}")
		  public String deleteaproduct(@PathVariable("id") int pid)
		  {
		    adminService.deleteProduct(pid);
		    
		    return "redirect:/adminviewallproducts";
		  }
	
	
	
	//--------------------------> Admin operation on Employee <----------------------------------------------//
	
	
	@GetMapping("viewallcustomers")
	public ModelAndView viewemps()
	{
		List<Customer> customer = adminService.viewallemps();
		
		ModelAndView mv = new  ModelAndView("viewallcustomers");
		mv.addObject("cdata",customer);
		
		
		
		
		return mv;
		
	}
	
	@GetMapping("view")
	  public ModelAndView viewempdemo(@RequestParam("id") int eid)
	  {
	    Customer c = adminService.viewempbyid(eid);
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("viewcustomerbyid");
	    mv.addObject("customer", c);
	    return mv;
	  }
	
	//********************************---------************************************************///
	
	@GetMapping("booking")
	  public ModelAndView booking()
	  {
	  
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("booking");
	    
	    return mv;
	  }
	
	@PostMapping("bookService")
    public ModelAndView bookService(HttpServletRequest request) 
	{
        ModelAndView mv = new ModelAndView();
        
        
        String pickupLocation = request.getParameter("pickupLocation");
        String dropOffLocation = request.getParameter("dropOffLocation");
        String pickupdate = request.getParameter("pickupDate");
        String dropOffdate = request.getParameter("dropoffdate");
        
        Booking booking = new Booking();
        booking.setPickupLocation(pickupLocation);
        booking.setDropOffLocation(dropOffLocation);
        booking.setPickupDate(pickupdate);
        booking.setDropOffDate(dropOffdate);
        
        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
        booking.setTimestamp(currentTimestamp);
        
        String bookingResult = customerService.bookService(booking);
        
        if ("Booking Successful".equals(bookingResult)) {
            mv.setViewName("bookingConfirmation"); 
            mv.addObject("message", bookingResult);
        } else {
            mv.setViewName("bookingConfirmation"); 
            mv.addObject("message", bookingResult);
        }

        return mv;
    }

	
	@GetMapping("viewAllBookings")
	public ModelAndView viewAllBookings() {
	    ModelAndView mv = new ModelAndView("viewAllBookings"); 

	    List<BookingDetails> bookingDetailsList = adminService.viewAllBookingsWithCustomerDetails();
	    mv.addObject("bookingDetailsList", bookingDetailsList);

	    return mv;
	}

	@GetMapping("customerbookings")
    public ModelAndView getBookingsForLoggedInCustomer() {
        ModelAndView modelAndView = new ModelAndView("customerbookings");

        Integer customerId = (Integer) httpSession.getAttribute("cid");

        if (customerId != null) {
            List<Booking> bookings = customerService.getBookingsForCustomer(customerId);
            modelAndView.addObject("bookings", bookings);
        } else {
            
        }

        return modelAndView;
    }
	
	//-------------------------------Products----------------------------------------//
	
		@GetMapping("addproducts")
		public String addproducts() 
		{
			
			return "addproducts";
		}
		
		
		@PostMapping("insertproduct")
		public ModelAndView insertproduct(HttpServletRequest request,@RequestParam("firstpic") MultipartFile file1,@RequestParam("secondpic") MultipartFile file2,@RequestParam("thirdpic") MultipartFile file3,@RequestParam("fourthpic") MultipartFile file4) throws IOException, SerialException, SQLException
		{
			String msg = null;
			ModelAndView mv = new ModelAndView();
			
			try 
			{
				
				
				
				String category = request.getParameter("category");
				String name = request.getParameter("name");
			    String description = request.getParameter("description");
			    Double cost = Double.valueOf(request.getParameter("cost"));
			    Integer stock = Integer.valueOf(request.getParameter("stock"));
			    
			    
			      byte[] bytes1 = file1.getBytes();
				  Blob pic1 = new javax.sql.rowset.serial.SerialBlob(bytes1);
				  
				  byte[] bytes2 = file2.getBytes();
				  Blob pic2 = new javax.sql.rowset.serial.SerialBlob(bytes2);
				  
				  byte[] bytes3 = file3.getBytes();
				  Blob pic3 = new javax.sql.rowset.serial.SerialBlob(bytes3);
				  
				  byte[] bytes4 = file4.getBytes();
				  Blob pic4 = new javax.sql.rowset.serial.SerialBlob(bytes4);
				
			    
			      Product p  = new Product();
			      
			      p.setCategory(category);
			      p.setCost(cost);
			      p.setDescription(description);
			      p.setName(name);
			      p.setStock(stock);
			      p.setProductimage1(pic1);
			      p.setProductimage2(pic2);
			      p.setProductimage3(pic3);
			      p.setProductimage4(pic4);
			      
			      msg = productService.addproduct(p);
			      mv.setViewName("addproducts");
				  mv.addObject("message",msg);
			        
			} 
			catch (Exception e) 
			{
				msg = e.getMessage();
				mv.setViewName("index");
				mv.addObject("message",msg);
			}
		   
			return mv;
		    
		}
		
		
		
		@GetMapping("displayprdouctimage1")
		public ResponseEntity<byte[]> displayprodimage1(@RequestParam("id") int id) throws IOException, SQLException
		{
		  Product product =  productService.ViewProductByID(id);
		  byte [] imageBytes1 = null;
		  imageBytes1 = product.getProductimage1().getBytes(1,(int) product.getProductimage1().length());

		  return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes1);
		}
		
	
		@GetMapping("displayprdouctimage2")
		public ResponseEntity<byte[]> displayprodimage2(@RequestParam("id") int id) throws IOException, SQLException
		{
		  Product product =  productService.ViewProductByID(id);
		  byte [] imageBytes2 = null;
		  imageBytes2 = product.getProductimage2().getBytes(1,(int) product.getProductimage2().length());

		  return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes2);
		}
		
		
		@GetMapping("displayprdouctimage3")
		public ResponseEntity<byte[]> displayprodimage3(@RequestParam("id") int id) throws IOException, SQLException
		{
		  Product product =  productService.ViewProductByID(id);
		  byte [] imageBytes3 = null;
		  imageBytes3 = product.getProductimage3().getBytes(1,(int) product.getProductimage3().length());

		  return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes3);
		}

	
		@GetMapping("displayprdouctimage4")
		public ResponseEntity<byte[]> displayprodimage4(@RequestParam("id") int id) throws IOException, SQLException
		{
		  Product product =  productService.ViewProductByID(id);
		  byte [] imageBytes4 = null;
		  imageBytes4 = product.getProductimage4().getBytes(1,(int) product.getProductimage4().length());

		  return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes4);
		}
		
		
		
		   @GetMapping("viewallproducts")
		   public ModelAndView viewallproducts()
		   {
			   List<Product> productlist = productService.ViewAllProducts();
			   
			   ModelAndView mv = new ModelAndView("viewallproducts");
			   
			   mv.addObject("productlist", productlist);
			   
			   return mv;
		   }

		   @GetMapping("viewproduct")
			public String viewproduct() 
			{
				
				return "viewproduct";
			}
		   
		   
		   
		   
		      @GetMapping("viewproductbyid")
			  public ModelAndView viewproduct(@RequestParam("id") int id)
			  {
			    Product product = productService.ViewProductByID(id);
			    
			    List<Product> productlist = productService.ViewAllProducts();
			   
			    ModelAndView mv = new ModelAndView();
			    mv.setViewName("viewproduct");
			    mv.addObject("product", product);
			    mv.addObject("productlist", productlist);
			    return mv;
			  }
		      
		      
		      @GetMapping("viewproductimages")
				public ModelAndView productimages(@RequestParam("id") int id) 
				{
		    	  Product product = productService.ViewProductByID(id);
		    	  
		    	  ModelAndView mv = new ModelAndView("viewproductimages");
		    	  mv.addObject("product", product);
		    	  
		    	  return mv;
					
					
				}
		   
		      

		      @GetMapping("/bookProduct")
		      public String bookProduct(@RequestParam("productId") int productId, HttpServletRequest request) {
		          
		    	    String msg = null;
					ModelAndView mv = new ModelAndView();
		    	  
		    	  
		          HttpSession session = request.getSession();
		          Integer customerId = (Integer) session.getAttribute("cid");

		          if (customerId != null) {
		              
		              Customer customer = customerService.viewbyid(customerId);

		              if (customer != null) {
		                  
		            	  
		            	  Product product = productService.ViewProductByID(productId);
		            	  
		                  ProductBooking productBooking = new ProductBooking();
		                  productBooking.setCustomer(customer); // Set the Customer object
		                  productBooking.setProduct(product); // Set the product ID from the request parameter

		                  // You can set other fields such as quantity, address, and payment method as needed
		                    productBooking.setQuantity(1); // Example quantity
		                 // productBooking.setAddress("123 Main St"); // Example address
		                //  productBooking.setPaymentmethod("Credit Card"); // Example payment method

		                  
		                  msg = customerService.bookproduct(productBooking); // Implement your service method

		                  mv.setViewName("viewproduct");
						  mv.addObject("message",msg);
						  
						  return "redirect:/viewOrders";
		              } else {
		                  msg = "Booking Failed: Customer not found";
		                  
						  return msg;
		              }
		          } else {
		              msg = "bookingfailed";
					  return msg;
		          }
		      }

		      @GetMapping("/viewOrders")
		      public ModelAndView viewOrders(HttpServletRequest request) {
		          
		    	  ModelAndView mv = new ModelAndView();
		    	  
		          HttpSession session = request.getSession();
		          Integer customerId = (Integer) session.getAttribute("cid");

		          if (customerId != null) {
		              
		              List<ProductBooking> orders = customerService.getOrdersByCustomer(customerId); 
		              
		              double totalCost = 0.0;
		              for (ProductBooking order : orders) {
		                  // Assuming 'product' is the property representing the associated Product
		                  Product product = order.getProduct();
		                  if (product != null) {
		                      totalCost += product.getCost() * order.getQuantity();
		                  }
		              }

		              
		              
		              mv.addObject("orders", orders);
		              mv.addObject("totalcost", totalCost);
		              mv.setViewName("customerorders");
		              

		              return mv; 
		          } else {
		        	  String msg = "Please loginh to view your orders";
		        	  mv.addObject("msg", msg);
		              mv.setViewName("customerorders");
		              
		              return mv;
		        	  
		               
		          }
		      }


		      @GetMapping("delete/{id}")
			  public String deleteaction(@PathVariable("id") int pid)
			  {
			    customerService.deleteProduct(pid);
			    
			    return "redirect:/viewOrders";
			  }
		          
		        
		      
		      
 //----------------------------------vehicle---------------------------------------------//
		      
		      @GetMapping("vehicle")
		      public String vehicle()
		      {
		    	
		    	  return "addvehicle";
		      }
		      
		      
		        @PostMapping("insertvehicle")
				public ModelAndView insertvehicle(HttpServletRequest request,@RequestParam("vehiclepic") MultipartFile file1) throws IOException, SerialException, SQLException
				{
					String msg = null;
					ModelAndView mv = new ModelAndView();
					
					try 
					{
						
						
						
						String make = request.getParameter("make");
						String model = request.getParameter("model");
						Integer year = Integer.valueOf(request.getParameter("year"));
					    String vin = request.getParameter("vin");
					    String color = request.getParameter("color");
					    Double mileage = Double.valueOf(request.getParameter("mileage"));
					    
					    
					    
					      byte[] bytes1 = file1.getBytes();
						  Blob pic1 = new javax.sql.rowset.serial.SerialBlob(bytes1);
						  
						 
						
					    
					      Vehicle v = new Vehicle();
					      v.setMake(make);
					      v.setModel(model);
					      v.setYear(year);
					      v.setVin(vin);
					      v.setColor(color);
					      v.setMileage(mileage);
					      
					      v.setVehiclepic(pic1);
					        
					      msg = customerService.addvehicle(v);
					      mv.setViewName("addvehicle");
						  mv.addObject("message",msg);
					        
					} 
					catch (Exception e) 
					{
						msg = e.getMessage();
						mv.setViewName("addvehicle");
						mv.addObject("message",msg);
					}
				   
					return mv;
				    
				}
		      
		      
		        @GetMapping("displayvehicleimage")
				public ResponseEntity<byte[]> displayvehicleimage(@RequestParam("id") int id) throws IOException, SQLException
				{
				  Vehicle vehicle =  customerService.viewvehiclebyid(id);
				  byte [] imageBytes1 = null;
				  imageBytes1 = vehicle.getVehiclepic().getBytes(1,(int) vehicle.getVehiclepic().length());

				  return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes1);
				  
				  
				} 
		      
				@GetMapping("viewcustomercars")
			    public ModelAndView viewcustomercars() 
				{
			        ModelAndView mv = new ModelAndView("customercars");

			        Integer customerId = (Integer) httpSession.getAttribute("cid");

			        if (customerId != null) {
			            List<Vehicle> vehicles = customerService.getcustomervehicles(customerId);
			            mv.addObject("vehicles", vehicles);
			        }
			        else 
			        {
			            
			        }

			        return mv;
			    }
		      
				///----------------Technician------------------///
				
				
				@GetMapping("addtechnician")
				public String addtechnician()
				{
					return "addtechnician";
					
				}
				
				@PostMapping("inserttechnician")
				public ModelAndView inserttechnician(HttpServletRequest request,@RequestParam("profilepic") MultipartFile file) throws IOException, SerialException, SQLException
				{
					String msg = null;
					ModelAndView mv = new ModelAndView();
					
					try 
					{
						String firstname = request.getParameter("firstname");
						String lastname = request.getParameter("lastname");
					    String specializations = request.getParameter("specializations");
					    String email = request.getParameter("email");
					    String password = request.getParameter("password");
					    String phonenumber = request.getParameter("phonenumber");
					    String Rating = request.getParameter("rating");
					    
					      byte[] bytes = file.getBytes();
						  Blob profilepic = new javax.sql.rowset.serial.SerialBlob(bytes);
						
					    
					     
					      Technician t = new Technician();
					      t.setFirstName(firstname);
					      t.setLastName(lastname);
					      t.setRating(Rating);
					      t.setSpecializations(specializations);
					      t.setEmail(email);
					      t.setPassword(password);
					      t.setProfilepic(profilepic);
					      t.setPhoneNumber(phonenumber);
					      
					      
					      technicianService.addtechnician(t);
					      
					    
					      

					      
					      mv.setViewName("technicianlogin");
					      
					      mv.addObject("message", "Registration Successful!");

					        
					} 
					catch (Exception e) 
					{
						String errorMessage = e.getMessage();
					    msg = errorMessage.length() > 150 ? errorMessage.substring(0, 100) + "..." : errorMessage;
					    mv.setViewName("displaymsg");
					    mv.addObject("message", msg);
					    mv.addObject("goback", "customerregistration");
					}
				   
					return mv;
				    
				}
				
				@GetMapping("displaytechnicianprofilepic")
				public ResponseEntity<byte[]> displaytechniciandp(@RequestParam("id") int id) throws IOException, SQLException
				{
				  Technician technician =  technicianService.getTechnicianById(id);
				  byte [] imageBytes = null;
				  imageBytes = technician.getProfilepic().getBytes(1,(int) technician.getProfilepic().length());

				  return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
				}
				
				
				@GetMapping("technicianlogin")
				public String technicianlogin() 
				{
					return "technicianlogin";
				}
				
				
				@PostMapping("checktechnicianlogin")
				public ModelAndView checktechnicianlogin(HttpServletRequest request) 
				{
					 ModelAndView mv = new ModelAndView();
				
					 String email = request.getParameter("email");
				     String password = request.getParameter("password");
				     
				    Technician t = technicianService.technicianlogin(email, password);
				    
				    if(t!=null)
				    {
				    	//session
				    	
				    	HttpSession session = request.getSession();
				    	
				    	session.setAttribute("tid", t.getId()); // eid is a session variable
				    	session.setAttribute("tname",t.getFirstName()); // ename is a session variable
				    	
				    	//session
				    	
				    	mv.setViewName("technicianhome");
				      
				    }
				    else
				    {
				      mv.setViewName("forbiddenpage");
				      mv.addObject("message","Login Failed");
				    }
					
				    return mv;
				}
				
				@GetMapping("viewassignedvehicles")
				public ModelAndView viewAssignedVehicles(HttpServletRequest request) 
				{
					 ModelAndView mv = new ModelAndView("viewassignedvehiclesfortechnician");

				        Integer technicianId = (Integer) httpSession.getAttribute("tid");
				        
				        System.out.println("technician id is getting passed"+technicianId);

				        if (technicianId != null) {
				            List<Vehicle> vehicles = technicianService.getAssignedVehiclesForTechnician(technicianId);
				            mv.addObject("vehicles", vehicles);
				        }
				        else 
				        {
				            System.out.println("i am not here ");
				        }

				        return mv;
				}
	


				@GetMapping("adminviewassignedvehicles")
				public ModelAndView adminviewAssignedVehicles() {
				    
					ModelAndView mv = new ModelAndView("viewassignedvehicles");			
					List<BookTechnician> technicians = technicianService.getalltechnicianbookings();
					
					mv.addObject("technicians", technicians);
					
				    return mv;
				}
		  

			
				
				
				@GetMapping("viewtechnicians")
				public ModelAndView viewtechnicians()
				{
					List<Technician> technicians = technicianService.getAllTechnicians();
					ModelAndView mv = new ModelAndView();
					mv.setViewName("viewtechnicians");
					mv.addObject("technicians", technicians);
				
					return mv;
				}
				
				
				@GetMapping("booktechnician")
				public ModelAndView viewtechniciansforbooking(@RequestParam("carid") int carid)
				{
					List<Technician> technicians = technicianService.getAllTechnicians();
					ModelAndView mv = new ModelAndView();
					mv.setViewName("viewtechniciansforbooking");
					mv.addObject("carid", carid);
					mv.addObject("technicians", technicians);
				
					return mv;
				}
				
				@GetMapping("/booktechnicians")
				public ModelAndView bookTechnician(
				    @RequestParam("technicianId") int technicianId,
				    @RequestParam("vehicleId") int vehicleId) {

				    
				    Technician technician = technicianService.getTechnicianById(technicianId);
				    Vehicle vehicle = technicianService.getVehicleById(vehicleId);

				    technicianService.assignVehicleToTechnician(technicianId, vehicleId);
				    
				    ModelAndView mv = new ModelAndView();
				    mv.setViewName("techinicianboookingsuccess");
				    mv.addObject("message","Technician Booking Successful.....!");
				    
				    return mv;
				}

				
				@GetMapping("technicianprofile")
			    public ModelAndView technicianprofile(HttpServletRequest request)
			    {
					  ModelAndView mv = new ModelAndView();
				      
				      HttpSession session = request.getSession();
				      
				      mv.setViewName("technicianprofile");
				      
				      mv.addObject("tid", session.getAttribute("tid"));
				      
				      
				      int id =  (int) session.getAttribute("tid");
				      
				      Technician technician = technicianService.getTechnicianById(id);
				      
				      mv.addObject("technician", technician);
				      
				      return mv;
			    }
				
				
				
				
				
				
		        
 } // end parenthesis
		          
		          
		            

	

