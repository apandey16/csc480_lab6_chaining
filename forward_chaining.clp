(deftemplate person
     (slot name)
     (slot parent)
     (slot gender))

   (deffacts initial-facts
     (person (name john) (parent none) (gender male))
     (person (name mary) (parent john) (gender female))
     (person (name susan) (parent mary) (gender female))
     (person (name tom) (parent susan) (gender male))
     (person (name sarah) (parent john) (gender female))
     (person (name david) (parent tom) (gender male))
     (person (name emily) (parent sarah) (gender female))
     (person (name jacob) (parent mary) (gender male))
     (person (name lily) (parent emily) (gender female))
     (person (name ethan) (parent susan) (gender male))
     (person (name jess) (parent sarah) (gender female)))

   (defrule find-ancestor
     (person (name ?x) (parent ?y))
     (person (name ?y) (parent ?z))
     =>
     (assert (person (name ?x) (parent ?z))))

   (defrule print-ancestor
     (person (name ?x) (parent ?z))
     =>
     (printout t ?x " is an ancestor of " ?z crlf))

   (defrule find-mother
     (person (name ?x) (parent ?y) (gender female))
     =>
     (assert (mother ?x ?y)))

   (defrule find-father
     (person (name ?x) (parent ?y) (gender male))
     =>
     (assert (father ?x ?y)))

   (defrule find-brother
     (person (name ?x) (parent ?z) (gender male))
     (person (name ?y) (parent ?z))
     (test (neq ?x ?y))
     =>
     (assert (brother ?x ?y)))

   (defrule find-sister
     (person (name ?x) (parent ?z) (gender female))
     (person (name ?y) (parent ?z))
     (test (neq ?x ?y))
     =>
     (assert (sister ?x ?y)))

    (defrule find-grandparent
      (person (name ?x) (parent ?y))
      (person (name ?y) (parent ?z))
      =>
      (assert (grandparent ?x ?z)))

    (defrule find-grandchild
      (person (name ?x) (parent ?z))
      (person (name ?z) (parent ?y))
      =>
      (assert (grandchild ?x ?y)))

    (defrule find-cousin
      (person (name ?x) (parent ?z1))
      (person (name ?y) (parent ?z2))
      (person (name ?z1) (parent ?p))
      (person (name ?z2) (parent ?p))
      (test (neq ?x ?y))
      =>
      (assert (cousin ?x ?y)))

    (defrule find-uncle
      (person (name ?x) (parent ?z))
      (person (name ?y) (parent ?z))
      (person (name ?y) (gender male))
      (test (neq ?x ?y))
      =>
      (assert (uncle ?x ?y)))

    (defrule find-aunt
      (person (name ?x) (parent ?z))
      (person (name ?y) (parent ?z))
      (person (name ?y) (gender female))
      (test (neq ?x ?y))
      =>
      (assert (aunt ?x ?y)))
