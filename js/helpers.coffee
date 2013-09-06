window.puts        = (output)     -> console.log output
window.setUsername = (username)   -> window.location.hash = username
window.getUsername =              -> if window.location.hash is "" then false else window.location.hash[1..-1]
