//TODO:  Make this work the correct (boring) way
var userIDToName = function(userID) {
    switch(Math.floor((Math.random() * 6) + 1)) {
        case 1:
            return "Jesus";
            break;
        case 2:
            return "Princess Luna";
            break;
        case 3:
            return "Gandalf";
            break;
        case 4:
            return "Pope Francis";
            break;
        case 5:
            return "Batman";
            break;
        case 6:
            return "Luigi";
            break;
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
            break;
        case 2:
            return root + "2.png";
            break;
        case 3:
            return root + "3.png";
            break;
        case 4:
            return root + "4.png";
            break;
        case 5:
            return root + "5.png";
            break;
        case 6:
            return root + "6.png";
            break;
        default:
            return "";
    }
}
