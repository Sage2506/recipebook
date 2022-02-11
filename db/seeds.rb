# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
admin_user = User.new
admin_user.email = "test@hotmail.com"
admin_user.name = "test"
admin_user.password = BCrypt::Password.create('12345678')
admin_user.encrypted_password = BCrypt::Password.create('12345678')
admin_user.role = 0
admin_user.save!

moderator_user = User.new
moderator_user.email = "test@gmail.com"
moderator_user.name = "moderator"
moderator_user.password = BCrypt::Password.create('12345678')
moderator_user.encrypted_password = BCrypt::Password.create('12345678')
moderator_user.role = 1
moderator_user.save!

volunteer_user = User.new
volunteer_user.email = "volunteer@hotmail.com"
volunteer_user.name = "volunteer"
volunteer_user.password = BCrypt::Password.create('12345678')
volunteer_user.encrypted_password = BCrypt::Password.create('12345678')
volunteer_user.role = 2
volunteer_user.save!

Ingredient.create( name: "Agua", user: admin_user);
Ingredient.create( name: "Pan molido", user: admin_user);
Ingredient.create( name: "Pan para hot dogs", user: admin_user);
Ingredient.create( name: "Zucaritas", user: admin_user);
Ingredient.create( name: "Sal de mar", user: admin_user);
Ingredient.create( name: "Azucar de caña", user: admin_user);
Ingredient.create( name: "Pimienta", user: admin_user);
Ingredient.create( name: "Azucar mascabada", user: admin_user);
Ingredient.create( name: "Ajo", user: admin_user);
Ingredient.create( name: "Manzana", user: admin_user);
Ingredient.create( name: "Cebolla blanca", user: admin_user);
Ingredient.create( name: "Lechuga", user: admin_user);
Ingredient.create( name: "Tomate", user: admin_user);
Ingredient.create( name: "Pan para sandwich", user: admin_user);
Ingredient.create( name: "Queso amarillo cuadros", description:"queso en cuadrado para sandwich", user: admin_user);
Ingredient.create( name: "Queso amarillo liquido", description:"Queso amarillo para nachos", user: admin_user);
Ingredient.create( name: "Jamón de pavo", user: admin_user);
Ingredient.create( name: "Pimiento morron", user: admin_user);
Ingredient.create( name: "Muslo de pollo", user: admin_user);
Ingredient.create( name: "Pechuga de pollo", user: admin_user);
Ingredient.create( name: "Ala de pollo", user: admin_user);
Ingredient.create( name: "Chile serrano", user: admin_user);
Ingredient.create( name: "Huevo", user: admin_user);
Ingredient.create( name: "Sazonador italiano", user: admin_user);
Ingredient.create( name: "Levadura", user: admin_user);
Ingredient.create( name: "Aceite de Oliva", user: admin_user);
Ingredient.create( name: "Aceite vegetal", user: admin_user);
Ingredient.create( name: "Harina de trigo", user: admin_user);
Ingredient.create( name: "Harina de maíz", user: admin_user);
Ingredient.create( name: "Harina integral", user: admin_user);
Ingredient.create( name: "Harina para hot cakes", description: "harina para hot cakes marca pronto", user: admin_user);
Ingredient.create( name: "Queso chihuahua", user: admin_user);
Ingredient.create( name: "Queso oaxaca", user: admin_user);
Ingredient.create( name: "Queso cheddar", user: admin_user);
Ingredient.create( name: "Queso mozarella", user: admin_user);
Ingredient.create( name: "Queso fresco", user: admin_user);
Ingredient.create( name: "Queso Parmesano", user: admin_user);
Ingredient.create( name: "Tocino", user: admin_user);
Ingredient.create( name: "Salchicha de pavo", user: admin_user);
Ingredient.create( name: "Salchicha de res", user: admin_user);
Ingredient.create( name: "Fresa", user: admin_user);
Ingredient.create( name: "Pera", user: admin_user);
Ingredient.create( name: "Sandia", user: admin_user);
Ingredient.create( name: "Platano", user: moderator_user);
Ingredient.create( name: "Mora azul", user: moderator_user);
Ingredient.create( name: "Arandano", user: moderator_user);
Ingredient.create( name: "Naranja", user: moderator_user);
Ingredient.create( name: "Mandarina", user: moderator_user);
Ingredient.create( name: "Melon", user: moderator_user);
Ingredient.create( name: "Guayaba", user: moderator_user);
Ingredient.create( name: "Limon", user: moderator_user);
Ingredient.create( name: "Papaya", user: moderator_user);
Ingredient.create( name: "Canela", user: moderator_user);
Ingredient.create( name: "Paprica", user: moderator_user);
Ingredient.create( name: "Coditos", user: moderator_user);
Ingredient.create( name: "Fideos", user: moderator_user);
Ingredient.create( name: "Spaguetti", user: moderator_user);
Ingredient.create( name: "Salsa de tomate preggo", user: moderator_user);
Ingredient.create( name: "Oregano", user: moderator_user);
Ingredient.create( name: "Chocolate", user: moderator_user);
Ingredient.create( name: "Vainilla", user: moderator_user);
Ingredient.create( name: "Azucar glass", user: moderator_user);
Ingredient.create( name: "Filete New york", user: moderator_user);
Ingredient.create( name: "Rib eye", user: moderator_user);
Ingredient.create( name: "Esparragos", user: moderator_user);
Ingredient.create( name: "Salsa de soya", user: moderator_user);
Ingredient.create( name: "Cilantro", user: moderator_user);
Ingredient.create( name: "Coco rayado", user: moderator_user);
Ingredient.create( name: "Aguacate", user: moderator_user);
Ingredient.create( name: "Chile poblano", user: moderator_user);
Ingredient.create( name: "Chile habanero", user: moderator_user);
Ingredient.create( name: "Salami", user: moderator_user);
Ingredient.create( name: "Pepperoni", user: moderator_user);
Ingredient.create( name: "Elote", user: moderator_user);
Ingredient.create( name: "Repollo", user: moderator_user);
Ingredient.create( name: "Tilapia", user: moderator_user);
Ingredient.create( name: "Cebolla morada", user: moderator_user);
Ingredient.create( name: "Tortilla de harina", user: moderator_user);
Ingredient.create( name: "Tortilla de maíz", user: volunteer_user);
Ingredient.create( name: "Pan para hamburguesas", user: volunteer_user);
Ingredient.create( name: "Carne molida", user: volunteer_user);
Ingredient.create( name: "Mantequilla", user: volunteer_user);
Ingredient.create( name: "Puré de tomate", user: volunteer_user);
Ingredient.create( name: "Mole", user: volunteer_user);
Ingredient.create( name: "Vino blanco", user: volunteer_user);
Ingredient.create( name: "Vino tinto", user: volunteer_user);
Ingredient.create( name: "Nuez", user: volunteer_user);
Ingredient.create( name: "Mayonesa", user: volunteer_user);
Ingredient.create( name: "Catsup", user: volunteer_user);
Ingredient.create( name: "Salsa inglesa", user: volunteer_user);
Ingredient.create( name: "Salsa bbq", user: volunteer_user);
Ingredient.create( name: "Miel de mapple", user: volunteer_user);
Ingredient.create( name: "Miel de abeja", user: volunteer_user);
Ingredient.create( name: "Mijo", user: volunteer_user);
Ingredient.create( name: "Cebada", user: volunteer_user);
Ingredient.create( name: "Polvo para hornear", user: volunteer_user);
Ingredient.create( name: "Arroz", user: volunteer_user);
Ingredient.create( name: "Leche de soya", user: volunteer_user);
Ingredient.create( name: "Leche de almendras", user: volunteer_user);
Ingredient.create( name: "Leche de vaca", user: volunteer_user);
Ingredient.create( name: "Champiñones", user: volunteer_user);
Ingredient.create( name: "Lechera", user: volunteer_user);
Ingredient.create( name: "Papa", user: volunteer_user);
Ingredient.create( name: "Cubo sazonador norsuiza", user: volunteer_user);
Ingredient.create( name: "Media crema", user: volunteer_user);

