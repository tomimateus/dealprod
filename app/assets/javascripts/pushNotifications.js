/**
 * Created with JetBrains RubyMine.
 * User: Personal
 * Date: 18/09/13
 * Time: 10:21
 * To change this template use File | Settings | File Templates.
 */
function startFaye(userID){
    var faye = new Faye.Client('http://localhost:9292/faye');
    console.log("Connecting... "+ userID);
    faye.subscribe('/offers/start/'+userID, function(data){
        console.log("AAAA");
        alert(data);
    })
}
