/**
 * Created by ubuntu on 21/09/17.
 */
'use strict';
let array = {};



function find() {
    let table = document.getElementById('user');
    let length = table.rows[0].cells.length;
    let l=table.rows.length;
    for(let i = 0;i<l;i++){
        if(i == 0){
            let row = table.rows[i];
            row.setAttribute('class','active');
        }
        else {
            let row = table.rows[i];
            row.setAttribute('class','default');
        }
    }
    if (event.srcElement.tagName == 'TD') {
        let curRow = event.srcElement.parentElement;
        let num = curRow.rowIndex;
        if(curRow.rowIndex == 0){
            curRow.setAttribute('class','warning');
            return 0;
        }
        else{
            curRow.setAttribute('class','info');

        }
        let arr = [];
        for (let i = 0; i < length; i++) {
            arr[i] = table.rows[num].cells[i].innerHTML;
        }
        array.num = num;
        array.table = table;
        array.n = length;
        array.info = arr;
        console.log(arr);
        return array;
    }

}

function model() {

    document.getElementById('num').value = array.info[0];
    document.getElementById('pass1').value = array.info[1];
    document.getElementById('type1').value = array.info[2];
    document.getElementById('ima1').value = array.info[3];


}


function save(obj) {
    let info = [];
    info[0]=document.getElementById('num').value;
    info[1]=document.getElementById('pass1').value;
    info[2]=document.getElementById('type1').value;
    info[3]=document.getElementById('ima1').value;
    for (let i = 0; i < array.n; i++) {
        array.table.rows[array.num].cells[i].innerHTML = info[i];
    }

}


function del(obj) {
    //(array.table).deleteRow(array.num);
    console.log(array.info[0]);
    $.post("/deleteUser", {"empNo": array.info[0]}, function (data) {
        alert("删除更新成功！");
        window.location.reload();
    });
}