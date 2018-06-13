/**
 * Created by ubuntu on 6/5/18.
 */
var nav = document.querySelector('#left');
var navs = nav.querySelectorAll('li');
var lis = nav.querySelectorAll('a');
var url = window.location.href;
var index = url.lastIndexOf('/');
var nowNav =url.substr(index);
for(var j = 0 ; j < navs.length; j++){
    navs[j].classList.remove('active');
}
var a = [];
for(var i = 0; i < lis.length; i++){
    var nowIndex = lis[i].href.lastIndexOf('/');
    var now = lis[i].href.substr(nowIndex);
    if(now === nowNav){
        navs[i].classList.add('active');
    }

}