/*The two functions below allow to get a slideshow in the home page*/

//This function allow to change the image in the image carrier by clicking on the picture or invoking the function
function ChangingPicture() {
    // Declaring a variable to hold hold the value of the picture that is displayed
    var pic;
    // Getting the element that stores the picture displayed
    pic = document.getElementById('MainPicture');
    // If else statements to check what picture is being displayed at the moment of invoking the function
    // Depending on what picture is displayed a new image will be set up. Once the last image has been displayed the first one
    // will be set up again.
    if (pic.src.match("LosRoques3")) {
        pic.src = "Aponwao.jpg";
    } else if (pic.src.match("Aponwao")) {
        pic.src = "PicoBolivar.jpg";
    } else if (pic.src.match("PicoBolivar")) {
        pic.src = "Morrocoy8.jpg";
    } else if (pic.src.match("Morrocoy")) {
        pic.src = "Roraima2.jpg";
    } else if (pic.src.match("Roraima")) {
        pic.src = "LosRoques3.jpg";
    }// End of if else statments
}// End of ChangingPicture function

//This function allow to change to the previous image in the image carrier by clicking on the picture 
function ChangingPictureBackwards() {
    // Declaring a variable to hold hold the value of the picture that is displayed
    var pic;
    // Getting the element that stores the picture displayed
    pic = document.getElementById('MainPicture');
    // If else statements to check what picture is being displayed at the moment of invoking the function
    // Depending on what picture is displayed a new image will be set up. Once the last image has been displayed the first one
    // will be set up again.
    if (pic.src.match("LosRoques3")) {
        pic.src = "Roraima2.jpg";
    } else if (pic.src.match("Roraima")) {
        pic.src = "Morrocoy8.jpg";
    } else if (pic.src.match("Morrocoy")) {
        pic.src = "PicoBolivar.jpg";
    } else if (pic.src.match("PicoBolivar")) {
        pic.src = "Aponwao.jpg";
    } else if (pic.src.match("Aponwao")) {
        pic.src = "LosRoques3.jpg";
    }// End of if else statments
}// End of ChangingPicture function