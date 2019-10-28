const http = require('http')

const agent = new http.Agent({
  keepAlive: true,
  keepAliveMsecs: 100000,
  maxSockets: 4,
  timeout: 100000
});

const options = {
  hostname: 'localhost',
  port: 9090,
  path: '/hello/sayHello',
  method: 'GET',
  agent: agent
};

var minTime = 1<<50;
var maxtime = 0;
var sum = 0;

function getTimestamp(callback) {
  const req = http.request(options, res => {
    res.on('data', d => {
      var j = JSON.parse(d);
      // var time = parseInt(d);
      var time = j.time;
       // minTime = Math.min(minTime, time);
      sum += time;
      // process.stdout.write(d)
      callback();

    })
  })
  req.on('error', error => {
    console.error(error)
    callback();
  })
  req.setHeader('Keep-Alive', 'true');
  req.end()
}

var N = 50000;
var cnt = 0;
var startTime = Date.now();
for (var i=0; i<N; ++i) {
  getTimestamp(() => {
    cnt++;
    if (cnt == N) {
      var endTime = Date.now();
      console.log(sum);
      console.log(endTime - startTime);
    }
  })
}
