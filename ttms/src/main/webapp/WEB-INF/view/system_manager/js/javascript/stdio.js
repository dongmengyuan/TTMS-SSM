let array = {};
function find() {
    let table = document.getElementById('stdio');
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
        return array;
    }

}

function checkAll() {
    let add = document.getElementById('add');
    if (checkName() && checkType() && checkRow() && checkCol() && checkStatus()) {
        add.setAttribute('data-dismiss', 'modal');
        return true;
    }
    else {
        return false;
    }
}


function model() {
    // let a = find();
    // console.log(array);
    document.getElementById('ID').value = array.info[0];
    document.getElementById('nam').value = array.info[1];
    document.getElementById('typ').value = array.info[2];
    document.getElementById('rows').value = array.info[3];
    document.getElementById('cols').value = array.info[4];
    document.getElementById('statu').value = array.info[5];


}


function save(obj) {
    let info = [];
    info[0] = document.getElementById('nam').value;
    info[1] = document.getElementById('typ').value;
    info[2] = document.getElementById('rows').value;
    info[3] = document.getElementById('cols').value;
    info[4] = document.getElementById('statu').value;
    for (let i = 0; i < array.n; i++) {
        array.table.rows[array.num].cells[i].innerHTML = info[i];
    }

}

function dels(obj) {
    //(array.table).deleteRow(array.num);
    console.log(array.info[0]);
    $.post("/deleteStudio", {"studioId": array.info[0]}, function (data) {
        alert("删除更新成功！");
        window.location.reload();
    });
}

function add() {
    if (checkAll()) {
        let employeAdd = document.getElementById('stdio');
        let addInfo = [];
        addInfo[0] = document.getElementById('name').value;
        addInfo[1] = document.getElementById('type').value;
        addInfo[2] = document.getElementById('row').value;
        addInfo[3] = document.getElementById('col').value;
        addInfo[4] = document.getElementById('status').value;
        let newRow = employeAdd.insertRow();
        let employeeName = newRow.insertCell();
        let employeeType = newRow.insertCell();
        let employeeRow = newRow.insertCell();
        let employeeCol = newRow.insertCell();
        let employeeStatus = newRow.insertCell();

        employeeName.innerText = addInfo[0];
        employeeType.innerText = addInfo[1];
        employeeRow.innerText = addInfo[2];
        employeeCol.innerText = addInfo[3];
        employeeStatus.innerText = addInfo[4];

        document.getElementById('name').value = '';
        document.getElementById('type').value = '';
        document.getElementById('row').value = '';
        document.getElementById('col').value = '';
        document.getElementById('status').value = '';
    }
}

function manage(){
    let studioId = array.info[0];
    window.location.href = 'http://localhost:8080/showSeat/'+studioId;
}
