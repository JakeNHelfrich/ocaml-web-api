open Healthcheck_controller

let routes = Dream.router [
  Dream.scope "/healthcheck" [] healthcheck_controller;
]