document.write("<div class='QQbox3' id='divQQbox' >");
document.write("<div class='Qlist' id='divOnline' onmouseout='hideMsgBox(event);' style='display : none;'>");
document.write("<div><img src='/style/images/qq_3_top.png' width='140px' height='39px' alt='在线客服' /></div>");
document.write("<ul>");
document.write('<li><a target="_blank" rel="nofollow" href="../wpa.qq.com/msgrd9d18.html?v=3&amp;uin=2795712467&amp;site=qq&amp;menu=yes"><img border="0" src=" http://wpa.qq.com/pa?p=2:2795712467:41" width="74px" height="22px" alt="在线咨询"></a></li>');
document.write('<li><a target="_blank" rel="nofollow" href="../wpa.qq.com/msgrdec5c.html?v=3&amp;uin=374504651&amp;site=qq&amp;menu=yes"><img border="0" src=" http://wpa.qq.com/pa?p=2:374504651:41" width="74px" height="22px" alt="在线咨询"></a></li>');
//document.write('<li><a target="_blank" rel="nofollow" href="http://wpa.qq.com/msgrd?v=3&uin=2795712467&site=qq&menu=yes"><img border="0" src=" http://wpa.qq.com/pa?p=2:374504651:41" width="74px" height="22px" alt="在线咨询"></a></li>');
document.write("</ul>");
document.write("<div><img src='/style/images/qq_3_bottom.png' width='140px' height='40px' alt='3142121' /></div>");
document.write("</div>");
document.write("<div id='divMenu' onmouseover='OnlineOver();'><img src='/style/images//qq_3.png' class='press' alt='QQ客服热线'></div>");
document.write("</div>");
//<![CDATA[
var tips; var theTop = 140/*这是默认高度,越大越往下*/; var old = theTop;
function initFloatTips() {
tips = document.getElementById('divQQbox');
moveTips();
};
function moveTips() {
var tt=50;
if (window.innerHeight) {
pos = window.pageYOffset
}
else if (document.documentElement && document.documentElement.scrollTop) {
pos = document.documentElement.scrollTop
}
else if (document.body) {
pos = document.body.scrollTop;
}
pos=pos-tips.offsetTop+theTop;
pos=tips.offsetTop+pos/10;
if (pos < theTop) pos = theTop;
if (pos != old) {
tips.style.top = pos+"px";
tt=10;
//alert(tips.style.top);
}
old = pos;
setTimeout(moveTips,tt);
}
//!]]>
initFloatTips();
function OnlineOver(){
    document.getElementById("divMenu").style.display = "none";
    document.getElementById("divOnline").style.display = "block";
    document.getElementById("divQQbox").style.width = "140px";
}
function OnlineOut(){
    document.getElementById("divMenu").style.display = "block";
    document.getElementById("divOnline").style.display = "none";
}
function hideMsgBox(theEvent)
{ //theEvent用来传入事件，Firefox的方式
　 if(theEvent){
	　 var browser=navigator.userAgent; //取得浏览器属性
	　 if(browser.indexOf("Firefox")>0)
	   { //如果是Firefox
	　     if(document.getElementById('divOnline').contains(theEvent.relatedTarget)) { //如果是子元素
	　　        return; //结束函式
	        } 
       }
       if(browser.indexOf("MSIE")>0){ //如果是IE
           if(document.getElementById('divOnline').contains(event.toElement)) { //如果是子元素
                return; //结束函式
            }
       }
	   
	   if(browser.indexOf("Chrome")>0){
	      if(document.getElementById('divOnline').contains(theEvent.relatedTarget)) { //如果是子元素
                return; //结束函式
            }
	   }
    }
     /*要执行的操作*/
    document.getElementById("divMenu").style.display = "block";
    document.getElementById("divOnline").style.display = "none";
}