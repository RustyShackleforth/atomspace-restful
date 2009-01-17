scm
;
; utilities.scm
;
; Miscellaneous handy utilities.
;
; Copyright (c) 2008 Linas Vepstas <linasvepstas@gmail.com>
;
;
(define (stv mean conf) (cog-new-stv mean conf))

; -----------------------------------------------------------------------
; analogs of car, cdr, etc. but for atoms.
(define (gar x) (if (cog-atom? x) (car (cog-outgoing-set x)) (car x)))
(define (gdr x) (if (cog-atom? x) (cdr (cog-outgoing-set x)) (cdr x)))
(define (gadr x) (if (cog-atom? x) (cadr (cog-outgoing-set x)) (cadr x)))
(define (gaddr x) (if (cog-atom? x) (caddr (cog-outgoing-set x)) (caddr x)))

; A more agressive way of doing the above:
; (define car (let ((oldcar car)) (lambda (x) (if (cog-atom? x) (oldcar (cog-outgoing-set x)) (oldcar x)))))
; But this would probably lead to various painful debugging situations.

; -----------------------------------------------------------------------
; for-each-except 
; standard for-each loop, except that anything matchin "except" is skipped
(define (for-each-except exclude proc lst)
	(define (loop items)
		(cond
			((null? items) #f)
			((eq? exclude (car items))
				(loop (cdr items))
			)
			(else
				(proc (car items))
				(loop (cdr items))
			)
		)
	)
	(loop lst)
)

; -----------------------------------------------------------------------
;
; cog-get-atoms atom-type
; Return a list of all atoms in the atomspace that are of type 'atom-type'
;
; Example usage:
; (display (cog-get-atoms 'ConceptNode))
; will return and display all atoms of type 'ConceptNode
;
(define (cog-get-atoms atom-type)
	(let ((lst '()))
		(define (mklist atom)
			(set! lst (cons atom lst))
			#f
		)
		(cog-map-type mklist atom-type)
		lst
	)
)

; -----------------------------------------------------------------------
;
; cog-count-atoms atom-type
; Return a count of the number of atoms of the given type 'atom-type'
;
; Example usage:
; (display (cog-count-atoms 'ConceptNode))
; will display a count of all atoms of type 'ConceptNode
;
(define (cog-count-atoms atom-type)
	(let ((cnt 0))
		(define (inc atom)
			(set! cnt (+ cnt 1))
			#f
		)
		(cog-map-type inc atom-type)
		cnt
	)
)

; -----------------------------------------------------------------------
; 
; cog-report-counts
; Print a report of the number of atoms of each type currently in the
; atomspace. Prints counts only for types with non-zero atom counts.
;
(define (cog-report-counts)
	(let ((tlist (cog-get-types)))
		(define (rpt type)
			(let ((cnt (cog-count-atoms type)))
				(if (not (= 0 cnt))
					(let ()
						(display type)
						(display " ")
						(display cnt)
						(newline)
					)
				)
			)
		)
		(for-each rpt tlist)
	)
)
; -----------------------------------------------------------------------
; cog-get-partner pair atom
;
; If 'pare' is a link containing two atoms, and 'wrd' is one of the
; two atoms, then this returns the other atom in the link.
;
(define (cog-get-partner pare atom)
	(let ((plist (cog-outgoing-set pare)))
		(if (equal? atom (car plist))
			(cadr plist)
			(car plist)
		)
	)
)

; -----------------------------------------------------------------------
; cog-pred-get-partner pred atom
;
; Get the partner to the atom in the opencog predicate.
; An opencog predicate is assumed to be structured as follows:
;
;    EvaluationLink
;        SomeAtom  "relation-name"
;        ListLink
;            AnotherAtom  "some atom"
;            AnotherAtom  "some other atom"
;
; Assuming this structure, then, given the top-level link, and one
; of the two atoms in the ListLink, then return the other atom in the
; listLink.
;
(define (cog-pred-get-partner rel atom)
	; The 'car' appears here because 'cog-filter-outgoing' is returning
	; a list, and we want just one atom (the only one in the list)
	(cog-get-partner (car (cog-filter-outgoing 'ListLink rel)) atom)
)

; -----------------------------------------------------------------------
; cog-filter-map atom-type proc atom-list
;
; Apply the proceedure 'proc' to every atom of 'atom-list' that is
; of type 'atom-type'. Application halts if proc returns any value 
; other than #f. Return the last value returned by proc; that is,
; return #f if proc always returned #f, otherwise return the value
; that halted the application.
;
; Exmaple usage:
; (cog-filter-map 'ConceptNode display (list (cog-new-node 'ConceptNode "hello")))
; 
; See also: cgw-filter-atom-type, which does the same thing, but for wires.
;
(define (cog-filter-map atom-type proc atom-list) 
	(define rc #f)
	(cond 
		((null? atom-list) #f)
		((eq? (cog-type (car atom-list)) atom-type) 
			(set! rc (proc (car atom-list))) 
			(if (eq? #f rc) 
				(cog-filter-map atom-type proc (cdr atom-list))
				rc
			)
		) 
		(else (cog-filter-map atom-type proc (cdr atom-list))
		)
	)
)

; Given a list of atoms, return a list of atoms that are of 'atom-type'
(define (cog-filter atom-type atom-list) 
	(define (is-type? atom) (eq? atom-type (cog-type atom)))
	(filter is-type? atom-list)
)

; Given an atom, return a list of atoms from its incoming set that 
; are of type 'atom-type'
(define (cog-filter-incoming atom-type atom)
	(cog-filter atom-type (cog-incoming-set atom))
)

; Given an atom, return a list of atoms from its outgoing set that 
; are of type 'atom-type'
(define (cog-filter-outgoing atom-type atom)
	(cog-filter atom-type (cog-outgoing-set atom))
)

; -----------------------------------------------------------------------
;
; cog-chase-link link-type endpoint-type anchor
;
; Starting at the atom 'anchor', chase its incoming links of
; 'link-type', and return a list of all of the 'node-type' in
; those links.
;
; It is presumed that 'anchor' points to some atom (typically a node),
; and that it has many links in its incoming set. So, loop over all of
; the links of 'link-type' in this set. They presumably link to all 
; sorts of things. Find all of the things that are of 'endpoint-type'.
; Return a list of all of these.
;
; See also: cgw-follow-link, which does the same thing, but for wires.
;
(define (cog-chase-link link-type endpoint-type anchor)
	(let ((lst '()))
		(define (mklist inst)
			(set! lst (cons inst lst))
			#f
		)
		(cog-map-chase-link link-type endpoint-type '() '() mklist anchor)
		lst
	)
)

; cog-map-chase-link link-type endpoint-type dbg-lmsg dbg-emsg proc anchor
;
; Chase 'link-type' to 'endpoint-type' and apply proc to what is found there.
;
; It is presumed that 'anchor' points to some atom (typically a node),
; and that it has many links in its incoming set. So, loop over all of
; the links of 'link-type' in this set. They presumably link to all 
; sorts of things. Find all of the things that are of 'endpoint-type'
; and then call 'proc' on each of these endpoints. Optionally, print
; some debugging msgs.
;
; The link-chasing halts if proc returns any value other than #f.
; Returns the last value returned by proc, i.e. #f, or the value that
; halted the iteration.
;
; Example usage:
; (cog-map-chase-link 'ReferenceLink 'WordNode "" "" proc word-inst)
; Given a 'word-inst', this will chase all ReferenceLink's to all 
; WordNode's, and then will call 'proc' on these WordNodes.
;
(define (cog-map-chase-link link-type endpoint-type dbg-lmsg dbg-emsg proc anchor)
	(define (get-endpoint w)
		(if (not (eq? '() dbg-emsg)) (display dbg-emsg))
		; cog-filter-map returns the return value from proc, we pass it on
		; in turn, so make sure this is last statement
		(cog-filter-map endpoint-type proc (cog-outgoing-set w))
	)
	(if (not (eq? '() dbg-lmsg)) (display dbg-lmsg))
	; cog-filter-map returns the return value from proc, we pass it on
	; in turn, so make sure this is last statement
	(cog-filter-map link-type get-endpoint (cog-incoming-set anchor))
)

; -----------------------------------------------------------------------
;
; cog-map-apply-link link-type endpoint-type proc anchor
;
; Similar to cog-map-chase-link, except that the proc is not called
; on the endpoint, but rather on the link leading to the endpoint.
;
(define (cog-map-apply-link link-type endpoint-type proc anchor)
	(define (get-link l)
		(define (apply-link e)
			(proc l)
		)
		(cog-filter-map endpoint-type apply-link (cog-outgoing-set l))
	)
	(cog-filter-map link-type get-link (cog-incoming-set anchor))
)

;
; cog-get-link link-type endpoint-type anchor
;
; Return a list of links, of type 'link-type', which contain some
; atom of type 'endpoint-type', and also specifically contain the 
; atom 'anchor'.
;
; Thus, for example, suppose the atom-space contains a link of the
; form (ReferenceLink (ConcpetNode "asdf") (WordNode "pqrs"))
; Then, the call 
;    (cog-get-link 'ReferenceLink 'ConcpetNode (WordNode "pqrs"))
; will return that link. Note that "endpoint-type" need not occur
; in the first position in the link; it can appear anywhere.
;
(define (cog-get-link link-type endpoint-type anchor)
	(let ((lst '()))
		(define (mklist inst)
			(set! lst (cons inst lst))
			#f
		)
		(cog-map-apply-link link-type endpoint-type mklist anchor)
		lst
	)
)

; ---------------------------------------------------------------------
; Return a list of predicates, of the given type, that an instance 
; participates in.  That is, given a "predicate" of the form:
;
;    EvaluationLink
;       SomeAtom
;       ListLink
;           AnotherAtom "abc"
;           AnotherAtom "def"
;
; then given the instance (AnotherAtom "def") and pred-type 'SomeAtom
; then return a list of all of the EvalutaionLink's in which this
; instance appears.
;
(define (cog-get-pred inst pred-type)
	(concatenate!
		(append!
			(map
				(lambda (lnk) (cog-get-link 'EvaluationLink pred-type lnk))
				(append! (cog-filter-incoming 'ListLink inst)) ;; append removes null's
			)
		)
	)
)

; -----------------------------------------------------------------------
; Given a reference structure, return the referenced list entries.
; That is, given a structure of the form
;
;    ReferenceLink
;        SomeAtom
;        ListLink
;           AnotherAtom
;           AnotherAtom
;           ...
;
; Then, given, as input, "SomeAtom", this returns a list of the "OtherAtom"
;
; XXX! Caution/error! This implictly assumes that there is only one 
; such ReferenceLink in the system, total. This is wrong !!!
;
(define (cog-get-reference refptr)
   (let ((lst (cog-chase-link 'ReferenceLink 'ListLink refptr)))
		(if (null? lst)
			'()
   		(cog-outgoing-set (car lst))
		)
	)
)

; -----------------------------------------------------------------------
; exit scheme shell, exit opencog shell.
.
exit
