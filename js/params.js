function loadPageVar (sVar) {
  var val = unescape(window.location.search.replace(new RegExp("^(?:.*[&\\?]" + escape(sVar).replace(/[\.\+\*]/g, "\\$&") + "(?:\\=([^&]*))?)?.*$", "i"), "$1"));
  if(val !== "") {
    return val;
  } else {
    return false;
  }
}

// oh man i have to write one now oooooo
function setParameterByName(name) {

}