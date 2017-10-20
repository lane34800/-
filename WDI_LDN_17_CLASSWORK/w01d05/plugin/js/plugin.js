document.addEventListener("DOMContentLoaded", function(event) {
    var ptags = document.querySelectorAll("p");

    for (i=0; i < ptags.length; i++) {
      var p = ptags[i];
      var text = p.innerHTML;
      p.innerHTML = linkify(text, "google", "http://www.google.com");
    }

    var links = document.querySelectorAll("a");

    var j =0;
    while( j < links.length ) {
      var a = links[j];
      a.addEventListener("mouseover", function(event) {
        event.target.innerHTML = "this";
      });
      j++;
    }

    function linkify(text, word, url) {
      var newText;
      var regex = new RegExp(word, "g");
      newText = text.replace(regex, "<a href='" + url + "'>" + word + "</a>");
      return newText;
    }
});