% Facts
   parent(john, mary).
   parent(mary, susan).
   parent(susan, tom).
   male(john).
   female(mary).
   female(susan).
   male(tom).
   parent(tom, alice). 
   female(alice).
   parent(john, mike).
   parent(mary, lisa).
   parent(susan, emily).
   male(mike).
   female(lisa).

   % Rules
   ancestor(X, Y) :- parent(X, Y).
   ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

   mother(X, Y) :- parent(X, Y), female(X).
   father(X, Y) :- parent(X, Y), male(X).
   brother(X, Y) :- parent(Z, X), parent(Z, Y), male(X), X \== Y.
   sister(X, Y) :- parent(Z, X), parent(Z, Y), female(X), X \== Y.
   grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
   grandchild(X, Y) :- grandparent(Y, X).
   cousin(X, Y) :- parent(Z, X), parent(W, Y), sibling(Z, W).
   sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \== Y.

   grandmother(X, Y) :- grandparent(X, Y), female(X).
   grandfather(X, Y) :- grandparent(X, Y), male(X).
   uncle(X, Y) :- brother(X, Z), parent(Z, Y).
   aunt(X, Y) :- sister(X, Z), parent(Z, Y).
   second_cousin(X, Y) :- parent(A, X), parent(B, Y), cousin(A, B).
   nephew(X, Y) :- male(X), sibling(Z, Y), parent(Z, X).
   niece(X, Y) :- female(X), sibling(Z, Y), parent(Z, X).
   great_grandparent(X, Y) :- parent(X, A), grandparent(A, Y).
   great_grandchild(X, Y) :- great_grandparent(Y, X).
   half_sibling(X, Y) :- parent(A, X), parent(B, Y), not(sibling(X, Y)), A \== B.