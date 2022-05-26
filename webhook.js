let http=require('http')
let server = http.createServer(function(req,res){

  if(req.method=='POST'&& req.url=='/webhook'){

    res.setHeaders('Content-Type','application/json');
    res.end(JSON.stringify({ok:true}))
  }else{
    res.end('Not Found')
  }
})
server.listen(4000,()=>{
  console.log('webhook started on prot:4000')
}
)