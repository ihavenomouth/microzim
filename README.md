# MicroZim

Un plugin de ZIM-Wiki muy sencillo para Micro-editor.  

A very simple ZIM-Wiki plugin for Micro-editor.  


Micro github: [https://github.com/zyedidia/micro]
ZIM website: [https://zim-wiki.org/index.html]  
ZIM github: [https://github.com/zim-desktop-wiki/zim-desktop-wiki]  


## ¿Por qué?

Uso ZIM a diario y micro editor es mi editor por defecto en la terminal. ZIM tiene los mismos atajos de teclado para los encabezados que LibreOffice Writer, otro fantástico programa de software libre con el que estoy familiarizado. En resumen, era una pena que no tuviera una manera cómoda de editar ficheros creados con ZIM (o crearlos directamente) desde la terminal usando micro.

## Why?

I've been using ZIM on a daily basis for years and micro is my choice to edit texts in the terminal. ZIM has the same keyboard shortcuts for the headings as LibreOffice Writer, another superb free software I'm very used to. It was a pity not to have a comfortable way to edit ZIM files in micro.


# Instalación / Installation

Copia los ficheros a ~/.config/micro/plug/microzim (tendrás que crear ese directorio)  

Copy the files file into ~/.config/micro/plug/microzim (you'll ned to create the directory)


# Teclas por defecto / Default binding keys

## Español

* Alt+1 es encabezado de nivel 1
* Alt+2 es encabezado de nivel 2
* Alt+3 es encabezado de nivel 3
* Alt+4 es encabezado de nivel 4
* Alt+5 es encabezado de nivel 5
* Alt+t hará que el texto seleccionada sea verbatim (tal cual, al pie de la letra, literalmente)
* Alt+h añadirá la cabecera de Zim-wiki al fichero
* Alt+b hará que las palabras selecionadas se conviertan en negritas
* Alt+i hará que las palabras selecionadas se conviertan en cursivas

Algunos de estos atajos de teclado pueden estar ya en uso en tu terminal (o en tu sistema). Cámbialas si lo necesitas.  

Por otro lado, siempre puedes usar las siguientes órdenes en micro (pulsa Ctrl+E y escribe la orden):  
* h1
* h2
* h3
* h4
* h5
* verbatim
* header
* bold
* italic


## English

* Alt+1 is heading 1
* Alt+2 is heading 2
* Alt+3 is heading 3
* Alt+4 is heading 4
* Alt+5 is heading 5
* Alt+t will render the selected paragraphs (or words) as verbatim
* Alt+h will create the Zim-wiki header
* Alt+b will render the selected words as bold
* Alt+i will render the selected words as italic

Some of these shortcuts can be already in use by your terminal emulator. You can change them if you need to.  

On the other hand, you can use the following commands inside micro:  
* h1
* h2
* h3
* h4
* h5
* verbatim
* header
* bold
* italic


# Cositas 

* Tanto las negritas como las cursivas sólo pueden ser utilizadas sobre palabras de la misma línea (ZIM permite una mayor flexiblidad, pero requiere más tiempo del que me parece razonable dedicarle a esto). El funcionamiento actual es más que suficiente para mí, pero oye, mejóralo tú si quieres.  
* Tanto los comentarios en el código como en la barra de estado de ZIM están en español, siénte libre de adaptarlo a tus necesidades lingüísticas.  
* Esto es sólo un proyecto personal y tal cual está es útil para mí y satisface mis necesidades (que evidentemente son las más importantes para mí), de modo que es bastante improbable que el proyecto evolucione mucho más.
* Además, no tengo precisamente mucha idea del lenguaje LUA. Literalmente esta es la primera vez que tengo que tocarlo. No lo he disfrutado demasiado, la verdad sea dicha.
* ZIM es una herramienta fantástica, uno de los programas más útils que he usado. Si no lo conoces, pruébalo. Eso sí, el esquema de colores por defecto es horrible, cámbialo en cuanto puedas.


## Some notes

* Bold and italic can only be used on words of the same line. That's more than enough for me, but feel free to improve it.
* Comments in Spanish in the code and in the status bar messages. Should you have any issue, feel free to change it.  
* This is just a personal project and the way it is right now is more than enough for my needs, so it's not likely to be devoloped much further any time soon.  
* To top it all, I have no clue about the LUA programming language. This is the first time I had to use it. I didn't enjoy it a lot.  
* ZIM is a superb tool, one of the most useful program I've ever used. If you don't use it yet: try it. But the default color scheme is awful, you'll need to change it.  


# TODO
* Help file inside micro
* Bugs corrections
* Send to Plugin Channel [https://github.com/micro-editor/plugin-channel]