
template |head|
#!/usr/bin/env node
endtemplate

template |require|
var ____ = require(____); // load module;
endtemplate


template |print|
console.log(____);
endtemplate

template |function|
function (____) {
	____
};
endtemplate


template |server|
http.createServer(function (req, res) {  // req: request from clinet...
    res.writeHead(200, {'Content-Type': 'text/html'});

	____

	res.end();
}).listen(____); 
endtemplate

template |readFile|
____.readFile(____, function(err,data) {
	res.writeHead(200,{'Content-Type': 'text/html'});
	res.write(data);
	res.end();
});
endtemplate

template |appendFile|
____.appendFile(____, ____, function (err) {
  if (err) throw err;
  console.log('Saved!');
});
endtemplate

template |open|
____.open(____,____,function (err,file) {
	if (err) throw err;
	console.log('Saved!');
});
endtemplate

template |writeFile|
____.writeFile(____, ____, function (err) { // It replaces file...
  if (err) throw err;
  console.log('Saved!');
}); 
endtemplate

template |unlink|
____.unlink(____, function (err) {
  if (err) throw err;
  console.log('File deleted!');
}); 
endtemplate

template |rename|
____.rename(____, function (err) {
  if (err) throw err;
  console.log('File renamed!');
}); 
endtemplate

