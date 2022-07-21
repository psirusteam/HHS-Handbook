# Análisis de flujos brutos

Existen ventajas marcadas a la hora de analizar datos que provienen de levantamientos longitudinales. @Lynn_2009 menciona que la más común de ellas es la posibilidad de realizar análisis de los fujos brutos. Con los levantamientos longitudinales es posible establecer el estado de una unidad observacional en varios periodos consecutivos. Esto permite descomponer los cambios netos que uno podría encontrar en las encuestas transversales. Por ejemplo, a partir de los levantamientos transversales (puntuales en un trimestre), en una encuesta con diseño rotativo es posible estimar el cambio en las diferentes clasificaciones del mercado de trabajo, de un periodo a otro. En efecto, usando la parte longitudinal de la encuesta en ambos periodos, es posible descomponer estas clasificaciones. A partir de este análisis es posible identificar si son exactamente los mismos ocupados los que entran al mercado de trabajo en dos ciclos económicos de interés. 

Un problema común que se encuentra en este tipo de encuesta es la ausencia de respuesta, que rara vez se puede considerar como aleatoria o ignorable. Si la ausencia de respuesta depende del estado ocupacional (por ejemplo, las tasas de ausencia de respuesta son más altas entre los desempleados), las estimaciones ingenuas de los cambios brutos podrían estar sesgadas. Si el enfoque corrige la ausencia de respuesta pero ignora las complejas características del diseño de muestreo, también habrá problemas de sesgo. 


## Matrices de transición

La inferencia realizada en la estimación de parámetros mediante encuestas de hogares recae en el diseño de muestreo que se utilizó para seleccionar una muestra de elementos de la población. Por lo general, en términos de la obtención de estadísticas oficiales, el diseño de muestreo utilizado no es simple, puesto que, por la complejidad de la estructura poblacional, es necesario recurrir a técnicas especializadas, que permiten la apropiada consecución de la información en la muestra. En muchas ocasiones, el diseño de muestreo complejo de las encuestas de hogares está supeditado a la estratificación de las unidades cartográficas del marco de muestreo, y a la posterior selección multietápica de unidades de muestreo, usualmente con probabilidades de inclusión desiguales y proporcionales al número de habitantes de las áreas en las que se divide el marco de muestreo.

Después de haber seleccionado una muestra probabilística, es común recurrir a la clasificación de los elementos de la población en diferentes categorías de una o más variables nominales. Dicha clasificación se puede convertir en una tabla de contingencias si se resumen simultáneamente dos variables o, los cambios en el comportamiento de una misma variable en dos periodos de tiempo. Este es el caso de la estimación de los cambios brutos entre diferentes estados de clasificación para dos periodos.  En particular, este problema de estimación es fundamental para la implementación de políticas públicas en el mercado laboral.

Como ya se ha discutido a profundidad, muchas encuestas por muestreo a gran escala en la región utilizan diseños del tipo panel rotativo donde los individuos son entrevistados varias veces antes de ser rotados y excluidos fuera de la muestra. Estas encuestas a gran escala son utilizadas para producir estimaciones puntuales en el tiempo de manera continua, mensual y trimestral. Además, su estructura de seguimiento en panel nace de la necesidad de mantener una estructura suavizada en los cambios coyunturales del fenómeno de interés, además de poder reducir costos manteniendo los mismos entrevistados y objetivos por más de una entrevista. 

Debido a los efectos de la pandemia de la COVID-19 y en particular a las diferentes restricciones de movilidad que se promovieron desde los gobiernos de los países de la región (cuarentenas obligatorias y toques de queda), la forma de recolectar la información en las encuestas de hogares tuvo que ser modificada y se cambiaron abruptamente los levantamientos presenciales por levantamientos telefónicos que indujeron tasas de respuesta bajas que eventualmente indujeron nuevos procesos estadísticos en el ajuste de los factores de expansión con el fin de identificar y eliminar lo posibles sesgos potenciales que pudieron introducirse.

Por ende, es natural contemplar la posibilidad de que para estos tipos de levantamientos la ausencia de respuesta no necesariamente sea completamente aleatoria. De hecho, muy probablemente, la ausencia de respuesta podría depender del estado de clasificación en la ocupación (por ejemplo, que los desempleados conformen la mayoría de no respondientes), y que las estimaciones de los cambios brutos deban contemplar correcciones ante posibles sesgos.

