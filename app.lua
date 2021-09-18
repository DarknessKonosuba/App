productos = {"Hamburguesa con Queso","Hamburguesa McFiesta","Hamburguesa","McNuggets x 6","McNuggets x 10","McNuggets x 20",
"Cajita Feliz con Hamburguesa","Cajita Feliz McNuggets","Cajita Feliz McFiesta Jr","Cajita Feliz McFiesta Jr sin TACC",
"Cajita Feliz","Postre McFlurry KitKat","Postre Sundae con ingredientes sin TACC","Guarnicion Papas Tasty y Bacon",
"Guarnicion Papas con Cheddar y Bacon","Guarnicion Papas Fritas Grandes","Guarnicion Papas Fritas Medianas",
"Guarnicion Papas Fritas Chicas","Bebida Coca Cola Grande","Bebida Coca Cola sin azucar Grande","Bebida Sprite sin azucar Grande",
"Bebida Fanta sin azucar Grande","Bebida Coca Cola Mediana","Bebida Coca Cola sin azucar Mediana","Bebida Sprite sin azucar Mediana",
"Bebida Fanta sin azucar Mediana","Bebida Jugo de Manzana","Bebida Agua"}
preciosProducto ={289,289,280,310,450,560,549,549,549,549,270,180,350,350,290,270,250,290,290,290,290,270,270,270,270,180,170,170}
promociones={"Cajita Feliz y McCombo mediano Big Mac","Cajita Feliz Hamburguesa","Cajita Feliz McNuggets x 4",
"Menu Hamburgueza con Queso","Family Box 4 Personas","3 Cuarto de Libra y 3 Papas medianas","Family Box 3 Personas","2 Cuarto de Libra y 2 Papas grandes",
"Hamburguesas con Queso, McNuggets y Papas","Family Box 2 Personas","McCombo grande Grand Tasty Triple","McCombo grande Grand Triple McBacon",
"McCombo grande Grand Tasty Doble","McCombo grande Grand Doble McBacon","McCombo mediano Grand Tasty Triple","McCombos mediano Grand Triple McBacon",
"Hamburguesa simple con 30% descuento"}
precioPromos={1049,379,379,299,2099,1799,1599,1299,1249,1099,999,999,899,899,899,899,150}
cierreCaja = {}
productosCierre = {}
numTicket = 0

fecha=os.date("*t") -- *t indico que quiero una tabla
hoy=fecha.day.."/"..fecha.month.."/"..fecha.year -- elijo el formato de fecha que deseo

function encabezado() -- ANDA
    print("*****************************")
    print("   Bienvenido a McDonald's")
    print("*****************************")
    print("Hoy es:",hoy)
end

function menu() -- ANDA
    encabezado()
    print("-----------------------------")
    print("Configuracion del Sistema")
    print("1) Ver productos")
    print("2) Agregar productos")
    print("3) Eliminar productos")
    print("4) Gestionar Promociones")
    print("5) Menu de ventas")
    print("6) Cierre de Caja")
    print("7) Acerca de")
    print("8) Salir")
    print("-----------------------------")
    io.write(">>> ")

    local opcion=tonumber(io.read())
    if opcion==1 then
        verProductos()
        print()
        print("Desea volver al Menu principal (si/no)?")
        local queHacer = io.read():lower()
        retornoMenu(queHacer)
    elseif opcion==2 then
        agregarProductos()
    elseif opcion==3 then
        eliminarProductos()
        print()
        print("Desea volver al Menu principal (si/no)?")
        local queHacer = io.read():lower()
        retornoMenu(queHacer)
    elseif opcion==4 then
        gestionPromociones()
    elseif opcion==5 then
        menuVentas()
        return menu()
    elseif opcion==6 then    
        print("****************************")
        print("\t"..os.date())
        print("****************************")
        cierreDeCaja()
        print("Good Job..")
        os.exit()
    elseif opcion==7 then
        mostrarAcerca()
        print()
        print("Desea volver al Menu principal (si/no)?")
        local queHacer = io.read():lower()
        retornoMenu(queHacer)
    elseif opcion==8 then
        print("Seguro desea salir? (si/no)")
        local resp = io.read():lower()
        if resp == "si" then
            print("Saliendo del Sistema.....")
            os.exit()
        elseif resp:lower() == "no" then
            return menu()
        else
            print("Responda en la forma indicada por favor.")
        end
    else
        print("Ingrese una opcion valida")
        print("Pulse enter para continuar...")
        io.read()
        return menu()
    end
