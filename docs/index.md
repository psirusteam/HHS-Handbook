--- 
title: "Diseño y análisis estadístico en las encuestas de hogares de América Latina"
author: "Andrés Gutiérrez^[Experto Regional en Estadísticas Sociales - Comisión Económica para América Latina y el Caribe (CEPAL) -  andres.gutierrez@cepal.org]"
date: "2022-09-28"
documentclass: book
bibliography: [CEPAL.bib]
biblio-style: apalike
link-citations: yes
colorlinks: yes
lot: yes
lof: yes
fontsize: 12pt
geometry: margin = 2cm
header-includes: \usepackage[spanish, spanishkw, onelanguage, linesnumbered, amsmath]{}
github-repo: psirusteam/HHS-Handbook
description: "Este es el repositorio del libro *Diseño y análisis estadístico en las encuestas de hogares de América Latina*."
knit: "bookdown::render_book"
lang: es
linkcolor: blue
output:
  pdf_document:
    toc: true
    toc_depth: 3
    keep_tex: true
  gitbook:
    df_print: kable
    css: "style.css"
# Compilar así:
# bookdown::render_book("index.Rmd", "bookdown::pdf_book")
# bookdown::render_book("index.Rmd", "bookdown::epub_book")
# bookdown::render_book("index.Rmd", "bookdown::word_document2")
# bookdown::preview_chapter("01.Rmd", "bookdown::word_document2")
---



# Prefacio {-}


\begin{figure}
\includegraphics[width=100px]{Pics/CClicence} \caption{Licencia de Creative Commons}(\#fig:unnamed-chunk-1)
\end{figure}

La versión online de este libro está licenciada bajo una [Licencia Internacional de Creative Commons para compartir con atribución no comercial 4.0](http://creativecommons.org/licenses/by-nc-sa/4.0/). 

La coordinación sustantiva de la colección Metodologías de la CEPAL está a cargo de Rolando Ocampo, Director de la División de Estadísticas de la Comisión Económica para América Latina y el Caribe (CEPAL). 

Esta publicación es el resultado de un proceso de varios años de investigación e interacción con los países miembros en diversas asistencias técnicas concernientes con el diseño, rediseño y análisis posterior de las encuestas de hogares. Dicho proceso fue llevado a cabo por la División de Estadísticas de la CEPAL, bajo la coordinación de Rolando Ocampo, Director de la División de Estadísticas y de Xavier Mancero, Jefe de la Unidad de Estadísticas Sociales. 

La redacción del documento estuvo a cargo de Andrés Gutiérrez, Asesor Regional en Estadísticas Sociales de la CEPAL. Las metodologías presentadas en este documento se han beneficiado de los valiosos aportes y sugerencias de funcionarios de la CEPAL, así como del personal de las Oficinas Nacionales de Estadística de los países beneficiarios de las asistencias técnicas durante los años entre 2017 y 2022. El autor agradece a Simone Ceccini y a Xavier Mancero por la lectura detallada de este documento y sus comentarios.
