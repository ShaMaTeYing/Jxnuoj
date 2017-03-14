<script type="text/javascript">  
            function myCheck()  
            {  
               for(var i=0;i<document.form1.elements.length-1;i++)  
               {  
                  if(document.form1.elements[i].value=="")  
                  {  
                     alert("当前表单不能有空项");  
                     document.form1.elements[i].focus();  
                     return false;  
                  }  
               }  
               return true;  
                
            }  
</script>  