cereal = Dish.create( name: "Cereal con leche", user: admin_user);
sandwich= Dish.create( name: "Sandwich", user: admin_user);
pizza= Dish.create( name: "Pizza", user: admin_user);
soup= Dish.create( name: "Sopa de coditos", user: admin_user);
mole = Dish.create( name: "Pollo con mole", user: admin_user);
quesadilla= Dish.create( name: "Quesadilla", user: admin_user);
chicken = Dish.create( name: "Pollo relleno de queso", user: admin_user);
chickenCream = Dish.create( name: "Pollo en crema de champiñones", user: admin_user);
peppers = Dish.create( name: "Chiles en raja", user: admin_user);
hotCakes = Dish.create( name: "Hot Cakes", user: moderator_user);
fruitSalad= Dish.create( name: "Ensalada de frutas", user: moderator_user);
guacamole = Dish.create( name: "Guacamole", user: moderator_user);
baconEggs = Dish.create( name: "Huevos con tocino", user: moderator_user);
hamonEggs = Dish.create( name: "Huevos con jamon", user: moderator_user);
hotdogs = Dish.create( name: "Hot dogs", user: moderator_user);
breadChicken = Dish.create( name: "Pollo empanizado", user: volunteer_user);
filledPepper = Dish.create( name: "Chile Relleno", user: volunteer_user);
spaguettiWithMeatballs = Dish.create( name: "Spaguetti con albondigas", user: volunteer_user);
spaguetiWtihMushromSauce= Dish.create( name: "Spaguetti con salsa de champiñones", user: volunteer_user);
burguer = Dish.create( name: "Hamburguesas", user: volunteer_user);
frenchFries = Dish.create( name: "Papas fritas", user: volunteer_user);
frenchBread = Dish.create( name: "Pan frances", user: volunteer_user);
chilaquiles = Dish.create( name: "chilaquiles", user: volunteer_user);
swissEnchiladas = Dish.create( name: "Enchiladas suizas", user: volunteer_user);

