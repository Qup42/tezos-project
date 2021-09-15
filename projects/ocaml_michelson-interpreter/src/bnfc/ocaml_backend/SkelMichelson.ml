module SkelMichelson = struct

(* OCaml module generated by the BNF converter *)

open AbsMichelson

type result = string

let failure x = failwith "Undefined case." (* x discarded *)

let rec transStr (x : str) : result = match x with
    Str string -> failure x


and transHex (x : hex) : result = match x with
    Hex string -> failure x


and transProg (x : prog) : result = match x with
    Contract (typ0, typ, instrs) -> failure x
  | Code instrs -> failure x


and transInta (x : inta) : result = match x with
    IntPos integer -> failure x
  | IntNeg integer -> failure x


and transPairSeq (x : pairSeq) : result = match x with
    DPairSeq1 (data0, data) -> failure x
  | DPairSeq2 (data, pairseq) -> failure x


and transMapSeq (x : mapSeq) : result = match x with
    DMapSeq1 (data0, data) -> failure x
  | DMapSeq2 (data0, data, mapseq) -> failure x


and transData (x : data) : result = match x with
    DInt inta -> failure x
  | DStr str -> failure x
  | DByte hex -> failure x
  | DUnit  -> failure x
  | DTrue  -> failure x
  | DFalse  -> failure x
  | DPair2 pairseq -> failure x
  | DLeft data -> failure x
  | DRight data -> failure x
  | DSome data -> failure x
  | DNone  -> failure x
  | DBlock datas -> failure x
  | DMap mapseq -> failure x
  | DInstr instr -> failure x


and transInstr (x : instr) : result = match x with
    IBLOCK instrs -> failure x
  | IDROP  -> failure x
  | IDROP_N integer -> failure x
  | IDUP  -> failure x
  | IDUP_N integer -> failure x
  | ISWAP  -> failure x
  | IDIG_N integer -> failure x
  | IDUG_N integer -> failure x
  | IPUSH (typ, data) -> failure x
  | ISOME  -> failure x
  | INONE typ -> failure x
  | IUNIT  -> failure x
  | INEVER  -> failure x
  | IIF_NONE (instrs0, instrs) -> failure x
  | IPAIR  -> failure x
  | IPAIR_N integer -> failure x
  | ICAR  -> failure x
  | ICDR  -> failure x
  | IUNPAIR  -> failure x
  | IUNPAIR_N integer -> failure x
  | ILEFT typ -> failure x
  | IRIGHT typ -> failure x
  | IIF_LEFT (instrs0, instrs) -> failure x
  | INIL typ -> failure x
  | ICONS  -> failure x
  | IIF_CONS (instrs0, instrs) -> failure x
  | ISIZE  -> failure x
  | IEMPTY_SET ctyp -> failure x
  | IEMPTY_MAP (ctyp, typ) -> failure x
  | IEMPTY_BIG_MAP (ctyp, typ) -> failure x
  | IMAP instrs -> failure x
  | IITER instrs -> failure x
  | IMEM  -> failure x
  | IGET  -> failure x
  | IGET_N integer -> failure x
  | IUPDATE  -> failure x
  | IUPDATE_N integer -> failure x
  | IIF (instrs0, instrs) -> failure x
  | ILOOP instrs -> failure x
  | ILOOP_LEFT instrs -> failure x
  | ILAMBDA (typ0, typ, instrs) -> failure x
  | IEXEC  -> failure x
  | IAPPLY  -> failure x
  | IDIP instrs -> failure x
  | IDIP_N (integer, instrs) -> failure x
  | IFAILWITH  -> failure x
  | ICAST  -> failure x
  | IRENAME  -> failure x
  | ICONCAT  -> failure x
  | ISLICE  -> failure x
  | IPACK  -> failure x
  | IUNPACK typ -> failure x
  | IADD  -> failure x
  | ISUB  -> failure x
  | IMUL  -> failure x
  | IEDIC  -> failure x
  | IABS  -> failure x
  | ISNAT  -> failure x
  | IINT  -> failure x
  | INEG  -> failure x
  | ILSL  -> failure x
  | ILSR  -> failure x
  | IOR  -> failure x
  | IAND  -> failure x
  | IXOR  -> failure x
  | INOT  -> failure x
  | ICOMPARE  -> failure x
  | IEQ  -> failure x
  | INEQ  -> failure x
  | ILT  -> failure x
  | IGT  -> failure x
  | ILE  -> failure x
  | IGE  -> failure x
  | ISELF  -> failure x
  | ISELF_ADDRESS  -> failure x
  | ICONTRACT typ -> failure x
  | ITRANSFER_TOKENS  -> failure x
  | ISET_DELEGATE  -> failure x
  | ICREATE_CONTRACT instrs -> failure x
  | IIMPLICIT_ACCOUNT  -> failure x
  | IVOTING_POWER  -> failure x
  | INOW  -> failure x
  | ILEVEL  -> failure x
  | IAMOUNT  -> failure x
  | IBALANCE  -> failure x
  | ICHECK_SIGNATURE  -> failure x
  | IBLAKE2B  -> failure x
  | IKECCAK  -> failure x
  | ISHA3  -> failure x
  | ISHA256  -> failure x
  | ISHA512  -> failure x
  | IHASH_KEY  -> failure x
  | ISOURCE  -> failure x
  | ISENDER  -> failure x
  | IADDRESS  -> failure x
  | ICHAIN_ID  -> failure x
  | ITOTAL_VOTING_POWER  -> failure x
  | IPAIRING_CHECK  -> failure x
  | ISAPLING_EMPTY_STATE integer -> failure x
  | ISAPLING_VERIFY_UPDATE  -> failure x
  | ITICKET  -> failure x
  | IREAD_TICKET  -> failure x
  | ISPLIT_TICKET  -> failure x
  | IJOIN_TICKETS  -> failure x
  | IOPEN_CHEST  -> failure x


