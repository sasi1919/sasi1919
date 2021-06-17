public class MyController7 {
Public string Display_This_String{get;set;}
Public string invitetext{get;set;}
    Public MyController7 (){
     Display_This_String = 'Constructor is called';
    }
   
    Public void actionFunMethod(){
      Display_This_String = 'value set in action function method';
    }
   
    Public void actionSupMethod(){
      Display_This_String = 'Welcome ' + invitetext;
    }
}