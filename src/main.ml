let () = Dream.run 
  ~interface:"0.0.0.0"
  ~port:8080
  @@ Dream.logger
  Routing.routes;;
