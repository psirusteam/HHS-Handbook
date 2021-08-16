# Análisis de flujos brutos

Existen ventajas marcadas a la hora de analizar datos que provienen de levantamientos longitudinales. @Lynn_2009 menciona que la más común de ellas es la posibilidad de realizar análisis de los fujos brutos. Con los levantamientos longitudinales es posible establecer el estado de una unidad observacional en varios periodos consecutivos. Esto permite descomponer los cambios netos que uno podría encontrar en las encuestas transversales. Por ejemplo, a partir de los levantamientos transversales (puntuales en un trimestre), la ECE permite estimar el cambio en las diferentes clasificaciones del mercado de trabajo, de un periodo a otro. Pero con la parte longitudinal de la ECE en ambos periodos, es posible descomponer estas clasificaciones. A partir de este análisis es posible identificar si son exactamente los mismos ocupados los que entran al mercado de trabajo en dos ciclos económicos de interés. 

Por último, cabe resaltar que el esquema de ponderación longitudinal tratado en esta misión no da cuenta de los datos censurados (unidades que salieron de la muestra longitudinal), y por ende solo contempla el ajuste de las bases de datos con respuesta completa. Ante el requerimiento, es posible crear este tipo de bases longitudinales censuradas que podrían ser utilizadas en análisis más complejos que incluyen la modelación de la ausencia de respuesta como en los desarrollos de @Feinberg_Stasny_1983 y @Gutierrez_Trujillo_Silva_2014.

## Matrices de transición

La inferencia realizada en la estimación de parámetros mediante encuestas de hogares recae en el diseño de muestreo que se utilizó para seleccionar una muestra de elementos de la población. Por lo general, en términos de la obtención de estadísticas oficiales, el diseño de muestreo utilizado no es simple, puesto que, por la complejidad de la estructura poblacional, es necesario recurrir a técnicas especializadas, que permiten la apropiada consecución de la información en la muestra. En muchas ocasiones, el diseño de muestreo complejo de las encuestas de hogares está supeditado a la estratificación de las unidades cartográficas del marco de muestreo, y a la posterior selección multietápica de unidades de muestreo, usualmente con probabilidades de inclusión desiguales y proporcionales al número de habitantes de las áreas en las que se divide el marco de muestreo.

Después de haber seleccionado una muestra probabilística, es común recurrir a la clasificación de los elementos de la población en diferentes categorías de una o más variables nominales. Dicha clasificación se puede convertir en una tabla de contingencias si se resumen simultáneamente dos variables o, los cambios en el comportamiento de una misma variable en dos periodos de tiempo. Este es el caso de la estimación de los cambios brutos entre diferentes estados de clasificación para dos periodos.  En particular, este problema de estimación es fundamental para la implementación de políticas públicas en el mercado laboral.

Como ya se ha discutido a profundidad, muchas encuestas por muestreo a gran escala en la región utilizan diseños del tipo panel rotativo donde los individuos son entrevistados varias veces antes de ser rotados y excluidos fuera de la muestra. Estas encuestas a gran escala son utilizadas para producir estimaciones puntuales en el tiempo de manera continua, mensual y trimestral. Además, su estructura de seguimiento en panel nace de la necesidad de mantener una estructura suavizada en los cambios coyunturales del fenómeno de interés, además de poder reducir costos manteniendo los mismos entrevistados y objetivos por más de una entrevista. 

Debido a los efectos de la pandemia de la COVID-19 y en particular a las diferentes restricciones de movilidad que se promovieron desde los gobiernos de los países de la región (cuarentenas obligatorias y toques de queda), la forma de recolectar la información en las encuestas de hogares tuvo que ser modificada y se cambiaron abruptamente los levantamientos presenciales por levantamientos telefónicos que indujeron tasas de respuesta bajas que eventualmente indujeron nuevos procesos estadísticos en el ajuste de los factores de expansión con el fin de identificar y eliminar lo posibles sesgos potenciales que pudieron introducirse.

