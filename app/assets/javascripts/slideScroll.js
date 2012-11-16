/*---------------------------------------------------------------

 slideScroll.js
 
 encoding UTF-8

 Copyright (c) 2008 nori (norimania@gmail.com)
 http://moto-mono.net
 Licensed under the MIT

 $Date: 2008-12-25 01:30
 
 ----------------------------------------------------------------*/

(function(){

var interval = 40;
var easing = 0.6;
var comeLink = false;
  
var d=document,dE=d.documentElement,lH=location.hash,timer,t,p={},a=d.getElementsByTagName("a"),$h=function(hash){return document.getElementById(hash.replace("#",""));}
function cp(){return{x:d.body.scrollLeft||dE.scrollLeft,y:d.body.scrollTop||dE.scrollTop}}
function sp(t){var h=dE.clientHeight,w=dE.clientWidth,mH=dE.scrollHeight,mW=dE.scrollWidth;p.top=(mH-h)<t.offsetTop?mH-h:t.offsetTop;p.left=(mW-w)<t.offsetLeft?mW-w:t.offsetLeft;}
function np(){var x=cp().x,y=cp().y,sx=Math.ceil((x-p.left)/(5*easing)),sy=Math.ceil((y-p.top)/(5*easing));return{x:x-sx,y:y-sy,ax:sx,ay:sy}}
function scroll(){timer=setInterval(function(){np();if(Math.abs(np().ax)<1&&Math.abs(np().ay)<1){clearInterval(timer);window.scroll(p.left,p.top);}
window.scroll(np().x,np().y);},interval);}
function hs(){if(!$h(lH))return false;sp($h(lH));window.scroll(0,0);if(document.all)setTimeout(function(){scroll();},50);else scroll();}
function sus(){for(var i=0;i<a.length;i++){if(a[i].hash&&$h(a[i].hash)&&a[i].href.match(new RegExp(location.href.split("#")[0]))){a[i].onclick=function(){clearInterval(timer);sp($h(this.hash));scroll();return false;}}}}
function ae(t,l,fn){try{t.addEventListener(l,fn,false);}catch(e){t.attachEvent("on"+l,function(){fn.apply(t);});}}
if(comeLink&&lH)ae(window,"load",hs);ae(window,"load",sus);})();
