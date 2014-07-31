;; Test #3

;; Anaphora is "that"
;; Antecedent is a verb

;; Expected result:
;; Acceptance

;; Connection between two clauses

(ListLink
    (AnchorNode "CurrentResolution")
    (WordInstanceNode "anaphor")
    (WordInstanceNode "antecedent")
)
(ListLink
    (AnchorNode "CurrentPronoun")
    (WordInstanceNode "anaphor")
)
(ListLink
    (AnchorNode "CurrentProposal")
    (WordInstanceNode "antecedent")
)
(LemmaLink
    (WordInstanceNode "anaphor")
    (WordNode "that")
)

;; filter tests

(InheritanceLink
    (WordInstanceNode "antecedent")
    (DefinedLinguisticConceptNode ".v")
)