Por ende, es natural contemplar la posibilidad de que para estos tipos de levantamientos la ausencia de respuesta no necesariamente sea completamente aleatoria. De hecho, muy probablemente, la ausencia de respuesta podría depender del estado de clasificación en la ocupación (por ejemplo, que los desempleados conformen la mayoría de no respondientes), y que las estimaciones de los cambios brutos deban contemplar correcciones ante posibles sesgos.

## Modelos de Markov

Al considerar el problema de la estimación de los cambios brutos entre dos periodos de tiempo, obtenidos de una investigación sobre la población de interés, y teniendo en cuenta que existe ausencia de respuesta no ignorable, es posible suponer que el resultado de cada entrevista corresponde a la clasificación del respondiente en una de $G$ posibles categorías excluyentes. Por ende, uno de los objetivos de la investigación podría ser la estimación del cambio bruto entre estas categorías utilizando la información de los individuos que fueron entrevistados en dos periodos de tiempo consecutivos. 

Es claro que los individuos que fueron no respondientes en uno o ambos periodos o fueron incluidos o excluidos de la muestra entre estos dos tiempos no tienen una clasificación definida entre las categorías. De esta forma, se tiene un grupo de individuos con clasificación en ambos tiempos, un grupo de individuos que solo tiene clasificación en uno de los dos tiempos, y un grupo de individuos que no respondieron la encuesta en ningún periodo de tiempo, y por ende nunca fueron clasificados.

Para el primer grupo de individuos que respondieron en los tiempos $t-1$ y $t$, los datos de clasificación pueden ser resumidos en una matriz de tamaño $G\times G$. La información disponible para los individuos que fueron no respondientes para la encuesta del tiempo $t-1$, pero sí respondieron en el tiempo $t$, puede ser resumida en un complemento columna; mientras que la información para los individuos que no respondieron en el tiempo $t$, pero sí respondieron en el tiempo $t-1$, puede ser resumida en un complemento fila. Finalmente, los individuos que no respondieron en ningún tiempo son incluidos en una única celda de faltantes.

Las anteriores relaciones se ilustran en la tabla \ref{t1}, en donde $N_{ij}$ ($i,j=1,\ldots,G$) denota el número de individuos respondientes que tienen clasificación $i$ en el tiempo $t-1$ y $j$ en el tiempo $t$, $R_i$ denota el número de individuos que fueron no respondientes en el tiempo $t$ y tienen clasificación $i$ en el tiempo $t-1$, $C_j$ denota el número de individuos que fueron no respondientes en el tiempo $t-1$ y tuvieron clasificación $j$ en el tiempo $t$, y $M$ denota el número de individuos seleccionados que no respondieron en ningún tiempo. En este estudio particular se consideran cuatro estados de clasificación (ocupados formales, ocupados informales, desocupados, inactivos) - por ende $G = 4$ - en dos periodos consecutivos de tiempo $t-1$, primer trimestre del 2020 y $t$, segundo trimestre del 2020.

\begin{table}[!h]
\centering
\begin{tabular}{cccccc}
Trimestre I-2020	&\multicolumn{5}{c}{Trimestre II-2020}\\\cline{2-6}
&Formal&Informal&Desocupado&Inactivo&Complemento fila\\\hline
Formal&$N_{11}$&$N_{12}$&$N_{13}$&$N_{14}$&$R_1$\\
Informal&$N_{21}$&$N_{22}$&$N_{23}$&$N_{24}$&$R_2$\\
Desocupado&$N_{31}$&$N_{32}$&$N_{33}$&$N_{34}$&$R_3$\\
Inactivo&$N_{41}$&$N_{42}$&$N_{43}$&$N_{44}$&$R_4$\\ \\
Complemento columna&$C_1$&$C_2$&$C_3$&$C_4$&$M$\\\hline
\end{tabular}
\caption{\emph{Cambio bruto en dos periodos consecutivos.}}
\label{t1}
\end{table}

El análisis de los datos contempla la inclusión precisa de la estrategia de muestreo de la encuesta, que involucra el diseño de muestreo complejo (usualmente estratificado y multietápico) y el uso de un estimador insesgado y calibrado, cuyos pesos $w_k$ reproducen con exactitud el tamaño de la población proyectada $N$, de tal forma que 

$$
\hat{N}=\sum_s w_k  = N
$$