## Modelos de Markov

Al considerar el problema de la estimación de los cambios brutos entre dos periodos de tiempo, obtenidos de una investigación sobre la población de interés, y teniendo en cuenta que existe ausencia de respuesta no ignorable, es posible suponer que el resultado de cada entrevista corresponde a la clasificación del respondiente en una de $G$ posibles categorías excluyentes. Por ende, uno de los objetivos de la investigación podría ser la estimación del cambio bruto entre estas categorías utilizando la información de los individuos que fueron entrevistados en dos periodos de tiempo consecutivos. La siguiente tabla ejemplifica la distribución (no observable) de los flujos brutos en una población.


| Estado (T1/T2)         | 1        | 2        | $\cdots$ | j        | $\cdots$ | G        |
|----------|----------|----------|----------|----------|----------|----------|
| 1        | $X_{11}$ | $X_{12}$ | $\cdots$ | $X_{1j}$ | $\cdots$ | $X_{1G}$ |
| 2        | $X_{21}$ | $X_{22}$ | $\cdots$ | $X_{2j}$ | $\cdots$ | $X_{2G}$ |
| $\vdots$ | $\vdots$ | $\vdots$ | $\ddots$ | $\vdots$ | $\ddots$ | $\vdots$ |
| i        | $X_{i1}$ | $X_{i2}$ | $\cdots$ | $X_{ij}$ | $\cdots$ | $X_{iG}$ |
| $\vdots$ | $\vdots$ | $\vdots$ | $\ddots$ | $\vdots$ | $\ddots$ | $\vdots$ |
| G        | $X_{G1}$ | $X_{G2}$ | $\cdots$ | $X_{Gj}$ | $\cdots$ | $X_{GG}$ |



En donde $X_{ij}$ es el número de unidades en la población finita clasificadas como $i$ en el tiempo $t-1$ y $j$ en el tiempo $t$ ($i,j=1,\ldots, G$). Siguiendo las consideraciones de @Feinberg_Stasny_1983 se asume que los datos son el resultado de un proceso de dos etapas. En la primera etapa (proceso no observable), los individuos son ubicados dentro de las celdas de una matriz $G\times G$ de acuerdo con las probabilidades de una cadena de Markov, con los siguientes parámetros:

1. $\eta_i$, la probabilidad inicial de que un individuo esté en el estado $i$ en el tiempo $t-1$. 
1. $p_{ij}$, la probabilidad de transición desde el estado $i$ al estado $j$.

Nótese que en esta primera etapa los parámetros deben cumplir con las siguientes restricciones: $\sum_i\eta_i=1$ y $\sum_jp_{ij}=1$ para todo $i$. 

Es claro que, una vez se realice la encuesta y se obtengan los datos de los levantamientos en ambos periodos, los individuos que fueron no respondientes en uno o ambos periodos o fueron incluidos o excluidos de la muestra entre estos dos tiempos no tienen una clasificación definida entre las categorías. De esta forma, se tiene un grupo de individuos con clasificación en ambos tiempos, un grupo de individuos que solo tiene clasificación en uno de los dos tiempos, y un grupo de individuos que no respondieron la encuesta en ningún periodo de tiempo, y por ende nunca fueron clasificados.

Para el primer grupo de individuos que respondieron en los tiempos $t-1$ y $t$, los datos de clasificación pueden ser resumidos en una matriz de tamaño $G\times G$. La información disponible para los individuos que fueron no respondientes para la encuesta del tiempo $t-1$, pero sí respondieron en el tiempo $t$, puede ser resumida en un complemento columna; mientras que la información para los individuos que no respondieron en el tiempo $t$, pero sí respondieron en el tiempo $t-1$, puede ser resumida en un complemento fila. Finalmente, los individuos que no respondieron en ningún tiempo son incluidos en una única celda de faltantes.

