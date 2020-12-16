open Parser

let pprint_tokens ppf = function
  | IDENT var        -> Fmt.pf ppf "ID(%s)@." var
  | INT i            -> Fmt.pf ppf "INT(%d)@." i
  | STRING str       -> Fmt.pf ppf "STRING(%s)@." str
  | TRUE             -> Fmt.pf ppf "TRUE@."
  | FALSE            -> Fmt.pf ppf "FALSE@."
  | LPAREN           -> Fmt.pf ppf "LPAREN@."
  | RPAREN           -> Fmt.pf ppf "RPAREN@."
  | LBRACKET         -> Fmt.pf ppf "LBRACKET@."
  | RBRACKET         -> Fmt.pf ppf "RBRACKET@."
  | INT_T            -> Fmt.pf ppf "INT_T@."
  | BOOL_T           -> Fmt.pf ppf "BOOL_T@."
  | BYTES_T          -> Fmt.pf ppf "BYTES_T@."
  | STRING_T         -> Fmt.pf ppf "STRING_T@."
  | MUTEZ_T          -> Fmt.pf ppf "MUTEZ_T@."
  | NAT_T            -> Fmt.pf ppf "NAT_T@."
  | UNIT_T           -> Fmt.pf ppf "UNIT_T@."
  | ADDRESS_T        -> Fmt.pf ppf "ADDRESS_T@."
  | CHAINID_T        -> Fmt.pf ppf "CHAINID_T@."
  | KEY_T            -> Fmt.pf ppf "KEY_T@."
  | KEYHASH_T        -> Fmt.pf ppf "KEYHASH_T@."
  | OP_T             -> Fmt.pf ppf "OP_T@."
  | SIG_T            -> Fmt.pf ppf "SIG_T@."
  | TIMESTAMP_T      -> Fmt.pf ppf "TIMESTAMP_T@."
  | LIST_T           -> Fmt.pf ppf "LIST_T@."
  | SET_T            -> Fmt.pf ppf "SET_T@."
  | OPTION_T         -> Fmt.pf ppf "OPTION_T@."
  | PAIR_T           -> Fmt.pf ppf "PAIR_T@."
  | LAMBDA_T         -> Fmt.pf ppf "LAMBDA_T@."
  | MAP_T            -> Fmt.pf ppf "MAP_T@."
  | CONTRACT_T       -> Fmt.pf ppf "CONTRACT_T@."
  | BIGMAP_T         -> Fmt.pf ppf "BIGMAP_T@."
  | LEFT             -> Fmt.pf ppf "LEFT@."
  | RIGHT            -> Fmt.pf ppf "RIGHT@."
  | SOME             -> Fmt.pf ppf "SOME@."
  | NONE             -> Fmt.pf ppf "NONE@."
  | CONS             -> Fmt.pf ppf "CONS@."
  | NIL              -> Fmt.pf ppf "NIL@."
  | ENTRYPOINT       -> Fmt.pf ppf "ENTRYPOINT@."
  | FORALL           -> Fmt.pf ppf "FORALL@."
  | EXISTS           -> Fmt.pf ppf "EXISTS@."
  | IF               -> Fmt.pf ppf "IF@."
  | ASSERT           -> Fmt.pf ppf "ASSERT@."
  | NTH              -> Fmt.pf ppf "NTH@."
  | SIZE             -> Fmt.pf ppf "SIZE@."
  | NOT              -> Fmt.pf ppf "NOT@."
  | ABS              -> Fmt.pf ppf "ABS@."
  | NEG              -> Fmt.pf ppf "NEG@."
  | ADD              -> Fmt.pf ppf "ADD@."
  | SUB              -> Fmt.pf ppf "SUB@."
  | MUL              -> Fmt.pf ppf "MUL@."
  | DIV              -> Fmt.pf ppf "DIV@."
  | MOD              -> Fmt.pf ppf "MOD@."
  | OR               -> Fmt.pf ppf "OR@."
  | AND              -> Fmt.pf ppf "AND@."
  | EQ               -> Fmt.pf ppf "EQ@."
  | NEQ              -> Fmt.pf ppf "NEQ@."
  | LT               -> Fmt.pf ppf "LT@."
  | GT               -> Fmt.pf ppf "GT@."
  | LE               -> Fmt.pf ppf "LE@."
  | GE               -> Fmt.pf ppf "GE@."
  | COLON            -> Fmt.pf ppf "COLON@."
  | PERCENT          -> Fmt.pf ppf "PERCENT@."
  | WILDCARD         -> Fmt.pf ppf "WILDCARD@."
  | EOF              -> Fmt.pf ppf "EOF@."
