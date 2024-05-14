function haeAsunnot(taloyhtioID) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("asunto").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "php/hae_asunnot.php?taloyhtioID=" + taloyhtioID, true);
    xhttp.send();
}