Las anteriores relaciones se ilustran en la siguiente tabla, en donde $N_{ij}$ ($i,j=1,\ldots,G$; $G=4$) denota el número de individuos respondientes que tienen clasificación $i$ en el tiempo $t-1$ y $j$ en el tiempo $t$, $R_i$ denota el número de individuos que fueron no respondientes en el tiempo $t$ y tienen clasificación $i$ en el tiempo $t-1$, $C_j$ denota el número de individuos que fueron no respondientes en el tiempo $t-1$ y tuvieron clasificación $j$ en el tiempo $t$, y $M$ denota el número de individuos seleccionados que no respondieron en ningún tiempo. En este estudio particular se consideran cuatro estados de clasificación (ocupados formales, ocupados informales, desocupados, inactivos) - por ende $G = 4$ - en dos periodos consecutivos de tiempo $t-1$, primer trimestre del 2020 y $t$, segundo trimestre del 2020.


| Estado (T1/T2)      | Formal   | Informal | Desocupado | Inactivo | Complemento fila |
|---------------------|----------|----------|------------|----------|------------------|
| Formal              | $N_{11}$ | $N_{12}$ | $N_{13}$   | $N_{14}$ | $R_1$            |
| Informal            | $N_{21}$ | $N_{22}$ | $N_{23}$   | $N_{24}$ | $R_2$            |
| Desocupado          | $N_{31}$ | $N_{32}$ | $N_{33}$   | $N_{34}$ | $R_3$            |
| Inactivo            | $N_{41}$ | $N_{42}$ | $N_{43}$   | $N_{44}$ | $R_4$            |
| Complemento columna | $C_1$    | $C_2$    | $C_3$      | $C_4$    | $M$              |


En la segunda etapa (proceso observable), cada individuo en la celda $ij$ de la matriz puede ser no respondiente en el tiempo $t-1$ y perder la clasificación por fila, o ser no respondiente en el tiempo $t$ y perder la clasificación columna, o bien, ser no respondiente en ambos tiempos y perder ambas clasificaciones. Por ende, se genera una estructura probabilística con los siguientes parámetros:

1. $\psi(i,j)$, la probabilidad inicial de que un individuo en la celda $ij$ responda en el tiempo $t-1$.
1. $\rho_{RR}(i,j)$, la probabilidad de transición de que un individuo en la celda $ij$ pase de ser respondiente en el tiempo $t-1$ a ser respondiente en el tiempo $t$.
1. $\rho_{MM}(i,j)$, la probabilidad de transición de que un individuo en la celda $ij$ pase de ser no respondiente en el tiempo $t-1$ a ser no respondiente en el tiempo $t$. 

Como se puede notar las probabilidades del proceso observables dependen del estado de clasificación del individuo. Para estimar todos los parámetros involucrados, se consideraron los siguientes modelos reducidos, explicados a continuación:

- Modelo A: considera que la probabilidad inicial de que un individuo sea respondiente en el tiempo $t-1$ es la misma para todas las clasificaciones contempladas en la encuesta, es decir $\psi(i,j)=\psi$. Las probabilidades de transición entre respondientes y entre no respondientes no dependen de la clasificación del individuo en la encuesta, es decir $\rho_{MM}(i,j)=\rho_{MM}$ y $\rho_{RR}(i,j)=\rho_{RR}$. Es decir que la probabilidad de tránsito entre respondientes es la misma para formales, informales, inactivos y desocupados; asimismo las probabilidades de respuesta se consideran idénticas para las diferentes clasificaciones. 
- Modelo B: considera que la probabilidad inicial de que un individuo sea respondiente en el tiempo $t-1$ depende de su clasificación en el tiempo $t-1$, es decir $\psi(i,j)=\psi(i)$. De la misma manera que en el modelo A, las probabilidades de transición entre respondientes y entre no respondientes no dependerán de la clasificación del individuo en la encuesta, es decir $\rho_{MM}(i,j)=\rho_{MM}$ y $\rho_{RR}(i,j)=\rho_{RR}$. Es decir que la probabilidad de respuesta difiere entre formales, informales, inactivos e desocupados; mientras que la probabilidad de tránsito entre respondientes es la misma. 
- Modelo C: asume que la probabilidad inicial de que un individuo sea respondiente en el tiempo $t-1$ es la misma para todas las clasificaciones contempladas en la encuesta, es decir $\psi(i,j)=\psi$. Sin embargo, las probabilidades de transición entre respondientes y entre no respondientes dependerán de la clasificación del individuo en el periodo $t-1$; es decir $\rho_{MM}(i,j)=\rho_{MM}(i)$ y $\rho_{RR}(i,j)=\rho_{RR}(i)$. Es decir que la probabilidad de tránsito entre respondientes es la misma para formales, informales, inactivos e desocupados; asimismo las probabilidades de transición difieren para las diferentes clasificaciones en el tiempo inicial.
- Modelo D: asume que la probabilidad inicial de que un individuo sea respondiente en el tiempo $t-1$ es la misma para todas las clasificaciones contempladas en la encuesta, es decir $\psi(i,j)=\psi$. Sin embargo, las probabilidades de transición entre respondientes y entre no respondientes dependerán de la clasificación del individuo en el periodo $t$; es decir $\rho_{MM}(i,j)=\rho_{MM}(j)$ y $\rho_{RR}(i,j)=\rho_{RR}(j)$. Es decir que la probabilidad de respuesta es la misma para formales, informales, inactivos e desocupados; asimismo la probabilidad de tránsito entre respondientes difiere para las diferentes clasificaciones en el tiempo final.

