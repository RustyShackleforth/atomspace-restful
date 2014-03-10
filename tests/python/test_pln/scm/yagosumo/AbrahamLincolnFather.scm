(EquivalenceLink (av 0 0 0) (stv 0.900000 0.111111)
  (EvaluationLink (av 0 0 0) (stv 1.000000 0.000000)
    (PredicateNode "daughter" (av 0 0 0) (stv 0.100000 0.111111))
    (ListLink (av 0 0 0) (stv 1.000000 0.000000)
      (VariableNode "?CHILD" (av 0 0 0) (stv 1.000000 0.000000))
      (VariableNode "?PARENT" (av 0 0 0) (stv 1.000000 0.000000))
    )
  )
  (AndLink (av 0 0 0) (stv 1.000000 0.000000)
    (InheritanceLink (av 0 0 0) (stv 1.000000 0.000000)
      (VariableNode "?CHILD" (av 0 0 0) (stv 1.000000 0.000000))
      (ConceptNode "Female" (av 0 0 0) (stv 0.010000 0.555556))
    )
    (EvaluationLink (av 0 0 0) (stv 1.000000 0.000000)
      (PredicateNode "parent" (av 0 0 0) (stv 0.100000 0.111111))
      (ListLink (av 0 0 0) (stv 1.000000 0.000000)
        (VariableNode "?PARENT" (av 0 0 0) (stv 1.000000 0.000000))
        (VariableNode "?CHILD" (av 0 0 0) (stv 1.000000 0.000000))
      )
    )
  )
)
(EquivalenceLink (av 0 0 0) (stv 0.900000 0.111111)
  (AndLink (av 0 0 0) (stv 1.000000 0.000000)
    (EvaluationLink (av 0 0 0) (stv 1.000000 0.000000)
      (PredicateNode "parent" (av 0 0 0) (stv 0.100000 0.111111))
      (ListLink (av 0 0 0) (stv 1.000000 0.000000)
        (VariableNode "?MOTHER" (av 0 0 0) (stv 1.000000 0.000000))
        (VariableNode "?CHILD" (av 0 0 0) (stv 1.000000 0.000000))
      )
    )
    (InheritanceLink (av 0 0 0) (stv 1.000000 0.000000)
      (VariableNode "?MOTHER" (av 0 0 0) (stv 1.000000 0.000000))
      (ConceptNode "Female" (av 0 0 0) (stv 0.010000 0.555556))
    )
  )
  (EvaluationLink (av 0 0 0) (stv 1.000000 0.000000)
    (PredicateNode "mother" (av 0 0 0) (stv 0.100000 0.111111))
    (ListLink (av 0 0 0) (stv 1.000000 0.000000)
      (VariableNode "?CHILD" (av 0 0 0) (stv 1.000000 0.000000))
      (VariableNode "?FATHER" (av 0 0 0) (stv 1.000000 0.000000))
    )
  )
)
(EquivalenceLink (av 0 0 0) (stv 0.900000 0.111111)
  (EvaluationLink (av 0 0 0) (stv 1.000000 0.000000)
    (PredicateNode "son" (av 0 0 0) (stv 0.100000 0.111111))
    (ListLink (av 0 0 0) (stv 1.000000 0.000000)
      (VariableNode "?CHILD" (av 0 0 0) (stv 1.000000 0.000000))
      (VariableNode "?PARENT" (av 0 0 0) (stv 1.000000 0.000000))
    )
  )
  (AndLink (av 0 0 0) (stv 1.000000 0.000000)
    (EvaluationLink (av 0 0 0) (stv 1.000000 0.000000)
      (PredicateNode "parent" (av 0 0 0) (stv 0.100000 0.111111))
      (ListLink (av 0 0 0) (stv 1.000000 0.000000)
        (VariableNode "?PARENT" (av 0 0 0) (stv 1.000000 0.000000))
        (VariableNode "?CHILD" (av 0 0 0) (stv 1.000000 0.000000))
      )
    )
    (InheritanceLink (av 0 0 0) (stv 1.000000 0.000000)
      (VariableNode "?CHILD" (av 0 0 0) (stv 1.000000 0.000000))
      (ConceptNode "Male" (av 0 0 0) (stv 0.010000 0.555556))
    )
  )
)
(EquivalenceLink (av 0 0 0) (stv 0.900000 0.111111)
  (AndLink (av 0 0 0) (stv 1.000000 0.000000)
    (EvaluationLink (av 0 0 0) (stv 1.000000 0.000000)
      (PredicateNode "parent" (av 0 0 0) (stv 0.100000 0.111111))
      (ListLink (av 0 0 0) (stv 1.000000 0.000000)
        (VariableNode "?FATHER" (av 0 0 0) (stv 1.000000 0.000000))
        (VariableNode "?CHILD" (av 0 0 0) (stv 1.000000 0.000000))
      )
    )
    (InheritanceLink (av 0 0 0) (stv 1.000000 0.000000)
      (VariableNode "?FATHER" (av 0 0 0) (stv 1.000000 0.000000))
      (ConceptNode "Male" (av 0 0 0) (stv 0.010000 0.555556))
    )
  )
  (EvaluationLink (av 0 0 0) (stv 1.000000 0.000000)
    (PredicateNode "father" (av 0 0 0) (stv 0.100000 0.111111))
    (ListLink (av 0 0 0) (stv 1.000000 0.000000)
      (VariableNode "?CHILD" (av 0 0 0) (stv 1.000000 0.000000))
      (VariableNode "?FATHER" (av 0 0 0) (stv 1.000000 0.000000))
    )
  )
)
(EvaluationLink (av 0 0 0) (stv 0.900000 0.111111)
  (PredicateNode "parent" (av 0 0 0) (stv 0.100000 0.111111))
  (ListLink (av 0 0 0) (stv 1.000000 0.000000)
    (ConceptNode "AbrahamLincoln" (av 0 0 0) (stv 0.010000 0.555556))
    (ConceptNode "NancyLincoln" (av 0 0 0) (stv 0.010000 0.555556))
  )
)
(EvaluationLink (av 0 0 0) (stv 0.900000 0.111111)
  (PredicateNode "parent" (av 0 0 0) (stv 0.100000 0.111111))
  (ListLink (av 0 0 0) (stv 1.000000 0.000000)
    (ConceptNode "AbrahamLincoln" (av 0 0 0) (stv 0.010000 0.555556))
    (ConceptNode "ThomasLincoln" (av 0 0 0) (stv 0.010000 0.555556))
  )
)
(InheritanceLink (av 0 0 0) (stv 0.900000 0.111111)
  (ConceptNode "NancyLincoln" (av 0 0 0) (stv 0.010000 0.555556))
  (ConceptNode "Female" (av 0 0 0) (stv 0.010000 0.555556))
)
(InheritanceLink (av 0 0 0) (stv 0.900000 0.111111)
  (ConceptNode "Male" (av 0 0 0) (stv 0.010000 0.555556))
  (ConceptNode "Human" (av 0 0 0) (stv 0.010000 0.555556))
)
(InheritanceLink (av 0 0 0) (stv 0.900000 0.111111)
  (ConceptNode "Female" (av 0 0 0) (stv 0.010000 0.555556))
  (ConceptNode "Human" (av 0 0 0) (stv 0.010000 0.555556))
)
(InheritanceLink (av 0 0 0) (stv 0.900000 0.111111)
  (ConceptNode "Human" (av 0 0 0) (stv 0.010000 0.555556))
  (ConceptNode "Organism" (av 0 0 0) (stv 0.010000 0.555556))
)
(InheritanceLink (av 0 0 0) (stv 0.900000 0.111111)
  (ConceptNode "AbrahamLincoln" (av 0 0 0) (stv 0.010000 0.555556))
  (ConceptNode "Male" (av 0 0 0) (stv 0.010000 0.555556))
)
(InheritanceLink (av 0 0 0) (stv 0.900000 0.111111)
  (ConceptNode "ThomasLincoln" (av 0 0 0) (stv 0.010000 0.555556))
  (ConceptNode "Male" (av 0 0 0) (stv 0.010000 0.555556))
)


(EvaluationLink 
    (PredicateNode "query")
    (ListLink
        (EvaluationLink
          (PredicateNode "father" (av 0 0 0) (stv 0.100000 0.111111))
          (ListLink (av 0 0 0) (stv 1.000000 0.000000)
            (ConceptNode "AbrahamLincoln" (av 0 0 0) (stv 0.010000 0.555556))
            (VariableNode "?ABES_FATHER" (av 0 0 0) (stv 0.010000 0.555556))
          )
        )
    )
)
(EvaluationLink
    (PredicateNode "rules")
    (ListLink
        (ConceptNode "SymmetricModusPonensRule (EquivalenceLink VariableNode -> VariableNode)")
    )
)