and transTypeSeq (x : typeSeq) : result = match x with
    TTypSeq1 (typ0, typ) -> failure x
  | TTypSeq2 (typ, typeseq) -> failure x


and transTyp (x : typ) : result = match x with
    TCtype ctyp -> failure x
  | TOption typ -> failure x
  | TList typ -> failure x
  | TSet ctyp -> failure x
  | TOperation  -> failure x
  | TContract typ -> failure x
  | TTicket ctyp -> failure x
  | TPair typeseq -> failure x
  | TOr (typ0, typ) -> failure x
  | TLambda (typ0, typ) -> failure x
  | TMap (ctyp, typ) -> failure x
  | TBig_map (ctyp, typ) -> failure x
  | TBls_g1  -> failure x
  | TBls_g2  -> failure x
  | TBls_fr  -> failure x
  | TSapling_transaction integer -> failure x
  | TSapling_state integer -> failure x
  | TChest  -> failure x
  | TChest_key  -> failure x


and transCTypeSeq (x : cTypeSeq) : result = match x with
    CTypSeq1 (ctyp0, ctyp) -> failure x
  | CTypSeq2 (ctyp, ctypeseq) -> failure x


and transCTyp (x : cTyp) : result = match x with
    CUnit  -> failure x
  | CNever  -> failure x
  | CBool  -> failure x
  | CInt  -> failure x
  | CNat  -> failure x
  | CString  -> failure x
  | CChain_id  -> failure x
  | CBytes  -> failure x
  | CMutez  -> failure x
  | CKey_hash  -> failure x
  | CKey  -> failure x
  | CSignature  -> failure x
  | CTimestamp  -> failure x
  | CAddress  -> failure x
  | COption ctyp -> failure x
  | COr (ctyp0, ctyp) -> failure x
  | CPair ctypeseq -> failure x



end