Siguiendo las consideraciones de @Feinberg_Stasny_1983 se asume que los datos son el resultado de un proceso de dos etapas. En la primera etapa (proceso no observable), los individuos son ubicados dentro de las celdas de una matriz $G\times G$ de acuerdo con las probabilidades de una cadena de Markov, con los siguientes parámetros:

1. $\eta_i$, la probabilidad inicial de que un individuo esté en el estado $i$ en el tiempo $t-1$. 
1. $p_{ij}$, la probabilidad de transición desde el estado $i$ al estado $j$.

Nótese que en esta primera etapa los parámetros deben cumplir con las siguientes restricciones: $\sum_i\eta_i=1$ y $\sum_jp_{ij}=1$ para todo $i$. 

En la segunda etapa (proceso observable), cada individuo en la celda $ij$ de la matriz puede ser no respondiente en el tiempo $t-1$ y perder la clasificación por fila, o ser no respondiente en el tiempo $t$ y perder la clasificación columna, o bien, ser no respondiente en ambos tiempos y perder ambas clasificaciones. Por ende, se genera una estructura probabilística con los siguientes parámetros:

1. $\psi(i,j)$, la probabilidad inicial de que un individuo en la celda $ij$ responda en el tiempo $t-1$.
1. $\rho_{RR}(i,j)$, la probabilidad de transición de que un individuo en la celda $ij$ pase de ser respondiente en el tiempo $t-1$ a ser respondiente en el tiempo $t$.
1. $\rho_{MM}(i,j)$, la probabilidad de transición de que un individuo en la celda $ij$ pase de ser no respondiente en el tiempo $t-1$ a ser no respondiente en el tiempo $t$. 

Como se puede notar las probabilidades del proceso observables dependen del estado de clasificación del individuo. Para estimar todos los parámetros involucrados, se consideraron los siguientes modelos reducidos, explicados a continuación:

- Modelo A: considera que la probabilidad inicial de que un individuo sea respondiente en el tiempo $t-1$ es la misma para todas las clasificaciones contempladas en la encuesta, es decir $\psi(i,j)=\psi$. Las probabilidades de transición entre respondientes y entre no respondientes no dependen de la clasificación del individuo en la encuesta, es decir $\rho_{MM}(i,j)=\rho_{MM}$ y $\rho_{RR}(i,j)=\rho_{RR}$. Es decir que la probabilidad de respuesta es la misma para formales, informales, inactivos e desocupados; asimismo las probabilidades de transición son las mismas para las diferentes clasificaciones. 
- Modelo B: considera que la probabilidad inicial de que un individuo sea respondiente en el tiempo $t-1$ depende de su clasificación en el tiempo $t-1$, es decir $\psi(i,j)=\psi(i)$. De la misma manera que en el modelo A, las probabilidades de transición entre respondientes y entre no respondientes no dependerán de la clasificación del individuo en la encuesta, es decir $\rho_{MM}(i,j)=\rho_{MM}$ y $\rho_{RR}(i,j)=\rho_{RR}$. Es decir que la probabilidad de respuesta difiere entre formales, informales, inactivos e desocupados; asimismo las probabilidades de transición son las mismas para las diferentes clasificaciones.
- Modelo C: asume que la probabilidad inicial de que un individuo sea respondiente en el tiempo $t-1$ es la misma para todas las clasificaciones contempladas en la encuesta, es decir $\psi(i,j)=\psi$. Sin embargo, las probabilidades de transición entre respondientes y entre no respondientes dependerán de la clasificación del individuo en el periodo $t-1$; es decir $\rho_{MM}(i,j)=\rho_{MM}(i)$ y $\rho_{RR}(i,j)=\rho_{RR}(i)$. Es decir que la probabilidad de respuesta es la misma para formales, informales, inactivos e desocupados; asimismo las probabilidades de transición difieren para las diferentes clasificaciones en el tiempo inicial.
- Modelo D: asume que la probabilidad inicial de que un individuo sea respondiente en el tiempo $t-1$ es la misma para todas las clasificaciones contempladas en la encuesta, es decir $\psi(i,j)=\psi$. Sin embargo, las probabilidades de transición entre respondientes y entre no respondientes dependerán de la clasificación del individuo en el periodo $t$; es decir $\rho_{MM}(i,j)=\rho_{MM}(j)$ y $\rho_{RR}(i,j)=\rho_{RR}(j)$. Es decir que la probabilidad de respuesta es la misma para formales, informales, inactivos e desocupados; asimismo las probabilidades de transición difieren para las diferentes clasificaciones en el tiempo final.

