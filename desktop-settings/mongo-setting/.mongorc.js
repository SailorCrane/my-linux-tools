
// copy this to ~/.mongorc.js
// cp .mongorc.js  ~/.mongorc.js


var compliment = ['attractive', 'like Batman'];
var index =  Math.floor(Math.random() * 3);

print("Hello, you're look particularly " + compliment[index] + " today!");


// define prompt
prompt = function() {
    if (typeof db == 'undefined') {
        return '(nodb)> ';
    }

    try {
        db.runCommand( {getLastError: 1} );
    }
    catch(e) {
        print(e)
    }

    return db + "> "
}

EDITOR = '/usr/bin/vim'     // edit var (will use this EDITOR)



// find range : frange('t1', 'age', 18, 26)
function frange(collection, field, min, max) {
    // $gt, $gte, $lt, $lte

    // 这样赋值为了避免  {field : {} }, field会被替换为'field', 而不是field的值
    var filter_cond = {};
    filter_cond[field] = {"$gte" : min, "$lte" : max};

    // result = db[collection].find( {field:  {"$gte" : min, "$lte" : max}})
    var result = db[collection].find(filter_cond);

    //print(result);
    return result;
}


// $or 查询
// db.t1.find( {'$or' : [{'age' : 25}, {'name' : 'fam'}]})


// insert random 插入测试数据
function  ins_num(collection, nums) {
    for (i=0; i<=nums; i++) {
        db[collection].insert({'num':i, 'name':'crane' })
    }
    return nums
}


// 2.6.10
function cols() {
    return db.getCollectionNames()
}
cols = cols()



//function tbs(col) {
//    //return db[col]
//}
