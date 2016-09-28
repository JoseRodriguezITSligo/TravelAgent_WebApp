function ImageChanger(callerID) {
    var pic = document.getElementById('BigImage');
    switch (callerID) {
        case "AngelFalls1":
            pic.src = 'SaltoAngel.jpg';
            break;
        case "AngelFalls2":
            pic.src = 'SaltoAngel2.png';
            break;
        case "AngelFalls3":
            pic.src = 'SaltoAngel5.jpg';
            break;
        case "Canaima1":
            pic.src = 'Roraima1.jpg';
            break;
        case "Canaima2":
            pic.src = 'GranSabana6.jpg';
            break;
        case "Canaima3":
            pic.src = 'GranSabana4.jpg';
            break;
        case "LosRoques1":
            pic.src = 'LosRoques2.jpg';
            break;
        case "LosRoques2":
            pic.src = 'LosRoques6.jpg';
            break;
        case "LosRoques3":
            pic.src = 'LosRoques9.png';
            break;
        case "LosAndes1":
            pic.src = 'LosAndes2.jpg';
            break;
        case "LosAndes2":
            pic.src = 'PicoBolivar2.jpg';
            break;
        case "LosAndes3":
            pic.src = 'PicoBolivar3.jpg';
            break;
        case "Morrocoy1":
            pic.src = 'Morrocoy1.jpg';
            break;
        case "Morrocoy2":
            pic.src = 'Morrocoy2.jpg';
            break;
        case "Morrocoy3":
            pic.src = 'Morrocoy5.jpg';
            break;
    }// End of switch statement
}// End of imageChanger function

// End of callerIdentifier function

//jQuery 
$(document).ready(function () {
    $(".smallImage").on({
        mouseenter: function () {
            $(this).css("opacity", "0.4");
        },
        mouseleave: function () {
            $(this).css("opacity", "1")
        },
        click: function () {
            $(".smallImage").fadeTo("fast", 1);
            $("#BigImageFrame").slideDown("slow");
            $(this).fadeTo("slow", 0.3);
        }
    });
    $("#HideButton").click(function () {
        $("#BigImageFrame").slideUp("slow");
        $(".smallImage").fadeTo("fast", 1);
    });
})