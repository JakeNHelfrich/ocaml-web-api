open Ppx_yojson_conv_lib.Yojson_conv.Primitives

type healthcheck_response = {
  status: string;
} [@@deriving yojson];;

let healthcheck_response_to_string hcr = 
  hcr
  |> yojson_of_healthcheck_response
  |> Yojson.Safe.to_string

let healthcheck_controller = [
  Dream.get "" (fun _ -> 
    let resp = { status = "pass" } in
    resp
    |> healthcheck_response_to_string
    |> Dream.json
  )
];;