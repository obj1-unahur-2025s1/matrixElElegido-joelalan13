
object nave{
    const pasajeros = [Neo,Morfeo,Trinity]

    method cantPasajeros() = pasajeros.size()
    method pasajeroDeMayorVitalidad() = pasajeros.max({p => p.vitalidad()})
    /* transformo primero la lista a una de numeros para devolver el obj transformado*/
    method estaEquilibrada(){
        return 
            self.pasajeroDeMayorVitalidad().vitalidad() < self.pasajeroDeMenosVitalidad().vitalidad()
    }
    method pasajeroDeMenosVitalidad() = pasajeros.min({p => p.vitalidad()})
    method estaElElegido() = pasajeros.any({p => p.esElElegido()})
    method chocar(){
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear()
    }
    method acelerar(){
        self.pasajerosNoSonElElegido().forEach({p => p.saltar() })
    }
    method pasajerosNoSonElElegido() = pasajeros.filter({p => !p.esElElegido()}) 
}

object Neo{
    var energia = 100
    
    method esElElegido() = true
    method saltar(){
        energia = energia / 2
    }
    method vitalidad() = energia * 0.1
}

object Morfeo{
   var vitalidad = 8
   var estaCansado = false
   
   method esElElegido() = false
   method saltar(){
        vitalidad = 0.max(vitalidad - 1)
        estaCansado = !estaCansado 
   }    
   method vitalidad() = vitalidad
   
}   

object Trinity{ 
    method vitalidad() = 0   
    method esElElegido() = false
    method saltar(){}
}                           
