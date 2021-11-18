# this project is a web server that provides dynamic search for local files.
# it uses angularjs on the client-side and nodejs on the server-side.
# the client has a searchbox to search for local html docs inside the public folder.
# on each typped letter, the search engine will filter results dynamically and locally to provide best performance

to start, modify the ./build-and-start.sh script with the APP_NAME to appear on the website title.

then run the script (NOTE ! each time you run the script it DESTROYS the old deployment and replace with a new one.
for production use, u will want to avoid this behaviour and create a better start script.

after launching the container, browse to http://localhost, then type 'a' in the searchbox to see local files in ./public folder

