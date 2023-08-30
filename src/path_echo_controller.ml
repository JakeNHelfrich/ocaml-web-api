type path_echo_response = {
  message: string;
}[@@deriving yojson]

let path_echo_controller = [
  Dream.get "/:message" (fun request -> 
    let message = Dream.param request "message" in
    { message }
    |> yojson_of_path_echo_response
    |> Yojson.Safe.to_string
    |> Dream.json  
  )
];;