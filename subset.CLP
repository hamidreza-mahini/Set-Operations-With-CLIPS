;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
(
	deftemplate SET
	(multislot Atr)
)
;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
(
	deftemplate SUB-SET
	(multislot Atr)
)
;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
(
	deffacts Initial-Facts
	(SET (Atr 1 2 3 4 5))
)
;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
(
	defglobal ?*count* = 0
)
;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
(
	defrule FindSubSet1 
		(SET (Atr $?s1 $?s2 $?s3))
		=>
		(assert
 			(SUB-SET (Atr ?s1))
			(SET (Atr $?s2 $?s3)))
)
;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
(
	defrule FindSubSet2
		(SET (Atr $?s1 $?s2 $?s3))
		=>
		(assert 
			(SUB-SET (Atr $?s2))
			(SET (Atr $?s1 $?s3)))
)
;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
(
	defrule FindSubSet3
			(SET (Atr $?s1 $?s2 $?s3))
			=>
			(assert 
				(SUB-SET (Atr $?s1 $?s3))
				(SET (Atr $?s2)))
)

;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
(
	defrule printsubset
		(SUB-SET (Atr $?s))
		=>
		(bind ?*count* (+ ?*count* 1))
		(printout t ?*count* " >>>>>> " ?s crlf)
)
;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