end

function mostrarAcerca() -- ANDA
    os.execute("cls")
    print("\n")
    local f=io.open("acerca.txt")
    local texto=f:read("*a") -- *a --> Me lee todo el archivo

    f:close()

    print("---------------------------------------------")
    print(texto)
    print("---------------------------------------------")
    print("Pulse enter para continuar...")
    io.read()
end

function retornoMenu(queHacer) --ANDA
    os.execute("cls")
    if queHacer == "si" then
        return menu()
    elseif queHacer == "no" then
        print("Saliendo del Sistema.....")
        os.exit()
    else
        print("Responda en la forma indicada por favor.")
        return retornoMenu(queHacer)
    end
end

function verProductos() -- ANDA
    os.execute("cls")
    print("*********************************************")
    print("\tLista de Productos")
    print("*********************************************")
    for x in pairs (productos) do 
        print(x.."- "..productos[x].." --->> $"..preciosProducto[x])
    end
end

function agregarProductos() --ANDA
    os.execute("cls")
    print("Favor ingresar el producto a cargar: ")
    addProducto = io.read()
    table.insert(productos,addProducto)
    print("Favor ingresar el precio del nuevo producto: ")
    addPrecio= io.read()
    tostring(addPrecio)
    table.insert(preciosProducto,addPrecio)

    print("\nDesea seguir agregando productos? (Si/No)")
    local agregaOno = io.read():lower()
    if agregaOno == "si" then
        return agregarProductos()
    elseif agregaOno == "no" then
        return menu()
    end
end

function eliminarProductos() --ANDA
    os.execute("cls")
    for x in pairs (productos) do 
        print(x.."- "..productos[x].."--->> $"..preciosProducto[x])
    end
    print()
    print("Atencion! Eleccion numerica.")
    print("Favor indicar el producto a eliminar: ")
    productoAeliminar = tonumber(io.read())
    if productoAeliminar then
        print("Producto eliminado de forma exitosa -->> "..productos[productoAeliminar])
        table.remove(productos,productoAeliminar)
        table.remove(preciosProducto,productoAeliminar)
    else 
        print("Debe ingresar una opcion numerica")
        return eliminarProductos()
    end
end

function gestionPromociones() -- ANDA
    os.execute("cls")
    function menuPromos() -- Funcion Menu para gestion de Promos
        print("-----------------------------")
        print("Menu de Promociones")
        print("1) Ver promociones")
        print("2) Agregar promociones")
        print("3) Eliminar promociones")
        print("4) Volver al Menu principal")
        print("-----------------------------")
        io.write(">>> ")
        local op = tonumber(io.read())
    
        if op == 1 then
            print()
            verPromociones()
            print()
            return menuPromos()
        elseif op == 2 then
            print()
            agregarPromo()
            print()
            print("Promociones agregadas..")
            print(os.date())
            print()
            return menuPromos()
        elseif op == 3 then
            print()
            eliminarPromos()
            print()
            print("Promociones eliminadas..")
            print(os.date())
            print()
            return menuPromos()
        elseif op == 4 then
            print()
            return menu()
        else
            print("Ingrese una opcion valida...")
            print("Pulse enter para continuar...")
            io.read()
            return menuPromos()
        end
    end
    
    function verPromociones() --ANDA
        os.execute("cls")
        print("********************************************")
        print("\tLista de Promociones")
        print("********************************************")
        for x in pairs (promociones) do 
            print(x.."- "..promociones[x].." --->> $"..precioPromos[x])
        end
    end

    function agregarPromo() -- ANDA
        os.execute("cls")
        print("Favor ingresar el producto a cargar: ")
        addPromo = io.read()
        table.insert(promociones,addPromo)
        print("Favor ingresar el precio promocional: ")
        addPrecio= io.read()
        tostring(addPrecio)
        table.insert(precioPromos,addPrecio)


        print("\nDesea seguir agregando promos? (Si/No)")
        local agregaOno = io.read():lower()
        if agregaOno == "si" then
            return agregarPromo()
        elseif agregaOno == "no" then
            return menuPromos()
        end
    end

    function eliminarPromos() -- ANDA
        os.execute("cls")
        for x in pairs (promociones) do 
            print(x.."- "..promociones[x].."--->> $"..precioPromos[x])
        end
        print()
        print("Atencion! Eleccion numerica.")
        print('Favor indicar el producto a eliminar:')
        productoAeliminar = tonumber(io.read())
        if productoAeliminar then
            print("Producto eliminado de forma exitosa -->> "..promociones[productoAeliminar])
            table.remove(promociones,productoAeliminar)
            table.remove(precioPromos,productoAeliminar)
        else
            print("Debe ingresar una opcion numerica")
            return eliminarPromos()
        end
    end

    menuPromos()
    
