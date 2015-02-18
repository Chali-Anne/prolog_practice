a:- c.
a:- d, f.

% Le point d'exclamation empêche le backtracking.
% Équivaut à dire : Si b, alors d. Sinon f.
b:- d,!,e.
b:- f.

% C'est apparemment normal d'avoir des erreurs : g,h,i et j ne sont pas définis.
e:- g, h.
e:- i, j.

c.
d.
f.