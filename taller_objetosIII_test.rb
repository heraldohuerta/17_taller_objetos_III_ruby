###############################################################
# Ejercicio 1: Sintaxis
###############################################################
# Corregir los errores para poder ejecutar ambos métodos

class MiClase
    def de_instancia
        puts 'Método de instancia!'
    end
    def self.de_clase
        puts 'Método de clase!'
    end
end
MiClase.new.de_instancia
MiClase.de_clase



###############################################################
# Ejercicio 2: Sintaxis
###############################################################
# Corregir los errores de sintaxis para que las últimas cuatro líneas se ejecuten de manera correcta.

class MiClase
    attr_writer :name
    attr_reader :name
    def initialize(name)
        @name = name
    end
    def self.saludar
        "Hola! Soy la clase #{@name}"
    end
end
c = MiClase.new('Clase Uno')
puts c.name
c.name = 'Nombre Nuevo'
puts MiClase.saludar


###############################################################
# Ejercicio 3: Herencia
###############################################################
# Se tiene la clase  Vehicle  que recibe como argumento un modelo y un año. El método engine_start enciende el vehículo
class Vehicle
  def initialize(model, year)
    @model = model
    @year = year
    @start = false
  end
  def engine_start
    @start = true
  end
end

# Se pide:
# Crear una clase Car que herede de Vehicle
# El constructor de Car, además de heredar las propiedades de Vehicle, debe incluir un contador de instancias de Car.
# Crear un método de clase en Car que devuelva la cantidad de instancias.
# El método engine_start heredado debe además imprimir 'El motor se ha encendido!'.
# Instanciar 10 Cars.
# Consultar la cantidad de instancias generadas de Car mediante el método de clase creado

class Car < Vehicle
  @@contador_instacia = 0
  def initialize(model,year)
    super
    @@contador_instacia += 1
  end
  def self.instancias
    @@contador_instacia
  end
  def engine_start
    super
    puts 'El motor de ha encendido'
  end
end

clases_arr = []
modelos = ['model1','model2','model3']
year = [2015,2016,2017]
10.times do
  clases_arr << Car.new(modelos.sample,year.sample)
end
puts "La cantidad de instancias son: #{Car.instancias}"


###############################################################
# Ejercicio 4: Método de clase
###############################################################

# El archivo  notas.txt contiene las notas de 4 alumnos
#La clase  Alumno posee un constructor que recibe el nombre del alumno junto a sus cuatro notas
# Crear un método de clase llamado read_file  que reciba como argumento el nombre del archivo  (por defecto debe ser 'notas.txt') y devuelva la colección de objetos.
# El método debe alojar las instrucciones que se encuentran después de la clase.
# Finalmente imprimir la colección de objetos generada.
# Hint: Debes reemplazar el argumento de File.open  con el nombre del argumento del método read_file


class Alumno
  def initialize(nombre, nota1, nota2, nota3, nota4)
    @nombre = nombre
    @nota1 = nota1
    @nota2 = nota2
    @nota3 = nota3
    @nota4 = nota4
  end

  def self.read_file(file)
    alumnos = []
    data = []
    File.open(file, 'r') { |file| data = file.readlines }
    data.each do |alumno|
      alumnos << Alumno.new(*alumno.split(', '))
    end
     alumnos
  end
end
print Alumno.read_file('notas.txt')



###############################################################
# Ejercicio 5
###############################################################
# Se tienen las clases Rectangulo  y Cuadrado  cuyos constructores reciben las medidas de los lados correspondientes.
# Se pide:
# Agregar un método de instancia llámado lados en ambas clases. El método debe imprimir un string conlas medidas de los lados.
# Crear un método llamado perimetro que reciba dos argumentos (lados) y devuelva el perímetro.
# Crear un método llamado area que reciba dos argumentos (lados) y devuelva el área.
# Instanciar un Rectangulo y un Cuadrado.
# Imprimir el área y perímetro de los objetos instanciados utilizando los métodos implementado



# NOTA: Donde dice:
# -->  "Crear un método llamado perimetro que reciba dos argumentos (lados) y devuelva el perímetro."
# -->  "Crear un método llamado area que reciba dos argumentos (lados) y devuelva el área.""
# No corresponde volver a pasar a los paremtros ya que al momento de crear el objeto se declaran y se asignan


class Rectangulo
  def initialize(largo, ancho)
    @largo = largo
    @ancho = ancho
  end
  def lados
    puts "El ancho es: #{@ancho}, el largo es:#{@lado}"
  end

  def area
    @largo * @ancho
  end

  def perimetro
    (@largo * 2) + (@ancho * 2)
  end
end
class Cuadrado
  def initialize(lado)
    @lado = lado
  end

  def lados
    puts "El lado del cuadrado es: #{@lado}"
  end

  def area
    @lado *  @lado
  end

  def perimetro
    (@lado * 4)
  end
end


cuadrado = Cuadrado.new(2)
rectangulo = Rectangulo.new(2,3)

puts "\n\n"
puts "El area del cuadrado es: #{cuadrado.area} y su perimetro #{cuadrado.perimetro}"
puts "El area del rectangulo es: #{rectangulo .area} y su perimetro #{rectangulo .perimetro}"
