
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
  <jsp:include page="header.jsp" />

 
 <section id="center" class="center_cont"
  style="
    background-image: url('image/rsz_vinfast_banner_1920x1280.jpg');
    background-position: center center;
    background-size: cover;
    background-repeat: no-repeat;
  ">


   <div class="center_om bg_back">
     <div class="container-xl">
  <div class="row center_o1">
     <div class="col-md-12">
	    <h1 class="text-white font_60">LIÊN HỆ</h1>
		<h6 class="col_red mb-0"><a class="text-light" href="index.jsp">TRANG CHỦ</a> <span class="mx-2 text-white-50">/</span> LIÊN HỆ</h6>
	 </div>
  </div>
 </div>
   </div>   
 </section>
 
 <section id="contact" class="pt-5 pb-5">
  <div class="container-xl">
     <div class="row row-cols-1 row-cols-sm-2 row-cols-md-2 contact_1">
	    <div class="col">
		  <div class="contact_1_left">
		     <h6 class="col_red fs-6 space_4">Team 3</h6>
		   <h2><a href="#">Tăng tốc phong cách lái xe của bạn</a></h2>
		   <p class="mt-3">Trải nghiệm sự phấn khích trong từng chuyển động. Sự kết hợp hoàn hảo giữa tốc độ, sức mạnh và phong cách — giúp bạn làm chủ mọi hành trình.</p>
		   <h4 class="mt-4">OFFICE IN HANOI</h4>
		   <ul class="mt-4 family_1 mb-0">
		    <li class="d-flex"><i class="fa fa-map-marker col_red me-3 mt-1"></i> Vinhome RiverSide </li>
			<li class="d-flex mt-3"><i class="fa fa-phone col_red me-3 mt-1"></i> <a class="text-muted link" href="#"> 098 999 9999</a></li>
			<li class="d-flex mt-3"><i class="fa fa-envelope col_red me-3 mt-1"></i> <a class="text-muted link" href="#">luxurymotor@gmail.com</a></li>
		   </ul>
		  </div>
		</div>
		<div class="col">
		  <div class="contact_1_right mt-4">
		     <form class="row g-3 needs-validation p-2" novalidate="">
			<div class="col-md-6">
				
				<input type="text" class="form-control" id="name" value="TÊN" required="">
				<div class="valid-feedback">
				  Looks good!
				</div>
				<div class="invalid-feedback">
				  Please provide a valid first name.
				</div>
			</div>
			<div class="col-md-6">
				<input type="text" class="form-control" id="email" value="Email" required="">
				<div class="valid-feedback">
				  Looks good!
				</div>
				<div class="invalid-feedback">
				  Please provide a valid last name.
				</div>
			</div>
			<div class="col-md-6">
				
				<input type="text" class="form-control" id="subject" value="YÊU CẦU" required="">
				<div class="valid-feedback">
				  Looks good!
				</div>
				<div class="invalid-feedback">
				  Please provide a valid subject.
				</div>
			</div>
			<div class="col-md-6">
				<input type="text" class="form-control" id="website" value="SỐ ĐIỆN THOẠI" required="">
				<div class="valid-feedback">
				  Looks good!
				</div>
				<div class="invalid-feedback">
				  Please provide a valid website.
				</div>
			</div>
	        <div class="col-md-12">
			 <textarea id="message" value="Your Message (Maximum 300 words)" class="form-control form_text" required=""></textarea>
			    <div class="valid-feedback">
				  Looks good!
				</div>
				<div class="invalid-feedback">
				  Please provide a valid message.
				</div>
			</div>
			
			<div class="col-12 center_sm">
			  <button class="btn btn-primary button p-3 px-5 border-0 rounded-0" type="submit">Submit</button>
			</div>
		</form>
		  </div>
		</div>
	 </div>
	 <div class="row contact_2 mt-5">
    
   </div>
  </div>
</section>
 
 <jsp:include page="footer.jsp" />

		
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/theme.min.js"></script>

</body>
</html>