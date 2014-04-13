// app.js



var ge;
google.load("earth", "1");


function init() {
    console.log("Show Map");
    google.earth.createInstance('canmap', initCB, failureCB);
}

function initCB(instance) {
    ge = instance;
    ge.getWindow().setVisibility(true);
    // add a navigation control
    ge.getNavigationControl().setVisibility(ge.VISIBILITY_AUTO);

    var lookAt = ge.createLookAt('');
    ge.getOptions().setMapType(ge.MAP_TYPE_SKY);
    //    lookAt.set(-59.65189337195337, -18.799770300376053, 0, ge.ALTITUDE_RELATIVE_TO_GROUND, 0, 0, 36817);
    /*
    
          */
    $('#container').css('display', 'block');
    // Testing Fly In

    //    getFlyIn(-44, -434, 1);
    //    getFlyIn(-100, -433, 2);
    //    getFlyIn(-330, -504, 3);
    //    getFlyIn(-80, -504, 3);


}

function failureCB(errorCode) {
    console.log(errorCode);
}


// fly in 
function getFlyIn(numLat, numLng, numMove) {
    // 
    console.log(numMove);
    var fts = ge.getOptions().getFlyToSpeed();
    ge.getOptions().setFlyToSpeed(.2); // Slow Down

    lookAt = ge.getView().copyAsLookAt(ge.ALTITUDE_RELATIVE_TO_GROUND);
    lookAt.set(numLat, numLng, ge.ALTITUDE_RELATIVE_TO_GROUND, 0, 0, 368, ge.getView().setAbstractView(lookAt));

    ge.getView().setAbstractView(lookAt);
    ge.getOptions().setFlyToSpeed(oldFlyToSpeed);

}



//
function makeFlickrShow() {

}

function makePoint(data) { //
    var strNme = "astroidID" + data.id;
    var strNmeAT = strNme + " .h1AsteroidTitle";
    var strNmeAuth = strNme + " .author";
    var strNmeTime = strNme + " time";
    $('.divBubble').clone().appendTo("body").attr(id, strNme);
    $(strNmeAT).html(data.name);
    $(strNmeAuth).html(data.author);
    $(strNmeTime).attr('datetime', data.time).html(data.time);
    $(astroidID).css({
        "position": "absolute",
        "top": "50%",
        "left": "50%"
    });
}

$.getJSON("", function(data) {
    loadPoints(data);
});

$(document).ajaxComplete(function() {

});

google.setOnLoadCallback(init);