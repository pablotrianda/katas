#Harry Potter es una colección de 7 novelas fantásticas escrita por la autora británica J. K. Rowling, en la que se describen las aventuras del joven aprendiz de mago Harry Potter y sus amigos. Nuestra librería ha decidido poner en venta los libros con una oferta especial.
#
#Cada libro cuesta 8€
#Si compras 2 libros diferentes tienes un 5% de descuento
#si compras 3 libros diferentes tienes un 10% de descuento
#si compras 4 libros diferentes tienes un 15% de descuento
#si compras 5 libros diferentes tienes un 20% de descuento
#si compras 6 libros diferentes tienes un 30% de descuento
#si compras toda la colección tienes un 45% de descuento
#
#Tras la locura desatada por semejante oferta, la librería se está llenando de adolescentes alocados comprando libros en grandes cantidades y las cajeras no dan a basto porque pierden mucho tiempo realizando cálculos.
#
#Por lo tanto tu objetivo es crear un módulo de código fuente que pueda aportar la solución a este problema y devuelva el precio de compra para cada combinación que haga cualquier cliente.
#
#Se proponen algunos ejemplos prácticos para entender los diferentes casos:
#comprando 2 copias del primer libro el precio es 8€ por unidad: 8 * 2 = 16
#comprando 3 copias del primer libro y una del segundo: (8€ * 2librosdiferentes * 0.95descuento) + (8€ * 2libros_iguales)
#Comprando 5 copias de toda la colección: (8€ * 7librosdiferentes * 0.55descuento) * 5_copias
#
#Basada en la kata Potter: http://codingdojo.org/cgi-bin/wiki.pl?KataPotter

require "test/unit"

class TestPotter < Test::Unit::TestCase
	
	def test_each_book_price
		assert_equal 8, Cashier::bill_me(:first_book_of_harry_potter)
		#same for the 6 books left
	end

	def test_two_different_books_have_the_right_discount
		assert_equal 15.2, Cashier::bill_me(:first_book_of_harry_potter,
								   :second_book_of_harry_potter)
		assert_equal 15.2, Cashier::bill_me(:first_book_of_harry_potter,
								   :second_book_of_harry_potter)
	end
end

class Cashier 
	TWO_BOOK_DISCOUNT = 5
	def self.bill_me(*books)
		apply_discount(books.length)
	end

	def self.calculate_discount(price, percent_value)
		(price * percent_value) / 100.0
	end

	def self.just_one_book?(number_of_books)
		number_of_books == 1
	end

	def self.apply_discount(number_of_books)
		unit_price = 8
		return unit_price if just_one_book?(number_of_books)
		subtotal = unit_price * number_of_books
		total = subtotal - calculate_discount(subtotal, TWO_BOOK_DISCOUNT)
		total
	end
end