## Estimación de las matrices de transición

Por ejemplo, usando los datos de la Encuesta Nacional de Empleo de Chile, para la primera mitad del año 2020, es posible establecer las debidas comparaciones en los dos trimestres de referencia, estableciendo la clasificación en el panel dada por la tabla \ref{t2}. Nótese que la suma de todas las entradas de la tabla de clasificación da como resultado el número de personas en el panel reconstruido, es decir 41274 individuos. El ajuste de los modelos de ausencia de respuesta fue realizado siguiendo los algoritmos de estimación propuestos en @Gutierrez_2014, utilizando la versión 0.2.2 del paquete computacional `surf` implementado en el software estadístico `R` [@Jacob_2020]. 

\begin{table}[!h]
\centering
{\footnotesize
\begin{tabular}{cccccc}
Trimestre I-2020 &\multicolumn{5}{c}{Trimestre II-2020}\\\cline{2-6}
                    &Formal    &Informal     &Desocupado   &Inactivo   &Complemento fila\\\hline
Formal              &11483       &718             &592        &1828                  &451\\
Informal            &703         &2513            &495        &2769                   &198\\
Desocupado            &191        &181             &503       &794                  &81\\
Inactivo          &364          &641              &388         &15386                &382\\ \\
Complemento columna &160        &65             &48        &257                 &83 \\\hline
\end{tabular}
}
\caption{\emph{Tabla de clasificación laboral y de respuesta para el estado de ocupación en la muestra de la ENE.}}
\label{t2}
\end{table}

La escogencia del mejor modelo se llevó a cabo utilizando la estadística de ajuste $\chi^2$, calculada sobre la distancia entre los valores observados y los valores predichos por el modelo. En estos términos, el mejor modelo fue el C, puesto que minimizaba esta distancia con un valor de $\chi^2 = 0,706$. Recuérdese que este modelo considera que la probabilidad inicial de que un individuo sea respondiente en el primer trimestre de 2020 es la misma para todas las clasificaciones contempladas en la encuesta, es decir $\psi(i,j)=\psi$. Sin embargo, las probabilidades de transición entre respondientes y no respondientes dependerán de la clasificación del individuo en el primer trimestre de 2020; es decir $\rho_{MM}(i,j)=\rho_{MM}(i)$ y $\rho_{RR}(i,j)=\rho_{RR}(i)$. Bajo estos supuestos, se calculó la estimación poblacional, insesgada con respecto al diseño de muestreo complejo de la ENE, de los cambios brutos para el nivel de ocupación.

\begin{table}[!h]
\centering
{\footnotesize
\begin{tabular}{lllll}
Trimestre I-2020&\multicolumn{4}{c}{Trimestre II-2020}\\\cline{2-5}
                    	& Formal    		        & Informal		    &Desocupado			&Inactivo   \\\hline
Formal             	& 4.627.632 (102.470) 	& 287.124 (18.979) 	& 252.084 (20.399) 	& 713.284 (30.358) \\
Informal          	& 327.066 (33.292) 	    & 911.996 (45.645) 	& 210.372 (16.508) 	& 1.022.351 (50.332) \\
Desocupado            	& 79.346 (10.592) 	    & 72.944 (8.858) 	  & 230.949 (21.180)	& 335.746 (28.023) \\
Inactivo    	& 143.303 (11.192) 		  & 227.545 (15.849)  & 140.923 (10.550) 	& 6.014.907 (123.559) \\\hline
\end{tabular}
\caption{\emph{Estimación del cambio bruto poblacional en dos mediciones para la condición de ocupación en la ENE. Los errores estándar se muestran entre paréntesis.}}}
\label{t3}
\end{table}