Ampliando las ideas de @Feinberg_Stasny_1983, @Gutierrez_2014 consideró una metodología de estimación basada en el enfoque de máxima-pseudo verosimilitud para estimar lo anteriores parámetros. El objetivo final del proceso es estimar el número de individuos en las celdas de una tabla de contingencia poblacional donde se clasifican según la situación de la fuerza laboral medida en dos puntos de tiempo diferentes bajo un diseño de muestreo complejo. En resumen, el ajuste de los modelos de ausencia de respuesta puede ser realizado siguiendo los algoritmos de estimación propuestos en @Gutierrez_2014, y utilizando el paquete computacional `surf` implementado en el software estadístico `R` [@Jacob_2020]. 


## Estimación de las matrices de transición

Considere que se dispone de información sobre la situación laboral de 41274 personas para los dos primeros trimestres del 2020 (año en el que la pandemia por COVID-19 produjo alteraciones importantes en el levantamiento regualr de las eneustas y en el mercado de trabajo). La clasificación del estatus ocupacional en la muestra se da en la siguiente tabla; la cual contiene los complementos columna y los complementos fila para las personas que no respondieron en alguno de los dos períodos. Nótese que los valores del complemento fila son mucho mayores que el complemento columna, lo que puede ser causado por la pandemia. Nótese que la suma de todas las entradas de la tabla de clasificación da como resultado el número de personas en la muestra traslapada, es decir 41,274 individuos. 

| Estado (T1/T2)      | Formal | Informal | Desocupado | Inactivo | Complemento fila |
|---------------------|--------|----------|------------|----------|------------------|
| Formal              | 11483  | 718      | 592        | 1828     | 451              |
| Informal            | 703    | 2513     | 495        | 2769     | 198              |
| Desocupado          | 191    | 181      | 503        | 794      | 81               |
| Inactivo            | 364    | 641      | 388        | 15386    | 382              |
| Complemento columna | 160    | 65       | 48         | 257      | 83               |


Como se supone que la muestra proviene de un muestreo complejo sobre la población del país, para utilizar el método de estimación propuesto en esta sección, se necesita primero estimar el tamaño de la población en cada celda de la tabla anterior. Estas estimaciones se dan en la siguiente tabla donde el tamaño de población estimado es 15,597,572.

| Estado (T1/T2)      | Formal    | Informal | Desocupado | Inactivo  | Complemento fila |
|---------------------|-----------|----------|------------|-----------|------------------|
| Formal              | 3,269,673 | 201,639  | 175,719    | 503,740   | 155,902          |
| Informal            | 232,095   | 641,565  | 146,416    | 725,006   | 58,649           |
| Desocupado          | 55,243    | 50,337   | 157,642    | 233,597   | 26,695           |
| Inactivo            | 102,490   | 161,363  | 98,898     | 4,299,066 | 118,393          |
| Complemento columna | 47,104    | 26,276   | 19,746     | 100,775   | 25,545           |


La escogencia del mejor modelo se llevó a cabo utilizando la estadística de ajuste $\chi^2$, calculada sobre la distancia entre los valores observados y los valores predichos por el modelo. En estos términos, el mejor modelo fue el C, puesto que minimizaba esta distancia con un valor de $\chi^2 = 0,706$. La distribución nula del estadístico es chi-cuadrado con $G^2-D$ grados de libertad, con $D$ indicando el número de parámetros estimados. Para el conjunto de datos considerado en este documento, la siguiente tabla presenta los valores críticos de la distribución nula y los valores del estadístico de prueba para cada modelo. Se concluye que el modelo más apropiado para el conjunto de datos es el modelo C.

