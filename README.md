# UberSchedule
This is a web-based application which allows users (students, in this case) to generate a multi-year course sequence. The resulting sequence is tailored according to the preferences and academic record inputted by the users, such as having or not classes at certain days of the week or during the mornings or the evenings, all this while conforming to the rules set forth in the Undergraduate Calendar. 
#***** REMINDER TO RUN DB:SCHEMA:LOAD YOU WANT TO CODE *****
Ive updated the login to use the Devise gem. This will store the user's information in the <code>current_user</code> variable to be used anywhere. I tried to change all instances where $authorized_student or some other logic was being used, though i may have missed things. Please let me know if theres something about this you need help with. -Arek

#Dummy user:
<code>email: no@no.com - password: potato11 </code>
