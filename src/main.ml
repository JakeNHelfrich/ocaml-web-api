open Healthcheck_controller

let () = Dream.run 
  ~interface:"0.0.0.0"
  ~port:8080
  @@ Dream.logger
  @@ Dream.router [
    Dream.scope "/healthcheck" [] healthcheck_controller;
  ];;