|                     | Modelo A | Modelo B | Modelo C | Modelo D |
|---------------------|----------|----------|----------|----------|
| Grados de libertad  | 7        | 4        | 1        | 1        |
| Valor crítico       | 14.07    | 9.49     | 3.84     | 3.84     |
| Valor $\chi^2_{RS}$ | 15.6706  | 18.3659  | 0.2418   | 3.9137   |


Recuérdese que este modelo considera que la probabilidad inicial de que un individuo sea respondiente en el primer trimestre de 2020 es la misma para todas las clasificaciones contempladas en la encuesta, es decir $\psi(i,j)=\psi$. Sin embargo, las probabilidades de transición entre respondientes y no respondientes dependerán de la clasificación del individuo en el primer trimestre de 2020; es decir $\rho_{MM}(i,j)=\rho_{MM}(i)$ y $\rho_{RR}(i,j)=\rho_{RR}(i)$. Bajo estos supuestos, la siguiente tabla ilustra la estimación poblacional, insesgada con respecto al diseño de muestreo complejo de la encuesta, de los cambios brutos para el nivel de ocupación.

| Estado (T1/T2)      | Formal              | Informal         | Desocupado       | Inactivo            |
|------------|---------------------|------------------|------------------|---------------------|
| Formal     | 4.627.632 (102.470) | 287.124 (18.979) | 252.084 (20.399) | 713.284 (30.358)    |
| Informal   | 327.066 (33.292)    | 911.996 (45.645) | 210.372 (16.508) | 1.022.351 (50.332)  |
| Desocupado | 79.346 (10.592)     | 72.944 (8.858)   | 230.949 (21.180) | 335.746 (28.023)    |
| Inactivo   | 143.303 (11.192)    | 227.545 (15.849) | 140.923 (10.550) | 6.014.907 (123.559) |


El modelo C considera que los parámetros de la primera etapa del proceso (no observable) están definidos como las probabilidades de transición de una clasificación a otra en los periodos de observación. Estas estimaciones definen las matrices de transición laboral, que para los periodos estudiados corresponden a las entradas de la siguiente tabla. En particular se resalta el hecho de que el 12,1% de los trabajadores formales pasaron directamente a la inactividad; mientras que el cambio fue mayor en los trabajadores informales y en los desocupados, de los cuales el 41,3% y el 46,6% pasaron a la inactividad, respectivamente. Además, en los periodos estudiados, el 92,1% de los individuos inactivos siguió en este estado.

| Estado (T1/T2)      | Formal        | Informal      | Desocupado    | Inactivo      |
|------------|---------------|---------------|---------------|---------------|
| Formal     | 0.787 (0.010) | 0.048 (0.003) | 0.042 (0.003) | 0.121 (0.004) |
| Informal   | 0.132 (0.012) | 0.368 (0.013) | 0.085 (0.005) | 0.413 (0.013) |
| Desocupado | 0.110 (0.012) | 0.101 (0.010) | 0.321 (0.021) | 0.466 (0.025) |
| Inactivo   | 0.021 (0.001) | 0.034 (0.002) | 0.021 (0.001) | 0.921 (0.010) |


Por otro lado, las probabilidades iniciales de clasificación en el primer periodo de interés se encuentran en la siguiente tabla, en la que también se observan las probabilidades de transición de los no respondientes y las probabilidades de transición de los respondientes, diferenciadas por condición de ocupación en el primer trimestre de 2020. Nótese que la probabilidad inicial de respuesta se estimó en $\hat{\psi}=0.981 (0.002)$ para todas las clasificaciones de la condición de ocupación. Se puede notar que, dado que $1-\hat{\rho}_{MM}$ indica la probabilidad de que un individuo responda en el segundo trimestre de 2020 dado que no respondió en el primer trimestre de 2020, condicionado a cada condición de ocupación, entonces las personas informales e inactivas son más propensos a no responder en ambos periodos, por lo que habría indicios de un patrón de ausencia de respuesta no ignorable que el modelo ha logrado identificar correctamente.