El modelo C considera que los parámetros de la primera etapa del proceso (no observable) están definidos como las probabilidades de transición de una clasificación a otra en los periodos de observación. Estas estimaciones definen las matrices de transición laboral, que para los periodos estudiados corresponden a las entradas de la tabla \ref{t4}. En particular se resalta el hecho de que el 12,1% de los trabajadores formales pasaron directamente a la inactividad; mientras que el impacto fue mayor en los trabajadores informales y en los desocupados, de los cuales el 41,3% y el 46,6% pasaron a la inactividad, respectivamente. Además, en los periodos estudiados, el 92,1% de los individuos inactivos siguió en este estado.

\begin{table}[!h]
\centering
\begin{tabular}{lllll}
Trimestre I-2020&\multicolumn{4}{c}{Trimestre II-2020}\\\cline{2-5}
                    		& Formal    		&Informal		&Desocupado   		&Inactivo   		\\\hline
Formal             	& 0.787 (0.010) 	& 0.048 (0.003) 	& 0.042 (0.003) 	& 0.121 (0.004) 		\\
Informal          	& 0.132 (0.012) 	& 0.368 (0.013) 	& 0.085 (0.005) 	& 0.413 (0.013) 				\\
Desocupado            & 0.110 (0.012) 	& 0.101 (0.010) 	& 0.321 (0.021) 	& 0.466 (0.025) 		\\
Inactivo    	    & 0.021 (0.001) 	& 0.034 (0.002) 	& 0.021 (0.001) 	& 0.921 (0.010) 		\\\hline
\end{tabular}
\caption{\emph{Estimación de las probabilidades de transición $p_{ij}$. Los errores estándar se muestran entre paréntesis.}}
\label{t4}
\end{table}

Por otro lado, las probabilidades iniciales de clasificación en el primer periodo de interés se encuentran en la tabla \ref{t5}, en la que también se observan las probabilidades de transición de los no respondientes y las probabilidades de transición de los respondientes, diferenciadas por condición de ocupación en el primer trimestre de 2020. Nótese que la probabilidad inicial de respuesta se estimó en $\hat{\psi}=0.981 (0.002)$ para todas las clasificaciones de la condición de ocupación. Se puede notar que, dado que $1-\hat{\rho}_{MM}$ indica la probabilidad de que un individuo responda en el segundo trimestre de 2020 dado que no respondió en el primer trimestre de 2020, condicionado a cada condición de ocupación, entonces las personas informales e inactivas son más propensos a no responder en ambos periodos, por lo que habría indicios de un patrón de ausencia de respuesta no ignorable que el modelo ha logrado identificar correctamente.

\begin{table}[!h]
\centering
\begin{tabular}{lccc}
\hline 
Trimestre I-2020 	& $\hat{\eta}$ 		& $\hat{\rho}_{RR}$ & $\hat{\rho}_{MM}$ \\ \hline 
Formal   			    & 0.376 (0.004)	& 0.963 (0.004)		& 0.304 (0.104) \\
Informal 		      & 0.158 (0.003)	& 0.967 (0.004)		& 0.000 (0.261) \\
Desocupado 			    & 0.046 (0.002)	& 0.949 (0.008)		& 0.000 (0.188) \\
Inactivo 	      & 0.418 (0.004)	& 0.975 (0.002)		& 0.017 (0.086) \\ \hline
\end{tabular}
\caption{\emph{Estimación de las probabilidades de clasificación y respuesta $\hat{\eta}$, $\hat{\rho}_{RR}$ y $\hat{\rho}_{MM}$. Los errores estándar se muestran entre paréntesis.}}
\label{t5}
\end{table}

## Estimación de la transición en subpoblaciones de interés

