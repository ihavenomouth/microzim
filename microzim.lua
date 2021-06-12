VERSION = "0.1.0"

local micro = import("micro")
local config = import("micro/config")
local buffer = import("micro/buffer")
local util = import("micro/util")

function header()
   local buf = micro.CurPane().Buf
   local c = micro.CurPane().Cursor

   buf:Insert( buffer.Loc(0, 0),  "Content-Type: text/x-zim-wiki\n")
   buf:Insert( buffer.Loc(0, 1),  "Wiki-Format: zim 0.6\n")
   --buf:Insert( buffer.Loc(0, 2),  "Creation-Date: 2020-02-06T09:31:36+01:00\n")
end


function verbatim()
	local buf = micro.CurPane().Buf
	local c = micro.CurPane().Cursor
	
	if c:HasSelection() then
		local inicio, fin = nil, nil
		if c.CurSelection[1]:GreaterThan(-c.CurSelection[2]) then
			inicio = c.CurSelection[2]
			fin = c.CurSelection[1]
		else
			inicio = c.CurSelection[1]
			fin = c.CurSelection[2]
		end

      -- Si tenemos más de una línea seleccionada o no
      if inicio.Y == fin.Y then
         local seleccion = c:GetSelection() --devuelve array de bytes
         local texto = util.String(seleccion)
         micro.InfoBar():Message( "Texto afectado: " .. texto )
         
         texto = "\'\'" .. texto .. "\'\'";
         LocInicio = buffer.Loc(inicio.X, inicio.Y)
         LocFin    = buffer.Loc(fin.X, fin.Y)
         buf:Replace(LocInicio, LocFin, texto)
      else
   		local a = buffer.Loc(0, inicio.Y)
   		local b = buffer.Loc(0, fin.Y)
   		local marca = "\'\'\'"

   		micro.InfoBar():Message( "Líneas afectadas: " .. inicio.Y .. " - " ..  fin.Y)

   		buf:Insert( b, marca .. "\n")
   		buf:Insert( a, marca .. "\n")
   	end
	else
		micro.InfoBar():Message( "Ninguna línea seleccionada")
	end
end


function italic()
	italicOrBoldAuxiliar("//")
end

function bold()
   italicOrBoldAuxiliar("**")
end


function italicOrBoldAuxiliar(marca)
	local buf = micro.CurPane().Buf
	local c = micro.CurPane().Cursor
	
	if c:HasSelection() then
		local inicio, fin = nil, nil
		if c.CurSelection[1]:GreaterThan(-c.CurSelection[2]) then
			inicio = c.CurSelection[2]
			fin = c.CurSelection[1]
		else
			inicio = c.CurSelection[1]
			fin = c.CurSelection[2]
		end

      -- Si tenemos más de una línea seleccionada o no
      if inicio.Y == fin.Y then
         local seleccion = c:GetSelection() --devuelve array de bytes
         local texto = util.String(seleccion)
         micro.InfoBar():Message( "Texto afectado: " .. texto )
         
         texto = marca .. texto .. marca;
         LocInicio = buffer.Loc(inicio.X, inicio.Y)
         LocFin    = buffer.Loc(fin.X, fin.Y)
         buf:Replace(LocInicio, LocFin, texto)
      else
   		micro.InfoBar():Message( "Error: Más de una línea seleccionada")
   	end
	else
		micro.InfoBar():Message( "Error: Nada seleccionado")
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
   config.MakeCommand("h2", h2, config.NoComplete)
   config.MakeCommand("h3", h3, config.NoComplete)
   config.MakeCommand("h4", h4, config.NoComplete)
   config.MakeCommand("h5", h5, config.NoComplete)
   config.MakeCommand("verbatim", verbatim, config.NoComplete)
   config.MakeCommand("header"  , header,   config.NoComplete)
   config.MakeCommand("bold"    , bold,     config.NoComplete)
   config.MakeCommand("italic"  , italic,   config.NoComplete)

   config.TryBindKey("Alt-1", "lua:microzim.h1",false)
   config.TryBindKey("Alt-2", "lua:microzim.h2",false)
   config.TryBindKey("Alt-3", "lua:microzim.h3",false)
   config.TryBindKey("Alt-4", "lua:microzim.h4",false)
   config.TryBindKey("Alt-5", "lua:microzim.h5",false)
   config.TryBindKey("Alt-t", "lua:microzim.verbatim",false)
   config.TryBindKey("Alt-h", "lua:microzim.header",false)
   config.TryBindKey("Alt-b", "lua:microzim.bold",false)
   config.TryBindKey("Alt-i", "lua:microzim.italic",false)
   -- config.AddRuntimeFile("microzim", config.RTHelp, "help/microzim.md")
end

