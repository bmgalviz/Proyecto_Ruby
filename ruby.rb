def saludo  
  p "Ingresa tu nombre"
  nombre=gets.chomp.upcase
  p "Hola #{nombre}! Vamos a comprobar que tanto sabes de futbol"
  p "Te parece?"
  respuesta= gets.chomp.downcase
  contador=0
  juego_u = nil
  loop do             #loop do puede tener varios break.
    if respuesta != "no" 
      p "Muy Bien!, vamos a comenzar."
      juego_u = true             #tambien se puede nombrar una variable como falsa o verdadera
      break
    elsif respuesta == "no"
      if contador >= 2
         p "Bueno chao"
         juego_u = false 
         break
      end  
      p "vamos! yo se que tu quieres"
      contador+= 2
      respuesta=gets.chomp.downcase
    else
      p "No seas aburrid@. Deja la pereza y comenzemos!"
      juego_u = true
      break
    end
  end
  juego_u
end




def preguntas_respuestas
  array = []
  File.foreach('texto.txt') do |line|
    array<<line
  end
  copia = array.collect(&:strip)
  copia
  text=copia.delete_if {|line| line == ""}
  text
end




def preguntometro

  file= preguntas_respuestas
  cartas= Hash[*file]
  frases_malas= ["Respuesta incorrecta","Vuelve a intentar","Vamos! tu puedes. Intenta de nuevo","Incorrecto.","Mal!"]
  frases_malas2=["Me estoy aburriendo, intenta de nuevo", "En esta te dejo hacer trampa, busca en internet...", "Si eres burro!"]
  frases_buenas=["Muy bien!","Correcto!","Asi es cerebrito!","Excelente!","Perfecto!","Super!","Haces trampa?!","Bien"]
  cartas.each do |pregunta, respuesta|
    p pregunta.upcase
    responder= gets.chomp.capitalize
    contador= 1
    while responder!=  respuesta
      if contador %5 == 0
       p frases_malas2.sample
       p pregunta.upcase
       responder= gets.chomp.capitalize
      end
    p frases_malas.sample
    p "Escribe otra respuesta"
    responder= gets.chomp.capitalize
    contador+= 1 
    end
    p frases_buenas.sample
  end
  p"FELICIDADES, has superado el reto.!!"
  p "Nos veremos en otra oportunidad. ADIOS"
end



def jugar
  juego = saludo        #si al final la variable es verdadera o falsa se cumple este metodo completo o no.
  if juego 
    preguntometro
  end
end




jugar





