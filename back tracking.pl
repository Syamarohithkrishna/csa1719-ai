fruit_color(apple, red).
fruit_color(banana, yellow).
fruit_color(grape, purple).
fruit_color(orange, orange).
fruit_color(lemon, yellow).
fruit_color(lime, green).

find_color(Fruit, Color) :- fruit_color(Fruit, Color).

find_fruit(Color, Fruit) :- fruit_color(Fruit, Color).

list_fruit_colors(Fruit, Color) :- fruit_color(Fruit, Color).