| Trimestre I-2020 | $\hat{\eta}$  | $\hat{\rho}_{RR}$ | $\hat{\rho}_{MM}$ |
|------------------|---------------|-------------------|-------------------|
| Formal           | 0.376 (0.004) | 0.963 (0.004)     | 0.304 (0.104)     |
| Informal         | 0.158 (0.003) | 0.967 (0.004)     | 0.000 (0.261)     |
| Desocupado       | 0.046 (0.002) | 0.949 (0.008)     | 0.000 (0.188)     |
| Inactivo         | 0.418 (0.004) | 0.975 (0.002)     | 0.017 (0.086)     |


Por último, sería deseable establecer si hay diferencias importantes en el impacto que la pandemia causó en el mercado laboral entre hombre y mujeres. Para realizar estas comparaciones se ajustó el modelo C en cada una de las subpoblaciones, encontrando ajustes precisos y satisfactorios con $\chi^2_{hombres} = 0,350$ y $\chi^2_{hombres} = 0,470$. La estimación de la probabilidad inicial de respuesta en ambos casos se calculó en $\hat{\psi}=0.981 (0.002)$, y las estimaciones de las probabilidades $\hat{\eta}$ y $\hat{\rho}_{RR}$ no tuvieron cambios significativos entre los grupos. Sin embargo, la estimación de las probabilidades $\hat{\rho}_{MM}$ mostró diferencias entre hombres y mujeres que fueron clasificados como trabajadores formales y inactivos en el primer trimestre del 2020. En particular, para el grupo de trabajadores formales, $\hat{\rho}_{MM}^{hombre} = 0,253$, mientras que $\hat{\rho}_{MM}^{mujer} = 0,331$, lo cual indica que las mujeres formales eran más propensas a no responder en el segundo trimestre de 2020, comparadas con los hombres. Por otro lado, para el grupo de inactivos, $\hat{\rho}_{MM}^{hombre} = 0,112$, mientras que $\hat{\rho}_{MM}^{mujer} = 0,000$, lo cual indica que las mujeres desocupadas definitivamente tuvieron una menor probabilidad a no responder en el segundo trimestre de 2020 que los hombres.

La estimación de las matrices de transición para ambos subgrupos poblacionales se muestra en las siguientes tablas. Es importante resaltar que, según las estimaciones resultantes de este análisis, la peor parte se la llevaron las mujeres. Nótese que, para los trabajadores formales, existe una diferencia importante entre hombres y mujeres, siendo los primeros los menos afectados al pasar a la inactividad: 10,2% para los hombres, 14,5% para las mujeres. Este mismo fenómeno se presenta con más fuerza en el grupo de los trabajadores informales, en donde el 36,2% de los hombres pasó a la inactividad, mientras que el 46,9% de las mujeres pasó a la inactividad. De la misma forma, dentro de los individuos desocupados, un mayor porcentaje de mujeres pasó de la desocupación a la inactividad: 39,2% de hombres, contra un 53,4% de mujeres. Finalmente, el porcentaje de personas que siguió en la inactividad es mayor en las mujeres: 90,2% para los hombres, frenta a un 93,1% para las mujeres.

|$p_{ij}$ (Hombres)   | Formal        | Informal      | Desocupado    | Inactivo      |
|------------|---------------|---------------|---------------|---------------|
| Formal     | 0.791 (0.013) | 0.056 (0.004) | 0.049 (0.005) | 0.102 (0.005) |
| Informal   | 0.138 (0.011) | 0.403 (0.018) | 0.095 (0.008) | 0.362 (0.017) |
| Desocupado | 0.146 (0.025) | 0.118 (0.017) | 0.343 (0.031) | 0.392 (0.037) |
| Inactivo   | 0.031 (0.004) | 0.036 (0.003) | 0.030 (0.003) | 0.902 (0.021) |



|$p_{ij}$ (Mujeres)     | Formal        | Informal      | Desocupado    | Inactivo      |
|------------|---------------|---------------|---------------|---------------|
| Formal     | 0.781 (0.010) | 0.039 (0.003) | 0.033 (0.003) | 0.145 (0.007) |
| Informal   | 0.125 (0.012) | 0.331 (0.017) | 0.073 (0.007) | 0.469 (0.018) |
| Desocupado | 0.078 (0.012) | 0.086 (0.012) | 0.301 (0.028) | 0.534 (0.036) |
| Inactivo   | 0.017 (0.001) | 0.034 (0.002) | 0.017 (0.001) | 0.931 (0.013) |

