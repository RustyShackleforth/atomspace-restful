(define human (ConceptNode "Human" (stv 0.01 1)))
(define socrates (ConceptNode "Socrates" (stv 0.01 1)))
(define mortal (ConceptNode "Mortal" (stv 0.01 1)))

(EvaluationLink (PredicateNode "inputs") 
	(ListLink 
		(ImplicationLink (av 0 0 0) (stv 0.900000 0.111111)
			(InheritanceLink (stv 0.1 0.9)
				(VariableNode "?X" (av 0 0 0) (stv 1.000000 0.000000))
				(ConceptNode "Living" (av 0 0 0) (stv 0.010000 0.555556))
			)
			(InheritanceLink (av 0 0 0) (stv 0.1 0.9)
				(VariableNode "?X" (av 0 0 0) (stv 1.000000 0.000000))
				(ConceptNode "Organism" (av 0 0 0) (stv 0.010000 0.555556))
			)
		)		
	)
)
(EvaluationLink (PredicateNode "rules") 
	(ListLink 
		(ConceptNode "InversionRule<ImplicationLink>")
	)
)
(EvaluationLink (PredicateNode "forwardSteps")
	(ListLink
		(NumberNode "1")
	)
)

(EvaluationLink (PredicateNode "outputs") 
	(ListLink 
		(ImplicationLink (av 0 0 0) (stv 0.900000 0.111111)
			(InheritanceLink (stv 0.1 0.9)
				(VariableNode "?X" (av 0 0 0) (stv 1.000000 0.000000))
				(ConceptNode "Living" (av 0 0 0) (stv 0.010000 0.555556))
			)
			(InheritanceLink (av 0 0 0) (stv 0.1 0.9)
				(VariableNode "?X" (av 0 0 0) (stv 1.000000 0.000000))
				(ConceptNode "Organism" (av 0 0 0) (stv 0.010000 0.555556))
			)
		)
		(ImplicationLink (av 0 0 0) (stv 1.000000 0.000000)
			(InheritanceLink (av 0 0 0) (stv 1.000000 0.000000)
				(VariableNode "?X" (av 0 0 0) (stv 1.000000 0.000000))
				(ConceptNode "Organism" (av 0 0 0) (stv 0.010000 0.555556))
			)
			(InheritanceLink (av 0 0 0) (stv 1.000000 0.000000)
				(VariableNode "?X" (av 0 0 0) (stv 1.000000 0.000000))
				(ConceptNode "Living" (av 0 0 0) (stv 0.010000 0.555556))
			)
		)
	)
)
