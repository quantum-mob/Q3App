(* -*- mode:math -*- *)
(* Mahn-Soo Choi *)
(* $Date: 2021-03-01 22:33:19+09 $ *)
(* $Revision: 1.3 $ *)

If[ $VersionNumber < 12,
  Version::old = "Q3 requires Mathematica 12 or later.";
  Message[Version::old];
 ]

Get["Q3`Q3`"] (* NOT Get["Q3`"] *)
Get["Q3`Cauchy`"]
Get["Q3`Pauli`"]
Get["Q3`Quisso`"]
Get["Q3`Fock`"]
Get["Q3`Wigner`"]
Get["Q3`Dicke`"]
Get["Q3`Einstein`"]

