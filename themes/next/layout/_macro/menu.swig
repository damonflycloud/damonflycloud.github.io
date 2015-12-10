{% macro render(post) %}

<nav id="mmenu">
     <ul>

     </ul>
 </nav>

<link type="text/css" rel="stylesheet" href="{{ url_for(theme.vendors) }}/mmenu/core/css/jquery.mmenu.all.css" />
<link type="text/css" rel="stylesheet" href="{{ url_for(theme.vendors) }}/mmenu/css/mymenu.css" />
<!--<script type="text/javascript" src="http://cdn.bootcss.com/jquery/2.1.3/jquery.js"></script>-->
<script type="text/javascript" src="{{ url_for(theme.vendors) }}/jquery/index.js?v=2.1.3"></script>
<script type="text/javascript" src="{{ url_for(theme.vendors) }}/mmenu/core/js/jquery.mmenu.min.all.js"></script>

 <!--<div id="page" class="mm-slideout mm-page">
 			<a id="hamburger" class="Fixed" href="#menu"></a>
 </div>-->


<script type="text/javascript">
    $(document).ready(function () {
        //var data =eval('{{ site.data.menu.value }}');
        //alert(data);
        $.getJSON("/json/menu.json",function(data){
        var items = [];
          $.each( data, function() {
          var html="<li id='" + this.id + "'>" +"<a >"+this.text + "</a></li>"
          var chirldHtml="<ul><li id='"+this.id+"'>"+"<a href='/'>"+this.text+"</a></li></ul>"
          //items.push( "<li id='" + key + "'>" + val + "</li>" );
          if(this.pid==''){
              $('#mmenu>ul:first').append(html);
            }else{
            if($('li#'+this.pid+">ul").length==0){
               $('#'+this.pid).append(chirldHtml);
            }else{
              $('li#'+this.pid+">ul").append(html);
            }
           }
          });

          $('#mmenu').mmenu();
        })


    });
</script>


{% endmacro %}
