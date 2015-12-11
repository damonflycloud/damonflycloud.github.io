

<a id="hamburger" class="mm-slideout mm-page" href="#mmenu">aa</a>

<nav id="mmenu">
     <ul>

     </ul>
 </nav>

<link type="text/css" rel="stylesheet" href="{{ url_for(theme.vendors) }}/mmenu/core/css/jquery.mmenu.all.css" />
<link type="text/css" rel="stylesheet" href="{{ url_for(theme.vendors) }}/mmenu/css/mymenu.css" />
<script type="text/javascript" src="{{ url_for(theme.vendors) }}/mmenu/core/js/jquery.mmenu.min.all.js"></script>

 <!--<div id="page" class="mm-slideout mm-page">
 			<a id="hamburger" class="Fixed" href="#menu"></a>
 </div>-->


<script type="text/javascript">
  $(document).ready(function () {
          $.getJSON("/json/menu.json",function(data){
            $.each( data, function() {
            var html="<li id='" + this.id + "'>" +"<a href='#'>"+this.text + "</a></li>"
            var chirldHtml="<ul><li id='"+this.id+"'>"+"<a href='#'>"+this.text+"</a></li></ul>"
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

            {% for page in site.posts %}
              var html="<li>" +"<a href='{{ url_for(page.path) }}'>"+ " {{ page.title }}</a></li>";
              {% if page.parent %}
                   $('li#'+"{{ page.parent }}>ul:first").append(html);
              {% else %}
                   $('#mmenu>ul:first').append(html);
              {% endif %}
            {% endfor %}

            $('#mmenu').mmenu({
             extensions		: [ 'widescreen', 'theme-white', 'effect-menu-slide', 'pagedim-black'],
             			counters		: true,
             			dividers		: {
             				fixed 	: true
             			},
             			navbar 			: {
             				title	: 'mmenu'
             			},
             			navbars			: [{
             				position: 'top',
             				content : ['searchfield']
             			}, {
             				position: 'top'
             			}, {
             				position: 'bottom',
             				content : ['<div>Hosted by <a href="http://damonflycloud.info" target="_blank">FlyCloud</a></div>']
             			}]
            });
          })


      });
</script>


