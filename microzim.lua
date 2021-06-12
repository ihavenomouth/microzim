VERSION = "0.0.1"


local micro = import("micro")
local config = import("micro/config")
local buffer = import("micro/buffer")

--micro.InfoBar():Message("YEAH") --Mensajes en la barra de información
--buf:Insert( buffer.Loc(0,2), txtNuevo) --Inserta en la primera col de la línea 3
--micro.InfoBar():Message( "Lineas: ".. buf:LinesNum())
-- buf:MoveLinesDown(0,buf:LinesNum()-1) //rota las líneas

function verbatim()
	local buf = micro.CurPane().Buf
	local marca = "\'\'\'"
	local c = micro.CurPane().Cursor
	--local seleccion = c:GetSelection();

	if c:HasSelection() then
		local inicio, fin = nil, nil
		if c.CurSelection[1]:GreaterThan(-c.CurSelection[2]) then
			inicio = c.CurSelection[2]
			fin = c.CurSelection[1]
		else
			inicio = c.CurSelection[1]
			fin = c.CurSelection[2]
		end
		
		local a = buffer.Loc(0, inicio.Y)
		local b = buffer.Loc(0, fin.Y)

		micro.InfoBar():Message( "Líneas: " .. inicio.Y .. " - " ..  fin.Y)

		buf:Insert( b, marca .. "\n")
		buf:Insert( a, marca .. "\n")

	else
		micro.InfoBar():Message( "Ninguna línea seleccionada")
	end
end



function h1()
	heading("======")
end

function h2()
	heading("=====")
end

function h3()
	heading("====")
end

function h4()
	heading("===")
end

function h5()
	heading("==")
end


function heading(formato)
	local buf = micro.CurPane().Buf
    local numLinea = micro.CurPane().Cursor.Loc.Y --las líneas comienzan a contarse desde la 0
	local eol = string.len(micro.CurPane().Buf:Line(micro.CurPane().Cursor.Loc.Y))

    local txtViejo = buf:Line(numLinea)
    local txtNuevo = formato .. " " .. txtViejo .. " " .. formato   
    
    local LocInicioLinea = buffer.Loc(0,numLinea)
    local LocFinLinea = buffer.Loc(eol,numLinea)
    buf:Replace(LocInicioLinea, LocFinLinea, txtNuevo)
end



function init()
    config.MakeCommand("h1", h1, config.NoComplete)
	config.TryBindKey("Alt-1", "lua:microzim.h1",false);
	config.TryBindKey("Alt-2", "lua:microzim.h2",false);
	config.TryBindKey("Alt-3", "lua:microzim.h3",false);
	config.TryBindKey("Alt-4", "lua:microzim.h4",false);
	config.TryBindKey("Alt-5", "lua:microzim.h5",false);
	config.TryBindKey("Alt-t", "lua:microzim.verbatim",false);
  --  config.AddRuntimeFile("manipulator", config.RTHelp, "help/manipulator.md")
end
