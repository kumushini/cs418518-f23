<?php

session_start();

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
 
require './../vendor/autoload.php';
require 'email_config.php';


try {
    $mail = new PHPMailer(true);

    // $mail->SMTPDebug = 2;                                      
    $mail->isSMTP();                                           
    $mail->Host       = "smtp.gmail.com";                  
    $mail->SMTPAuth   = true;                            
    $mail->Username   = SENDER_EMAIL;               
    $mail->Password   = SENDER_EMAIL_PASSWORD;                   
    $mail->SMTPSecure = "tls";   //ssl                          
    $mail->Port       = 587; //"465";
 
    $mail->setFrom('kumushiniodu@gmail.com', 'Kumushini Thennakoon');          
    
    // $_SESSION["username"]
    $mail->addAddress($_SESSION["username"]);
    // $mail->addAddress('kumushinithennakoon@gmail.com', 'Kumushini Thennakoon');
      
    $mail->isHTML(true);                                 
    $mail->Subject = 'Archiveia - Two step verfication OTP';
    $mail->Body    = "This is your one time password for Archiveia user profile : <b>". $_SESSION['otp_key'] ."</b>";
    $mail->AltBody = 'Body in plain text for non-HTML mail clients';
    $mail->send();
    // echo "Mail has been sent successfully!";
    
    header("location:validate_secret_key.php");

    
} catch (Exception $e) {
    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
}
 
?>

