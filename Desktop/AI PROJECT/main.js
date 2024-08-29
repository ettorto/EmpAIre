// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

var video = document.getElementById("cam_input");

var container = document.getElementById("container");

var dialogue = document.getElementById("filter-blur");



video.onclick = function () {
    modal.style.display = "block";
    dialogue.style.display = "block";
}

function result() {
    document.getElementById("filter-blur").style.display = "block";
    document.getElementById("myModal").style.display = "block";
    
}

function off(){
    dialogue.style.display = "none";
    container.style.display = "none";
    document.getElementById("container").style.display = "none";
    document.getElementById("filter-blur").style.display = "none"
}

function quit() {
    document.getElementById("myModal").style.display = "none";
    document.getElementById("myModal").style.display = "none";
    document.getElementsByClassName("modal").style.display = "none";
    document.getElementsByClassName("modal-content").style.display = "none";
    document.getElementById("filter-blur").style.display = "none";
}


// When the user clicks on <span> (x), close the modal
span.onclick = function () {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}