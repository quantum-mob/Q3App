(* -*- mode:math -*- *)

BeginPackage[ "Q3`Einstein`",
  { "Q3`Fock`", "Q3`Wigner`", "Q3`Quisso`", "Q3`Pauli`",
    "Q3`Cauchy`", "Q3`" }
 ]

Q3Clear[];

Begin["`Private`"]
`Version = StringJoin[
  $Input, " v",
  StringSplit["$Revision: 1.4 $"][[2]], " (",
  StringSplit["$Date: 2021-03-08 02:31:34+09 $"][[2]], ") ",
  "Mahn-Soo Choi"
 ];
End[]

{ JordanWignerTransform };


Begin["`Private`"]

$symbs = Unprotect[ Multiply, MultiplyExp ]

JordanWignerTransform::usage = "JordanWignerTransform[]"

JordanWignerTransform[expr_, qq:{__?QubitQ} -> ff:{__?FermionQ}] :=
  Garner @ Elaborate[ expr /. JordanWignerTransform[qq -> ff] ]

JordanWignerTransform[expr_, ff:{__?FermionQ} -> qq:{__?QubitQ}] :=
  Garner @ Elaborate[ expr /. JordanWignerTransform[ff -> qq] ]

JordanWignerTransform[qq:{__?QubitQ} -> ff:{__?FermionQ}] := Module[
  { rr = Through[Construct[qq, 4]],
    zz = Through[Construct[qq, 3]],
    cc, pp, rules },
  pp = FoldList[Multiply, 1, Parity /@ Most[ff]];
  cc = Multiply @@@ Transpose @ {pp, ff};
  rules = Thread[rr -> cc];
  Join[ Dagger[rules], rules, Thread[zz -> Map[Parity, ff]] ]
 ] /; Length[qq] == Length[ff]

JordanWignerTransform[ff:{__?FermionQ} -> qq:{__?QubitQ}] := Module[
  { rr = Through[Construct[qq, 4]],
    zz = Through[Construct[qq, 3]],
    cc, pp },
  pp = FoldList[Multiply, 1, Most @ zz];
  cc = Multiply @@@ Transpose @ {pp, rr};
  Thread[ff -> cc]
 ] /; Length[qq] == Length[ff]


(**** <fallbacks> ****)

MultiplyExp /:
HoldPattern @ Elaborate[ MultiplyExp[expr_] ] := MultiplyExp[expr]

(**** </fallbacks> ****)

Protect[ Evaluate @ $symbs ]

End[]


Q3Protect[]


EndPackage[]
