luxuryHotel(Hotel):-
	hotel(Hotel),
	hotelHasRooms(Hotel,Rooms),
	minQuantity(Rooms,4),
	allComfortable(Rooms),
	allHasView(Rooms),
	hotelHasRestaurants(Hotel,Restaurants),
	minQuantity(Restaurants,2),
	allHasVegetarianMenu(Restaurants),
	allHasMeatMenu(Restaurants).


minQuantity(List,N):-
	length(List,Length),
	Length >= N.

allComfortable([]).
allComfortable([Room|Others]):-
	comfortable(Room),
	allComfortable(Others).

allHasView([]).
allHasView([Room|Others]):-
	hasView(Room),
	allHasView(Others).
	
allHasVegetarianMenu([]).
allHasVegetarianMenu([Room|Others]):-
	hasVegetarianMenu(Room),
	allHasVegetarianMenu(Others).
	
allHasMeatMenu([]).
allHasMeatMenu([Room|Others]):-
	hasMeatMenu(Room),
	allHasMeatMenu(Others).


hasVegetarianMenu(Restaurant):-
	menu(Restaurant,Menu),
	member(MenuItem,Menu),
	ingredients(MenuItem,Ingredients),
	member(I,Ingredients),
	\+ meat(I).

hasMeatMenu(Restaurant):-
	menu(Restaurant,Menu),
	member(MenuItem,Menu),
	ingredients(MenuItem,Ingredients),
	member(I,Ingredients),
	meat(I).
	
all(Condition,Goal):-
	\+ (Condition, \+Goal).


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


