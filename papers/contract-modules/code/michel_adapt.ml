open Michelsym
open Tezos_micheline

open Core
let rec print_node n =
  match n with
  | Micheline.Int (_loc, i)->
    print_string "int "; print_string (Z.to_string i^" ")
  | Micheline.Bytes (_loc, _b) ->
    print_string "bytes "
  | Micheline.String (_loc, s) ->
    print_string ("string \""^s^"\"")
  | Micheline.Prim (_loc, s, ns, _) ->
    (print_string ("prim \""^s^"\"(") ; List.iter ns ~f:print_node ;
    print_string (") "); Out_channel.newline stdout)
  | Micheline.Seq (_loc, ns) ->
    (print_string ("seq (") ; List.iter ns ~f:print_node ; print_string (") "))


(* TODO: annotations... *)

type ast =
  | Parameter of Michelsym.ty
  | Storage of Michelsym.ty
  | Code of Michelsym.instr list

exception Mismatch of string

let conv_int_node n =
  match n with
  | Micheline.Int (_loc, i) ->
    i
  | _ ->
    raise (Mismatch "conv_int_node")

let rec conv_type_node n =
  match n with
  | Micheline.Prim (_loc, p, ns, _annot) ->
    (let ts = List.map ~f:conv_type_node ns in
      match p with
     | "bool" -> Michelsym.TBool
     | "int" -> Michelsym.TInt
     | "nat" -> Michelsym.TNat
     | "string" -> Michelsym.TString
     | "unit" -> Michelsym.TUnit
     | "address" -> Michelsym.TAddress
     | "mutez" -> Michelsym.TMutez
     | "timestamp" -> Michelsym.TTimestamp
     | "operation" -> Michelsym.TOperation
     | "key" -> Michelsym.TKey
     | "key_hash" -> Michelsym.TKey_Hash
     | "signature" -> Michelsym.TSignature
     | "bytes" -> Michelsym.TBytes
     | "list" -> Michelsym.TList (List.hd_exn ts)
     | "option" -> Michelsym.TOption (List.hd_exn ts)
     | "set" -> Michelsym.TSet (List.hd_exn ts)
     | "contract" -> Michelsym.TContract (List.hd_exn ts)
     | "map" -> Michelsym.TMap (List.hd_exn ts, List.hd_exn (List.tl_exn ts))
     | "big_map" -> Michelsym.TMap (List.hd_exn ts, List.hd_exn (List.tl_exn ts))
     | "or" -> Michelsym.TOr (List.hd_exn ts, List.hd_exn (List.tl_exn ts))
     | "pair" -> Michelsym.TPair (List.hd_exn ts, List.hd_exn (List.tl_exn ts))
     (* more types; are types even represented in this way? *)
     | _ -> raise (Mismatch ("type node expected, prim "^p^" found"))
    )
  | _ ->
    raise (Mismatch "type node expected")

let conv_sval_node n t =
  match n with
  | Micheline.Int (_loc, ii) ->
    (match t with
     | Michelsym.TInt -> Michelsym.VInt (ii)
     | Michelsym.TNat -> Michelsym.VNat (ii)
     | Michelsym.TMutez -> Michelsym.VMutez (ii)
     | Michelsym.TTimestamp -> Michelsym.VTimestamp (ii)
     | _ -> raise (Mismatch "int given")
    )
  | Micheline.String (_loc, s) ->
    (match t with
     | Michelsym.TString -> Michelsym.VString s
     | Michelsym.TAddress -> Michelsym.VAddress s
     | Michelsym.TKey -> Michelsym.VKey s
     | Michelsym.TKey_Hash -> Michelsym.VKey_Hash s
     | Michelsym.TSignature -> Michelsym.VSignature s
     | _ -> raise (Mismatch "string given")
    )
  | Micheline.Bytes (_loc, b) ->
    (match t with
     | Michelsym.TBytes -> Michelsym.VBytes (Bytes.to_string b)
     | _ -> raise (Mismatch "bytes given")
    )
  | Micheline.Prim (_loc, p, _ns, _annot) ->
    (match t with
     | _ -> raise (Mismatch ("prim "^p^" given"))
    )
  | Micheline.Seq (_loc, _ns) ->
    (match t with
     | _ -> raise (Mismatch "seq given")
    )
  

let rec conv_toplevel_node n =
  match n with
  | Micheline.Int (_loc, _i) ->
    []
  | Micheline.String (_loc, _s) ->
    []
  | Micheline.Bytes (_loc, _b) ->
    []
  | Micheline.Prim (_loc, p, ns, _annot) ->
    (match p with
     | "parameter" -> [Parameter (conv_type_node (List.hd_exn ns))]
     | "storage" -> [Storage (conv_type_node (List.hd_exn ns))]
     | "code" -> [Code (conv_code_list ns)]
     | _ -> [])
  | Micheline.Seq (_loc, ns) ->
    List.concat_map ~f:conv_toplevel_node ns
and conv_toplevel nl =
  List.concat_map ~f:conv_toplevel_node nl
and conv_code_list ns =
  List.concat_map ~f:conv_code_node ns
and conv_code_node n =
  match n with 
  | Micheline.Int (_loc, _i) ->
    []
  | Micheline.String (_loc, _s) ->
    []
  | Micheline.Bytes (_loc, _b) ->
    []
  | Micheline.Prim (_loc, p, ns, _annot) ->
    (match p with
     | "IF" | "IF_LEFT" | "IF_CONS" | "IF_NONE" ->
       [Michelsym.COND (p, conv_code_node (List.hd_exn ns), conv_code_node (List.hd_exn (List.tl_exn ns)))]
     | "ITER" | "MAP" | "LOOP" -> 
       [Michelsym.LOOP (p, conv_code_node (List.hd_exn ns))]
     | "PUSH" ->
       let t = conv_type_node (List.hd_exn ns) in
       let s = conv_sval_node (List.hd_exn (List.tl_exn ns)) t in
       [Michelsym.PUSH s]
     | "CONTRACT" | "NIL" | "NONE" | "EMPTY_SET" ->
       let t = conv_type_node (List.hd_exn ns) in
       [Michelsym.T (p, t)]
     | "EMPTY_MAP" | "EMPTY_BIG_MAP" ->
       [Michelsym.T2 (p, conv_type_node (List.hd_exn ns), conv_type_node (List.hd_exn (List.tl_exn ns)))]
     | "DIP" ->
       (try
         let i = conv_int_node (List.hd_exn ns) in
         let inss = conv_code_node (List.hd_exn (List.tl_exn ns)) in
         [DIP (Z.to_int i, inss)]
        with
        | Mismatch _ ->
          let inss = conv_code_node (List.hd_exn ns) in
          [DIP (1, inss)]
       )
     | "DIG" | "DROP" ->
       (try 
          let i = conv_int_node (List.hd_exn ns) in
          [Michelsym.II (p, Z.to_int i)]
        with
        | _ ->
          [II (p, 1)]
       )
     | _ ->
       [Michelsym.I p]
    )
  | Micheline.Seq (_loc, ns) ->
    List.concat_map ~f:conv_code_node ns
