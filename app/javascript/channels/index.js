// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

cart = document.getElementById("cart")
cart.innerHTML = "<%= j render(@cart) %>"

notice = document.getElementById("notice")
if notice
notice.style.display = "none"
