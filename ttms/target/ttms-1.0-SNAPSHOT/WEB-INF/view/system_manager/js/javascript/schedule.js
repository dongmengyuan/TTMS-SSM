/**
 * Created by ubuntu on 6/10/18.
 */
/**
 * Created by ubuntu on 6/10/18.
 */
'use strict';
let array = {};

(function(){
    let num = 12;
    let studio = document.querySelector('#stdio');
    for(let i = 1; i <= num; i++){
        studio.innerHTML += '<option>' + i + '号演出厅' + '</option>';
    }
    let stdio1 = document.getElementById('stdio1');
    for(let j = 1; j < num; j++){
        stdio1.innerHTML += '<option>' + j + '号演出厅' + '</option>';
    }
    /*获取已上映影片 假设['复仇者联盟', '捉妖记2', '唐人街探案2']*/
    let playArr = ['复仇者联盟', '捉妖记2', '唐人街探案2'];
    let name = document.querySelector('#name');
    for(let j = 1; j <= playArr.length; j++){
        name.innerHTML += '<option>' + playArr[j-1] + '</option>';
    }
    let nam = document.querySelector('#nam');
    for(let j = 1; j <= playArr.length; j++){
        nam.innerHTML += '<option>' + playArr[j-1] + '</option>';
    }
})();
function find() {
    let table = document.getElementById('schedule');
    let length = table.rows[0].cells.length;
    let l = table.rows.length;
    for (let i = 0; i < l; i++) {
        if (i == 0) {
            let row = table.rows[i];
            row.setAttribute('class', 'active');
        }
        else {
            let row = table.rows[i];
            row.setAttribute('class', 'default');
        }
    }
    if (event.srcElement.tagName == 'TD') {
        let curRow = event.srcElement.parentElement;
        let num = curRow.rowIndex;
        if (curRow.rowIndex == 0) {
            curRow.setAttribute('class', 'warning');
            return 0;
        }
        else {
            curRow.setAttribute('class', 'info');

        }
        let arr = [];
        for (let i = 0; i < length; i++) {
            arr[i] = table.rows[num].cells[i].innerHTML;
        }
        array.table = table;
        array.n = length;
        array.info = arr;
        console.log(array);
        return array;
    }

}

function checkAll() {
    let add = document.getElementById('add');
    let name = document.getElementById('name').value;
    let time = document.getElementById('time').value;
    if (name && time) {
        add.setAttribute('data-dismiss', 'modal');
        return true;
    }
    else {
        return false;
    }
}
function model() {
    document.getElementById('nam').value = array.info[0];
    document.getElementById('studio1').value = array.info[1];
    document.getElementById('play1').value = array.info[2];
    document.getElementById('time1').value = array.info[3];
    document.getElementById('price1').value = array.info[4];
    // let nam = document.getElementById('nam');
    // console.log(nam);
    // for(let i = 0; i < nam.options.length; i++){
    //     if(nam.options[i].innerText == array.info[0]){
    //         nam.selectedIndex = i;
    //     }
    // }
    // var stdio1 = document.getElementById('stdio1');
    // for(let i = 0; i < stdio1.options.length; i++){
    //     if(stdio1.options[i].innerText == array.info[1]){
    //         stdio1.selectedIndex = i;
    //     }
    // }
    // document.getElementById('time1').value = array.info[2];
    // let price1 = document.getElementById('price1');
    // for(let j = 0; j < price1.options.length; j++){
    //     if(price1.options[j].innerText == array.info[3]){
    //         price1.selectedIndex = j;
    //     }
    // }


}


function save(obj) {
    let info = [];
    info[0] = document.getElementById('nam').value;
    info[1] = document.getElementById('stdio1').value;
    info[2] = document.getElementById('time1').value;
    info[3] = document.getElementById('price1').value;

    for (let i = 0; i < array.n; i++) {
        array.table.rows[array.num].cells[i].innerHTML = info[i];
    }

}

function del(obj) {
    (array.table).deleteRow(array.num);
}

function add() {
    if(checkAll()){
        let scheduleAdd = document.getElementById('schedule');
        let addInfo = [];
        addInfo[0] = document.getElementById('name').value;
        addInfo[1] = document.getElementById('stdio').value;
        addInfo[2] = document.getElementById('time').value;
        addInfo[3] = document.getElementById('price').value;
        let newRow = scheduleAdd.insertRow();
        let playName = newRow.insertCell();
        let stdio = newRow.insertCell();
        let time = newRow.insertCell();
        let price = newRow.insertCell();

        playName.innerText = addInfo[0];
        stdio.innerText = addInfo[1];
        time.innerText = addInfo[2];
        price.innerText = addInfo[3];

        document.getElementById('name').value = '';
    }

}