DishIngredient.create( dish_id: 1, ingredient_id:100)
DishIngredient.create( dish_id: 1, ingredient_id:4)
DishIngredient.create( dish_id: 2, ingredient_id:14)
DishIngredient.create( dish_id: 2, ingredient_id:88)
DishIngredient.create( dish_id: 2, ingredient_id:17)
DishIngredient.create( dish_id: 2, ingredient_id:15)
DishIngredient.create( dish_id: 2, ingredient_id:38)
DishIngredient.create( dish_id: 2, ingredient_id:12)
DishIngredient.create( dish_id: 2, ingredient_id:13)
DishIngredient.create( dish_id: 2, ingredient_id:18)
DishIngredient.create( dish_id: 2, ingredient_id:77)
DishIngredient.create( dish_id: 2, ingredient_id:22)
DishIngredient.create( dish_id: 2, ingredient_id:69)
DishIngredient.create( dish_id: 3, ingredient_id:25)
DishIngredient.create( dish_id: 3, ingredient_id:28)
DishIngredient.create( dish_id: 3, ingredient_id:26)
DishIngredient.create( dish_id: 3, ingredient_id:1)
DishIngredient.create( dish_id: 3, ingredient_id:5)
DishIngredient.create( dish_id: 3, ingredient_id:6)
DishIngredient.create( dish_id: 3, ingredient_id:35)
DishIngredient.create( dish_id: 3, ingredient_id:58)
DishIngredient.create( dish_id: 3, ingredient_id:59)
DishIngredient.create( dish_id: 3, ingredient_id:38)
DishIngredient.create( dish_id: 3, ingredient_id:18)
DishIngredient.create( dish_id: 3, ingredient_id:101)
DishIngredient.create( dish_id: 6, ingredient_id:78)
DishIngredient.create( dish_id: 6, ingredient_id:32)
DishIngredient.create( dish_id: 6, ingredient_id:17)
DishIngredient.create( dish_id: 7, ingredient_id:19)
DishIngredient.create( dish_id: 7, ingredient_id:38)
DishIngredient.create( dish_id: 7, ingredient_id:82)
DishIngredient.create( dish_id: 7, ingredient_id:32)
DishIngredient.create( dish_id: 10, ingredient_id:31)
DishIngredient.create( dish_id: 10, ingredient_id:61)
DishIngredient.create( dish_id: 10, ingredient_id:23)
DishIngredient.create( dish_id: 10, ingredient_id:82)
DishIngredient.create( dish_id: 11, ingredient_id:41)
DishIngredient.create( dish_id: 11, ingredient_id:102)
DishIngredient.create( dish_id: 11, ingredient_id:44)
DishIngredient.create( dish_id: 11, ingredient_id:10)
DishIngredient.create( dish_id: 11, ingredient_id:47)
DishIngredient.create( dish_id: 11, ingredient_id:42)
DishIngredient.create( dish_id: 12, ingredient_id:13)
DishIngredient.create( dish_id: 12, ingredient_id:69)
DishIngredient.create( dish_id: 12, ingredient_id:11)
DishIngredient.create( dish_id: 12, ingredient_id:100)
DishIngredient.create( dish_id: 12, ingredient_id:51)
DishIngredient.create( dish_id: 13, ingredient_id:23)
DishIngredient.create( dish_id: 13, ingredient_id:38)
DishIngredient.create( dish_id: 13, ingredient_id:27)
DishIngredient.create( dish_id: 13, ingredient_id:5)
DishIngredient.create( dish_id: 14, ingredient_id:17)
DishIngredient.create( dish_id: 14, ingredient_id:5)
DishIngredient.create( dish_id: 14, ingredient_id:27)
DishIngredient.create( dish_id: 14, ingredient_id:23)
DishIngredient.create( dish_id: 15, ingredient_id:3)
DishIngredient.create( dish_id: 15, ingredient_id:40)
DishIngredient.create( dish_id: 15, ingredient_id:13)
DishIngredient.create( dish_id: 15, ingredient_id:11)
DishIngredient.create( dish_id: 15, ingredient_id:88)
DishIngredient.create( dish_id: 15, ingredient_id:89)
DishIngredient.create( dish_id: 16, ingredient_id:23)
DishIngredient.create( dish_id: 16, ingredient_id:2)
DishIngredient.create( dish_id: 16, ingredient_id:27)
DishIngredient.create( dish_id: 16, ingredient_id:5)
DishIngredient.create( dish_id: 18, ingredient_id:57)
DishIngredient.create( dish_id: 18, ingredient_id:81)
DishIngredient.create( dish_id: 18, ingredient_id:83)
DishIngredient.create( dish_id: 18, ingredient_id:26)
DishIngredient.create( dish_id: 18, ingredient_id:5)
DishIngredient.create( dish_id: 18, ingredient_id:67)
DishIngredient.create( dish_id: 18, ingredient_id:59)
DishIngredient.create( dish_id: 18, ingredient_id:7)
DishIngredient.create( dish_id: 19, ingredient_id:57)
DishIngredient.create( dish_id: 19, ingredient_id:101)
DishIngredient.create( dish_id: 19, ingredient_id:11)
DishIngredient.create( dish_id: 19, ingredient_id:59)
DishIngredient.create( dish_id: 20, ingredient_id:23)
DishIngredient.create( dish_id: 20, ingredient_id:81)
DishIngredient.create( dish_id: 20, ingredient_id:11)
DishIngredient.create( dish_id: 20, ingredient_id:7)
DishIngredient.create( dish_id: 20, ingredient_id:5)
DishIngredient.create( dish_id: 20, ingredient_id:90)
DishIngredient.create( dish_id: 20, ingredient_id:91)
DishIngredient.create( dish_id: 20, ingredient_id:80)
DishIngredient.create( dish_id: 20, ingredient_id:15)
DishIngredient.create( dish_id: 20, ingredient_id:17)
DishIngredient.create( dish_id: 20, ingredient_id:12)
DishIngredient.create( dish_id: 20, ingredient_id:13)
DishIngredient.create( dish_id: 20, ingredient_id:38)
DishIngredient.create( dish_id: 21, ingredient_id:52)
DishIngredient.create( dish_id: 21, ingredient_id:5)
DishIngredient.create( dish_id: 21, ingredient_id:7)
DishIngredient.create( dish_id: 21, ingredient_id:27)
DishIngredient.create( dish_id: 22, ingredient_id:14)
DishIngredient.create( dish_id: 22, ingredient_id:27)
DishIngredient.create( dish_id: 22, ingredient_id:23)
DishIngredient.create( dish_id: 22, ingredient_id:6)
DishIngredient.create( dish_id: 5, ingredient_id:5)
DishIngredient.create( dish_id: 5, ingredient_id:11)
DishIngredient.create( dish_id: 5, ingredient_id:19)
DishIngredient.create( dish_id: 5, ingredient_id:21)
DishIngredient.create( dish_id: 5, ingredient_id:27)
DishIngredient.create( dish_id: 5, ingredient_id:84)
DishIngredient.create( dish_id: 9, ingredient_id:5)
DishIngredient.create( dish_id: 9, ingredient_id:70)
DishIngredient.create( dish_id: 9, ingredient_id:74)
DishIngredient.create( dish_id: 9, ingredient_id:105)
DishIngredient.create( dish_id: 23, ingredient_id:11)
DishIngredient.create( dish_id: 23, ingredient_id:20)
DishIngredient.create( dish_id: 23, ingredient_id:27)
DishIngredient.create( dish_id: 23, ingredient_id:79)
DishIngredient.create( dish_id: 23, ingredient_id:83)
DishIngredient.create( dish_id: 23, ingredient_id:105)
DishIngredient.create( dish_id: 24, ingredient_id:18)
DishIngredient.create( dish_id: 24, ingredient_id:20)
DishIngredient.create( dish_id: 24, ingredient_id:32)
DishIngredient.create( dish_id: 24, ingredient_id:79)
DishIngredient.create( dish_id: 24, ingredient_id:105)
DishIngredient.create( dish_id: 8, ingredient_id:19)
DishIngredient.create( dish_id: 8, ingredient_id:82)
DishIngredient.create( dish_id: 8, ingredient_id:101)
DishIngredient.create( dish_id: 8, ingredient_id:105)
DishIngredient.create( dish_id: 8, ingredient_id:104)
DishIngredient.create( dish_id: 4, ingredient_id:1)
DishIngredient.create( dish_id: 4, ingredient_id:5)
DishIngredient.create( dish_id: 4, ingredient_id:11)
DishIngredient.create( dish_id: 4, ingredient_id:27)
DishIngredient.create( dish_id: 4, ingredient_id:55)
DishIngredient.create( dish_id: 4, ingredient_id:104)
DishIngredient.create( dish_id: 17, ingredient_id:1)
DishIngredient.create( dish_id: 17, ingredient_id:5)
DishIngredient.create( dish_id: 17, ingredient_id:11)
DishIngredient.create( dish_id: 17, ingredient_id:13)
DishIngredient.create( dish_id: 17, ingredient_id:23)
DishIngredient.create( dish_id: 17, ingredient_id:32)
DishIngredient.create( dish_id: 17, ingredient_id:70)
DishIngredient.create( dish_id: 17, ingredient_id:103)
DishIngredient.create( dish_id: 17, ingredient_id:105)
DishIngredient.create( dish_id: 17, ingredient_id:104)