end

function menuVentas() -- ANDA
    os.execute("cls")
    ticket = {}
    ticketMonto = {}
    numTicket = numTicket + 1
    sumaMonto = 0
    eleccion = "si"
    print("----------------------------------------------")
    print("\t\tMenu de Ventas")
    print("----------------------------------------------")
    while eleccion == "si" do
        print("----------------------------------------------")
        print("Atencion! Eleccion numerica.")
        print("1) Productos" )
        print("2) Promociones" )
        print("----------------------------------------------")
        io.write(">>> ")
        op = tonumber(io.read())
        if op == 1 then
            print("********************************************")
            print("\tLista de Productos")
            for x in pairs (productos) do 
                print(x.."- "..productos[x].." --->> $"..preciosProducto[x])
            end
            print("\n")
            print("-----------------------------------------")
            print("Atencion! Eleccion numerica.")
            print("Favor elegir un producto: ")
            io.write(">>> ")
            pro = tonumber(io.read())
            print("Favor indicar cantidad de unidades: ")
            io.write(">>> ")
            pre = tonumber(io.read())
            carritoPro = productos[pro]
            carritoPre = preciosProducto[pro]*pre
            
            table.insert(ticket,carritoPro)
            table.insert( productosCierre,carritoPro )
            table.insert(ticketMonto,carritoPre)
                        
            print()
            print("Desea seguir agregando productos? (Si/No) ")
            io.write(">>> ")
            eleccion = io.read()
            if string.lower( eleccion ) == "si" then
                eleccion = "si"
            elseif string.lower( eleccion ) == "no" then
                print("\n")
                print("-------------------------------------")
                print("Ticket de venta "..numTicket)
                for x in pairs ( ticket ) do
                    print(ticket[x].." $"..ticketMonto[x])
                end
                print("\n")
                eleccion = "no"
            end
        elseif op == 2 then
            print("********************************************")
            print("\tLista de Promociones")
            for x in pairs (promociones) do 
                print(x.."- "..promociones[x].." --->> $"..precioPromos[x])
            end
            print("\n")
            print("-----------------------------------------")
            print("Atencion! Eleccion numerica.")
            print("Favor elegir una promocion: ")
            io.write(">>> ")
            pro = tonumber(io.read())
            print("Favor indicar cantidad de unidades: ")
            io.write(">>> ")
            pre = tonumber(io.read())
            carritoPro = promociones[pro]
            carritoPre = precioPromos[pro]*pre
            
            table.insert(ticket,carritoPro)
            table.insert( productosCierre,carritoPro )
            table.insert(ticketMonto,carritoPre)
                        
            print("Desea seguir agregando productos? (Si/No) ")
            io.write(">>> ")
            eleccion = io.read()
            if string.lower( eleccion ) == "si" then
                eleccion = "si"
            elseif string.lower( eleccion ) == "no" then
                print("\n")
                print("-------------------------------------")
                print("Ticket de venta "..numTicket)
                for x in pairs ( ticket ) do
                    print(ticket[x].." $"..ticketMonto[x])
                end
                print("\n")
                eleccion = "no"
            end
        end
    end
    for x in pairs (ticketMonto) do
        sumaMonto = sumaMonto + ticketMonto[x]
    end
    print("Monto total: $"..sumaMonto)
    table.insert( cierreCaja,sumaMonto )
    print("-------------------------------------")
end

function cierreDeCaja() --ANDA
    os.execute("cls")
    print("**********************************")
    print("Productos vendidos")
    for x in pairs ( productosCierre ) do
        print(x.."- "..productosCierre[x])
    end
    print("**********************************")
    suma = 0
    for x in pairs ( cierreCaja ) do
        suma = suma + cierreCaja[x]
    end
    print("Monto recaudado $"..suma)
    print("**********************************")

end

menu()