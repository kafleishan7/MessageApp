<?php

$db_connection = mysqli_connect("localhost","id20147639_ishankafle","5Iz9tu@zgB_0o%Bt","id20147639_elevatetalk");
// Check connection
if (mysqli_connect_errno()){
    http_response_code(400);
    echo "Failed to connect to the Server: " . mysqli_connect_error();
}

if ($_SERVER['REQUEST_METHOD']=='POST') {
   	$username = $_POST['name'];
	$email = $_POST['email'];
	$phonenumber = $_POST['phonenumber'];
	$password = $_POST['password'];

	$checkemail= "Select email from Signup where email='$email'";
	
	$results=mysqli_num_rows(mysqli_query($db_connection,$checkemail));
	if($results > 0){
	    
	   http_response_code(404);

	    echo json_encode("Email is already Exits");
	}
	else{
	    $random1= rand(10,100);
        $random2=rand(10,100);
        $random3=rand(10,100);
        $random4=rand(10,100);

        $finalramdom="$random1$random2$random3$random4";
	    $insert_query = "INSERT INTO Signup(username,email,phonenumber,password,verificationcode) VALUES ('$username','$email','$phonenumber','$password','$finalramdom')";
	    mysqli_query($db_connection,$insert_query);
        http_response_code(200);
        $msg = " Your Veryfication Code is: $finalramdom";
// use wordwrap() if lines are longer than 70 characters
$msg = wordwrap($msg,70);

// send email
mail("www.2020ishankafle@gmail.com","Hey $username,Elevate Talk veryfication Code",$msg,"Verfication Code");
// mail(to,subject,message,headers,parameters);

}
}
else
{
	echo "bad";
}
?>


