% Representation of a luxury hotel
% Uses the built-in predicate forall(Condition,Goal)

luxuryHotel(Hotel):-
	hotel(Hotel),
	hotelHasRooms(Hotel,Rooms),
	minQuantity(Rooms,4),
	forall(member(R,Rooms),comfortable(R)),
	forall(member(R,Rooms),hasView(R)),
	hotelHasRestaurants(Hotel,Restaurants),
	minQuantity(Restaurants,2),
	forall(member(R,Restaurants),hasVegetarianMenu(R)),
	forall(member(R,Restaurants),hasMeatMenu(R)).

minQuantity(List,N):-
	length(List,Length),
	Length >= N.


hasVegetarianMenu(Restaurant):-
	menu(Restaurant,Menu),
	member(MenuItem,Menu),
	ingredients(MenuItem,Ingredients),
	forall(member(I,Ingredients),\+ meat(I)).

hasMeatMenu(Restaurant):-
	menu(Restaurant,Menu),
	member(MenuItem,Menu),
	ingredients(MenuItem,Ingredients),
	member(I,Ingredients),
	meat(I).


% An example of luxury hotel
hotel(alpha).
hotelHasRooms(alpha,[room1,room2,room3,room4]).

hotelHasRestaurants(alpha,[rest1,rest2]).

hasView(room1).
hasView(room2).
hasView(room3).
hasView(room4).

comfortable(room1).
comfortable(room2).
comfortable(room3).
comfortable(room4).

menu(rest1,[pizzaMargarita,cacciatore_chicken]).
menu(rest2,[vegetarian_penne,strogonoff]).
	
ingredients(pizzaMargarita,[dough,cheese,tomato]).
ingredients(cacciatore_chicken,[chicken,tomato]).
ingredients(vegetarian_penne,[pasta,tomato,escarole,beans,tomato,onion]).
ingredients(strogonoff,[beef,margarine,broth,cheese]).

meat(chicken).
meat(beef).