Por último, para establecer si hay diferencias importantes en el impacto que la pandemia causó en el mercado laboral chileno entre hombre y mujeres. Para realizar estas comparaciones se ajustó el modelo C en cada una de las subpoblaciones, encontrando ajustes precisos y satisfactorios con $\chi^2_{hombres} = 0,350$ y $\chi^2_{hombres} = 0,470$. La estimación de la probabilidad inicial de respuesta en ambos casos se calculó en $\hat{\psi}=0.981 (0.002)$, y las estimaciones de las probabilidades $\hat{\eta}$ y $\hat{\rho}_{RR}$ no tuvieron cambios significativos entre los grupos. Sin embargo, la estimación de las probabilidades $\hat{\rho}_{MM}$ mostró diferencias entre hombres y mujeres que fueron clasificados como trabajadores formales y inactivos en el primer trimestre del 2020. En particular, para el grupo de trabajadores formales, $\hat{\rho}_{MM}^{hombre} = 0,253$, mientras que $\hat{\rho}_{MM}^{mujer} = 0,331$, lo cual indica que las mujeres formales eran más propensas a no responder en el segundo trimestre de 2020, comparadas con los hombres. Por otro lado, para el grupo de inactivos, $\hat{\rho}_{MM}^{hombre} = 0,112$, mientras que $\hat{\rho}_{MM}^{mujer} = 0,000$, lo cual indica que las mujeres desocupadas definitivamente tuvieron una menor probabilidad a no responder en el segundo trimestre de 2020 que los hombres.

La estimación de las matrices de transición para ambos subgrupos poblacionales se muestra en las tablas \ref{t6a} y \ref{t6b}. Es importante resaltar que, según las estimaciones resultantes de este análisis, la peor parte se la llevaron las mujeres. Nótese que, para los trabajadores formales, existe una diferencia importante entre hombres y mujeres, siendo los primeros los menos afectados al pasar a la inactividad: 10,2% para los hombres, 14,5% para las mujeres. Este mismo fenómeno se presenta con más fuerza en el grupo de los trabajadores informales, en donde el 36,2% de los hombres pasó a la inactividad, mientras que el 46,9% de las mujeres pasó a la inactividad. De la misma forma, dentro de los individuos desocupados, un mayor porcentaje de mujeres pasó de la desocupación a la inactividad: 39,2% de hombres, contra un 53,4% de mujeres. Finalmente, el porcentaje de personas que siguió en la inactividad es mayor en las mujeres: 90,2% para los hombres, frenta a un 93,1% para las mujeres.

\begin{table}[!h]
\centering
\begin{tabular}{lllll}
Trimestre I-2020&\multicolumn{4}{c}{Trimestre II-2020}\\\cline{2-5}
                    		& Formal    		&Informal		&Desocupado   		&Inactivo   		\\\hline
Formal             	& 0.791 (0.013) 	& 0.056 (0.004) 	& 0.049 (0.005) 	& 0.102 (0.005) 		\\
Informal          	& 0.138 (0.011) 	& 0.403 (0.018) 	& 0.095 (0.008) 	& 0.362 (0.017) 				\\
Desocupado            & 0.146 (0.025) 	& 0.118 (0.017) 	& 0.343 (0.031) 	& 0.392 (0.037) 		\\
Inactivo    	    & 0.031 (0.004) 	& 0.036 (0.003) 	& 0.030 (0.003) 	& 0.902 (0.021) 		\\\hline
\end{tabular}
\caption{\emph{Estimación de las probabilidades de transición $p_{ij}$ para los hombres. Los errores estándar se muestran entre paréntesis.}}
\label{t6a}
\end{table}

\begin{table}[!h]
\centering
\begin{tabular}{lllll}
Trimestre I-2020&\multicolumn{4}{c}{Trimestre II-2020}\\\cline{2-5}
                    		& Formal    		&Informal		&Desocupado   		&Inactivo   		\\\hline
Formal             	& 0.781 (0.010) 	& 0.039 (0.003) 	& 0.033 (0.003) 	& 0.145 (0.007) 		\\
Informal          	& 0.125 (0.012) 	& 0.331 (0.017) 	& 0.073 (0.007) 	& 0.469 (0.018) 				\\
Desocupado            & 0.078 (0.012) 	& 0.086 (0.012) 	& 0.301 (0.028) 	& 0.534 (0.036) 		\\
Inactivo    	    & 0.017 (0.001) 	& 0.034 (0.002) 	& 0.017 (0.001) 	& 0.931 (0.013) 		\\\hline
\end{tabular}
\caption{\emph{Estimación de las probabilidades de transición $p_{ij}$ para las mujeres. Los errores estándar se muestran entre paréntesis.}}
\label{t6b}
\end{table}
