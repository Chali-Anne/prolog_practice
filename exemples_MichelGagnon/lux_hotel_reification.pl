% Representation of luxury hotel
% using reification

% predicate instance(X,Class) is used to represent the fact
% that X pertains to class Class
% Precidate prop(P,I,V) is used to represent the fact
% that the value of property P for object I is V

instance(X,luxuryHotel):-
	instance(X,hotel),
	prop(hasRooms,X,Rooms),
	minQuantity(Rooms,4),
	allComfortable(Rooms),
	allHasView(Rooms),
	prop(hasRestaurants,X,Restaurants),
	minQuantity(Restaurants,2),
	allHasVegetarianMenu(Restaurants),
	allHasMeatMenu(Restaurants).

minQuantity(List,N):-
	length(List,Length),
	Length >= N.

allComfortable([]).
allComfortable([Room|Others]):-
	prop(comfortable,Room,true),
	allComfortable(Others).

allHasView([]).
allHasView([Room|Others]):-
	prop(hasView,Room,true),
	allHasView(Others).
	
allHasVegetarianMenu([]).
allHasVegetarianMenu([Restaurant|Others]):-
	prop(hasVegetarianMenu,Restaurant,true),
	allHasVegetarianMenu(Others).
	
allHasMeatMenu([]).
allHasMeatMenu([Restaurant|Others]):-
	prop(hasMeatMenu,Restaurant,true),
	allHasMeatMenu(Others).

prop(hasVegetarianMenu,Restaurant,true):-
	prop(hasMenu,Restaurant,Menu),
	member(MenuItem,Menu),
	prop(hasIngredients,MenuItem,Ingredients),
	allVegetarianIngredients(Ingredients).

allVegetarianIngredients([]).
allVegetarianIngredients([Ingredient|Others]):-
	\+ instance(Ingredient,meat),
	allVegetarianIngredients(Others).

prop(hasMeatMenu,Restaurant,true):-
	prop(hasMenu,Restaurant,Menu),
	member(MenuItem,Menu),
	prop(hasIngredients,MenuItem,Ingredients),
	member(I,Ingredients),
	instance(I,meat).


% An example of luxury hotel

instance(alpha,hotel).
prop(hasRooms,alpha,[room1,room2,room3,room4]).
prop(hasRestaurants,alpha,[rest1,rest2]).

prop(hasView,room1,true).
prop(hasView,room2,true).
prop(hasView,room3,true).
prop(hasView,room4,true).

prop(comfortable,room1,true).
prop(comfortable,room2,true).
prop(comfortable,room3,true).
prop(comfortable,room4,true).

prop(hasMenu,rest1,[pizzaMargarita,cacciatore_chicken]).
prop(hasMenu,rest2,[vegetarian_penne,strogonoff]).

prop(hasIngredients,pizzaMargarita,[dough,cheese,tomato]).
prop(hasIngredients,cacciatore_chicken,[chicken,tomato]).
prop(hasIngredients,vegetarian_penne,[pasta,tomato,escarole,beans,tomato,onion]).
prop(hasIngredients,strogonoff,[beef,margarine,broth,cheese]).

instance(chicken,meat).
instance(beef,meat).
