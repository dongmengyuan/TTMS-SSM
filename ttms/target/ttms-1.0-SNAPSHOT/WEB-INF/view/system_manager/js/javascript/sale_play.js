/**
 * Created by ubuntu on 6/11/18.
 */
let array = {};
function find() {
    let table = document.getElementById('play');
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
        array.num = num;
        array.table = table;
        array.n = length;
        array.info = arr;
        console.log(array);
        return array;
    }

}

let oBtn = document.querySelectorAll('button');
oBtn[1].onclick = function(){
    let id = array.info[0];
    if(id){
        window.location.href = '../showScheduleByPlayId1/'+id;
    }
};
let search = document.querySelector('input');

oBtn[0].onclick = function(){
    let data = search.value;
    console.log(data);
    if(data !== ''){
        let table = document.getElementById('play');
        for(let i = 0; i < table.rows.length; i++){
            table.rows[i].style.display = 'none';
        }
        let a = [];
        for(let i = 0; i < table.rows.length; i++){
            for(let j = 0; j < table.rows[i].cells.length; j++){
                if(data == table.rows[i].cells[j].innerHTML){
                    a.push(table.rows[i]);
                    table.rows[i].style.display = 'table-row';
                }
            }
        }
    }
    else{
        let table = document.getElementById('play');
        for(let i = 0; i < table.rows.length; i++){
            table.rows[i].style.display = 'table-row';
        }
    }
};


