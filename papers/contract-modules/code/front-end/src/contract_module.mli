
type ty = [
  | `Int_t
  | `Bool_t
  | `Bytes_t
  | `String_t
  | `Mutez_t
  | `Nat_t
  | `Address_t
  | `ChainID_t
  | `Key_t
  | `KeyHash_t
  | `Operation_t
  | `Signature_t
  | `Timestamp_t
  | `Unit_t
  | `List_t of ty
  | `Set_t of ty
  | `Option_t of ty
  | `Or_t of ty * ty
  | `Pair_t of ty * ty
  | `Lambda_t of ty * ty
  | `Map_t of ty * ty
  | `Contract_t of ty
  | `BigMap_t of ty * ty
  ]    

type var_decl = string * ty

type pattern = [
  | `Wildcard
  | `Ident of var_decl
  | `Pair of pattern * pattern
  | `Left of pattern
  | `Right of pattern
  | `None
  | `Some of pattern
  | `Cons of pattern * pattern
  | `Nil
  ]

type error_list = [
  | `Nill
  | `Cons of string * error_list
  ]

type entrypoint_name = [
   | `Entrypoint of string
   | `Paid_entrypoint of string
   ]

type entrypoint_decl = {entrypoint : string * pattern; error : error_list}

type entrypoint_list = [
  | `Nill
  | `Cons of entrypoint_decl * entrypoint_list
  ]

type contract_module_ast = {contract : string; body : entrypoint_list}


