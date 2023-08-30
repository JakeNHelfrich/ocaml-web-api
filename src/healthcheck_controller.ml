open Ppx_yojson_conv_lib.Yojson_conv.Primitives

type healthcheck_response = {
  status: string;
  system_time: float
} [@@deriving yojson];;


let healthcheck_controller = [
  Dream.get "" (fun _ -> 
    let resp = { 
      status = "pass";
      system_time = Unix.time () 
    } in
    resp
    |> yojson_of_healthcheck_response
    |> Yojson.Safe.to_string
    |> Dream.json
  )
];;