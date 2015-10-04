//TODO:  Make this work the correct (boring) way
var userIDToName = function(userID) {
    switch(Math.floor((Math.random() * 6) + 1)) {
        case 1:
            return "Jesus";
        case 2:
            return "Princess Luna";
        case 3:
            return "Gandalf";
        case 4:
            return "Pope Francis";
        case 5:
            return "Batman";
        case 6:
            return "Luigi";
        default:
            return "";
    }
}

//TODO:  Make this work the correct way
var userIDToAvatarURL = function(userID) {
    var root = "html/img/avatars/user-";
    switch(Math.floor((Math.random() * 6) + 1)) {
        case 1:
            return root + "1.png";
        case 2:
            return root + "2.png";
        case 3:
            return root + "3.png";
        case 4:
            return root + "4.png";
        case 5:
            return root + "5.png";
        case 6:
            return root + "6.png";
        default:
            return "";
    }
}
