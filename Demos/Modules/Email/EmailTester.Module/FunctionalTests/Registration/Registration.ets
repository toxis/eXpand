#DropDB EmailTesterEasyTest
#Application EmailTester.Win
#Application EmailTester.Web
*ScreenCapture
*XpandDeleteFile %temp%\Emails\*.eml
 

;-----Register user------
*SetWebMaxWaitTimeOut 60000
*Action Register User
*XpandFillForm
 User Name = user1
 Password = pass
 Email = user1@mail.com
*Action Register User
*LogOn

;--------Check if confirm mail is send to registered user and to admins
*Navigate Email Object
*XpandProcessRecord 
 Subject = User activation
*XpandCheckFieldValues
 From = sender@mail.com
 To = admin@mail.com, user1@mail.com
 Reply To = mymail@mail.com
 Body = A new user user1 has been created. To activate the account please*
*SaveAndClose

;----------Forgot passs------------------
*LogOff
*Action Restore Password
*XpandFillForm
 Email = user1@mail.com
*Action Restore Password

;---------Check if password send to user that requested-------------
*LogOn
*Navigate Email Object
*XpandProcessRecord 
 Subject = pass forgotten

*XpandCheckFieldValues
 From = sender@mail.com
 To = user1@mail.com
 Reply To = mymail@mail.com
 Body = We created a temporary password *

 

