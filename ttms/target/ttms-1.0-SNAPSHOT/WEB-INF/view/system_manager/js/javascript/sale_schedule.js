/**
 * Created by ubuntu on 6/11/18.
 */
let array = {};
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
        array.num = num;
        array.table = table;
        array.n = length;
        array.info = arr;
        console.log(array);
        return array;
    }


}

var oBtn = document.querySelectorAll('button');
oBtn[1].onclick = function(){
    var id = array.info[0];
    if(id){
        window.location.href = "../showSaleseat?x="+ array.info[4] + "&y=" + array.info[5] + "&studioId=" + array.info[1] + "&Time=" + array.info[2] + "&schedId=" + array.info[0] + "&Price=" + array.info[3] + "&name="+ escape(array.info[6]);
    }
};