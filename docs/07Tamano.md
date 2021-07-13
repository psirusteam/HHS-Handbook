# Cálculo del tamaño de muestra

Uno de los tópicos más importantes en la literatura del diseño y análisis de encuestas de hogares es el tamaño de muestra. En general, en los libros de estadística y muestreo se establecen las características generales de los esquemas de muestreo y las propiedades estocásticas de los estimadores sin profundizar en que la muestra debe seleccionarse y que esta selección depende de cuántos hogares se necesiten en el estudio. De hecho, al hablar del tamaño de muestra en una encuesta de hogares, no solo se debe hacer referencia a los hogares, sino también a las personas. En efecto, la determinación del tamaño de muestra debe depender del propósito de la encuesta. Por ejemplo, considere una encuesta de propósitos múltiples que se levanta cada año con el fin de indagar acerca de fenómenos demográficos, sociales, educativos, y de condiciones de vida; en este contexto, se debe tener en cuenta que el tamaño de muestra definido debe ser útil, pertinente y apropiado para todas los indicadores que se desean medir al mismo tiempo. En este capítulo, el lector podrá encontrar una guía útil para identificar la mejor ruta a la hora de abordar el cálculo del tamaño de muestra en las encuestas de hogares. 

## Confiabilidad y precisión

Antes de introducir las metodologías básicas para el cálculo del tamaño de muestra mínimo, es necesario definir los diferentes tipos de error muestral en una encuesta. En principio, se define un intervalo de confianza para el parámetro $\theta$, inducido por su estimador insesgado $\hat{\theta}$ (que se supone con distribución normal de media $\theta$ y varianza $Var(\hat{\theta})$), como 

\begin{equation}\label{ICtheta}
IC(1-\alpha)=\left[\hat{\theta}-z_{1-\alpha / 2}\sqrt{ Var(\hat{\theta})},\hat{\theta}+z_{1-\alpha / 2}\sqrt{Var(\hat{\theta})}\right]
\end{equation}

donde $z_{1-\alpha / 2}$ se refiere al cuantil $(1-\alpha / 2)$ de una variable aleatoria con distribución normal estándar. Cuando el diseño de muestreo es complejo, es necesario reemplazar el percentil de la distribución normal estándar por el presentir de una distribución $t-student$ con $N_I - H$ grados de libertad, suponiendo que hay $N_I$ unidades primarias de muestreo y $H$ estratos. En este orden de ideas, nótese que

\begin{equation*}
1-\alpha=\sum_{Q_0 \supset s}p(s),
\end{equation*}

donde $Q_0$ es el conjunto de todas las posible muestras cuyo intervalo de confianza contiene al parámetro $\theta$. Desde la expresión del intervalo de confianza, se define el *margen de error*, como aquella cantidad que se suma y se resta al estimador insesgado. En este caso, se define como 

\begin{equation}
ME = z_{1-\alpha / 2}\sqrt{ Var(\hat{\theta})}
\end{equation}

Desde esta expresión también es posible definir el *error estándar*, dado por

\begin{equation}
EE = \sqrt{ Var(\hat{\theta})}
\end{equation}

Las anteriores medidas sólo tienen en cuenta la precisión del estimador. Una medida que tiene en cuenta la precisión y el sesgo del estimador es el *margen de error relativo*, que se define como 

\begin{equation}
MER = z_{1-\alpha / 2}\frac{\sqrt{ Var(\hat{\theta})}}{E(\hat{\theta})}
\end{equation}

De la misma manera, también se define el *coeficiente de variación* o *error estándar relativo* definido por 

\begin{equation}
CV =  \frac{\sqrt{ Var(\hat{\theta})}}{E(\hat{\theta})}
\end{equation}

El tamaño de muestra dependerá del tipo de error que se quiera minimizar. Por ejemplo, para una población particular, el tamaño de muestra requerido para minimizar el margen de error, no será el mismo que el que se necesitará para minimizar el coeficiente de variación. 

## El efecto de diseño en la determinación del tamaño de muestra

Al momento diseñar un estudio por muestreo con encuestas de hogares, es importante establecer el número mínimo de encuestas que se deben realizar. Esto es necesario para determinar el costo del estudio; y en el aspecto técnico, permite tener control desde la fase de diseño sobre la calidad estadística de los resultados esperados en el estudio. Como se mencionó anteriormente, esta calidad puede ser medida en términos del error muestral, con indicadores tales como el margen de error absoluto, el margen de error relativo o el coeficiente de variación. Estas medidas todas dependen de la varianza del estimador bajo el diseño muestral complejo; por lo tanto, contar con un valor aproximado para el efecto de diseño $Deff$ nos permite obtener una aproximación a dicha varianza, y acercarnos al error muestral del estudio en la fase del diseño.

Uno de los primeros paradigmas con el que se debe lidiar es el de la independencia entre las observaciones. Este es un supuesto que gobierna gran parte de la teoría de análisis estadístico, pero que infortunadamente no se aplica en el contexto de las encuestas de hogares. Ante los retos que se debe enfrentar y las diversas estrategias de recolección de información, las fórmulas que se desprenden del supuesto de que los observaciones corresponden a una muestra de variables independientes e idénticamente distribuidas no son plausibles. 

La estratificación, las múltiples etapas y la aglomeración de las unidades de muestreo hacen que este supuesto no se cumpla en la práctica y por tanto, utilizar las expresiones tradicionales que se encuentran en los libros introductorios de estadística guiará a tamaños de muestra insuficientes. El problema del tamaño de muestra en encuestas de hogares ha sido abordado por diferentes autores con diferentes enfoques. Quizás uno de los más aceptados es aquel que define un factor de ajuste, llamado efecto de diseño (DEFF), en función de la correlación que hay entre la variable de interés con las unidades primarias de muestreo. A partir de este efecto de diseño se calcula el número de personas que deben ser encuestadas para minimizar un error de muestreo predefinido. 

Cuando para la población de interés, se selecciona una muestra utilizando un diseño de muestreo de conglomerados o en varias etapas, no es imposible afirmar que existe independencia entre las observaciones. Lo anterior hace que no sea posible utilizar las fórmulas clásicas para la determinación de un tamaño de muestra, al considerar un diseño de muestreo aleatorio simple. Sin embargo, una forma sencilla de incorporar este efecto de aglomeración en las expresiones clásicas del muestreo aleatorio simple la da la siguiente relación, denotada como efecto de diseño:

\begin{equation}
DEFF(\hat{\theta})=\frac{Var_p(\hat{\theta})}{Var_{MAS}(\hat{\theta})}
\end{equation}

Esta cifra da cuenta del efecto de aglomeración causado por la utilización de un diseño de muestreo cualquiera $(p)$, frente a un diseño de muestreo aleatorio simple (MAS) en la inferencia de un parámetro de la población finita $\theta$ (que puede ser un total, una proporción, una razón, un coeficiente de regresión, etc.). Por lo anterior, es posible escribir la varianza del estimador bajo el diseño de muestreo complejo como 

\begin{align}
Var_p(\hat{\theta}) & = DEFF(\hat{\theta}) \ Var_{MAS}(\hat{\theta}) \\
& = DEFF(\hat{\theta}) \ \frac{N^2}{n}\left(1-\frac{n}{N}\right)S^2_{y_U}
\end{align}

Por lo tanto, si al implementar un muestreo aleatorio simple el tamaño de muestra $n_0$ es suficiente para conseguir la precisión deseada, entonces el valor del tamaño de muestra que tendrá en cuenta el efecto de aglomeración para un diseño complejo estará cercano  a $n \approx  n_0 \times DEFF$. 

En particular, para el caso de una proporción, la calidad del estimador se puede medir en términos de que con un alto nivel de confianza $(1-\alpha)$, la distancia entre el estimador y el parámetro no supere el margen de error previamente establecido (ME), esto es:

$$
1-\alpha=\Pr\left(|\hat{P}-P|<ME\right)
$$

El estimador de Horvitz-Thompson de la proporción $\hat{P}$ es insesgado para $P$ y su distribución asintótica es gaussiana con varianza dada por

$$
Var\left(\hat{P}\right)=Deff\frac{N^2}{n}(1-\frac{n}{N})P(1-P)
$$

Al despejar el tamaño muestral $n$ de la anterior expresión, se tiene que

$$
n\geq\frac{P(1-P) \ Deff}{\frac{ME^2}{z_{1-\alpha/2}^2}+\frac{P(1-P) \ Deff}{N}}
$$

La cual puede ser reescrita como 

$$
n\geq\frac{P(1-P)}{\frac{ME^2}{Deff \ z_{1-\alpha/2}^2}+\frac{P(1-P)}{N}}
$$

Por consiguiente, se donde se evidencia que valores grandes del efecto de diseño inducirán un mayor tamaño de muestra. Claramente el incremento no es lineal, más aún, el tamaño de muestre se ve más afectado en la medida en que el $Deff$ sea más grande.

## Escenarios de interés

En general, en encuestas de hogares se parte de un marco de muestreo de áreas que agrupa a toda la población de un país. Estas áreas están definidas como agregaciones cartográficas o UPM y contienen a su vez a los hogares en donde se encuentran las personas que son susceptibles de ser entrevistadas. Sin embargo, debido a la agrupación natural de las personas en hogares, a veces los cálculos se hacen complejos, máxime conociendo que la población de interés es un subconjunto de los habitantes de los hogares. Por otro lado, debido a que el marco de muestreo comúnmente usado por las Oficinas Nacionales de Estadística (ONE) es una lista de UPM, se hace necesario más allá de calcular el tamaño de muestra de las personas, también calcular el tamaño de muestra de UPM y hogares en la muestra. Por lo tanto, en este documento se pretende sintetizar los mecanismos de asignación de muestra en tres escenarios que son comunes en la práctica estadística del diseño de encuestas de hogares: 

1. Primer escenario: asignación del tamaño de muestra en problemas de inferencia que tienen que ver con la estimación de parámetros de personas. En este escenario se presenta la metodología apropiada para calcular el tamaño de muestra de UPM, hogares y finalmente personas. 

2. Segundo escenario: cuando la variable de diseño y en general, las variables más importantes de la encuestas están presentes a nivel de hogar, entonces no es necesario realizar un submuestreo de personas. Partiendo de la lógica presentada en el escenario anterior, se presenta la metodología adecuada para calcular el tamaño de muestra de UPM y de hogares. 

3. Tercer escenario: un caso menos común en los países de América Latina se presenta cuando el marco de muestreo empadrona las personas dentro de las UPM y además la encuesta sólo pretende observar características asociadas a los habitantes del hogar (y por tanto no intenta observar características ni del hogar ni de la vivienda). En este caso no hay un submuestreo de hogares.

En general, al definir las expresiones de tamaño de muestra, se debe ser cuidadoso con la notación, para lo cual suponemos una población $U$ de $N$ elementos sobre la que se desea seleccionar una muestra $s$ de $n$ elementos en los cuales se quiere medir una característica de interés. En algunos casos, la población $U$ no constituye la población de interés sino que la contiene; es decir, si se define a $U_d$ como la población de interés, entonces $U_d \subseteq U$. En términos de notación, se tiene lo siguiente:

- $N$ es el tamaño de la población $U$.
- $n$ es el tamaño de la muestra $s$.
- $N_{I}$ es el número de UPM en el marco de muestreo.
- $n_{I}$ es el número de UPM que se selecciona en la muestra de la primera etapa $s_I$.
- $N_{II}$ es el número de hogares existentes en el país. 
- $n_{II}$ es el número de hogares seleccionados en la muestra de la segunda etapa $s_{II}$.
- $\bar{n}$ es el número de personas promedio que se van a seleccionar en cada UPM.
- $\bar{n}_{II}$ es el número de hogares promedio que se van a seleccionar en cada UPM.
- $\rho$ es el coeficiente de correlación intraclase, calculado para la variable de interés sobre las UPM.
- $b$ es el número promedio de personas por hogar.
- $r$ es el porcentaje de personas con la característica de interés.
- $z_{\alpha}$ es el percentil ($1- \alpha/2$) asociado a una distribución normal estándar y a la confianza que se requiera en la inferencia. 

Para introducir las metodologías apropiadas, junto con las  expresiones adecuadas, en cada escenario se definirán las cantidades de interés, se dará una breve introducción al problema y se realizarán los cálculos detenidamente con ejemplos de encuestas reales. Para mantener la uniformidad en los cálculos, todos los ejemplos suponen una población de tamaño $N=50$ millones, con $N_{II} = 12$ millones de hogares, para el cual se desea obtener una muestra con una confianza del 90%. En cada escenario se supone que el país está dividido en $N_{I} =30$ mil UPM, conformadas por segmentos cartográficos (agregaciones de manzanas).

### Tamaño de muestra para UPM, hogares y personas

Cuando la unidad de observación sean las personas, sin importar que la variable de interés esté a nivel de hogar, será necesario siempre basar nuestros cálculos en el tamaño de muestra de las personas. Por ejemplo, para tener una inferencia apropiada al estimar el ingreso medio percápita, el porcentaje de personas pobres o el porcentaje de personas con una característica particular es necesario definir a la población objetivo como todas las personas que componen un hogar para posteriormente medir la variable de interés que será observada para todas ellas.

Con estos elementos es posible realizar simulaciones de algunos escenarios de muestreo, que indiquen el tamaño de muestra necesario en cada una de las etapas de la selección de la muestra. Si fuese posible sistematizar los elementos más importantes a la hora de calcular el tamaño de muestra en una encuesta de hogares, sería necesario recurrir a los siguientes pasos de manera ordenada: 

- **Definir la población de interés de manera explícita**. En particular, es necesario aclarar si la unidad de análisis son las personas o los hogares. De esta forma, se debe fijar los valores para $r$ y $b$. Si la unidad de análisis son todas las personas del hogar, entonces el porcentaje de personas con la característica de interés será $r = 1$, de otra forma $r<1$. Por otro lado, el número promedio de personas por hogar $b$ dependerá de la región o estrato en la que se requiera el cálculo.

- **Definir el número promedio de hogares**. El número promedio de hogares que se desea encuestar en cada una de las UPM está dado por $\bar{n}_{II}$. Este proceso debería ser repetido de forma iterativa en los pasos subsiguientes para poder evaluar la calidad del diseño. De las varias escogencias de $\bar{n}_{II}$ será necesario escoger solo una. 

- **Calcular el número promedio de personas que serán encuestadas**. Al igual que en el paso anterior es necesario probar varios escenarios que redundarán en la escogencia de un número óptimo de personas por UPM. Los valores de $\bar{n}$ dependen directamente del paso anterior al escoger $\bar{n}_{II}$. Debido a que la selección de las personas está supeditada a la selección de los hogares, entonces $\bar{n}$ se puede descomponer manteniendo la relación con $r$ y $b$, de la siguiente manera:
$$
\bar{n} = \bar{n}_{II} * r * b
$$

- **Calcular el efecto de diseño**. Es necesario definir (o calcular con encuestas o censos anteriores) la correlación intraclase de la variable de interés con el agrupamiento por UPM $\rho$. Luego de esto, se debe calcular el efecto de diseño $DEFF$ como función de $\rho$ y de $\bar{n}$. Ahora, el efecto de diseño $DEFF$, definido como una función de la correlación existente entre la variable de interés y la conformación de las UPM, está dado por la siguiente expresión
$$
DEFF \approx 1 + (\bar{n} - 1)\rho
$$

- **Calcular el tamaño de muestra de personas**. A partir de las expresiones de tamaño de muestra para diseños de muestreo complejos, calcular el tamaño de muestra necesario para lograr una precisión adecuada en la inferencia. En primer lugar, si lo que se quiere estimar es un promedio $\bar{y}_U$, el tamaño de muestra necesario para alcanzar un error relativo máximo de $\delta$ % es de 
$$
n \geq \dfrac{S^2_{y_U}DEFF}{\dfrac{\delta^2 \bar{y}_U^2}{z_{\alpha}^2}+\dfrac{S^2_{y_U}DEFF}{N}}
$$

Por otro lado, si lo que se quiere estimar es una proporción $P$, entonces la expresión apropiada para calcular el tamaño de muestra estará dada por
$$
n \geq \dfrac{P\ (1-P)\ DEFF}{\dfrac{\delta^2P^2}{z_{\alpha}^2 }+\dfrac{P\ (1-P) \ DEFF}{N}}
$$

- **Calcular el tamaño de muestra de hogares**. Es necesario calcular el número total de hogares de deben ser seleccionados para lograr entrevistar a todas las personas que serán observadas en el punto anterior. El número de hogares que deben se seleccionados estará determinado por las cantidades $n$, $b$ y $r$, de la siguiente forma

$$
n_{II} = \dfrac{n}{r * b}
$$

- **Calcular el número de UPMS**. Los hogares y las personas se observan a partir de las UPM. En este paso final es necesario calcular el número de UPM que deben ser seleccionadas en el muestreo a partir de la relación 

$$
n_{I} = \frac{n}{\bar{n}} 
= \frac{n_{II}}{\bar{n}_{II}}
$$ 

#### Ejemplo: proporción de personas pobres {-}

Suponga que el parámetro de interés es el porcentaje de personas pobres (cuyo ingreso está por debajo de un umbral preestablecido) y se quiere hacer inferencia con un error relativo máximo del 5%. Por estudios anteriores en este país, se ha estimado que la proporción de personas pobres está alrededor de $P = 4$%. Nótese que la población objetivo está conformada por todos los habitantes del hogar puesto que $r = 100$%. En este país se ha estimado que el tamaño promedio del hogar es de alrededor de $b = 3.5$ personas. Por último, según levantamientos anteriores, la correlación intraclase de la característica de interés con las unidades primarias de muestreo es $\rho = 0.034$.

La siguiente tabla resume los resultados del ejercicio para $\bar{n}_{II} =$ 10 hogares por UPM, los cuales implican que por cada UPM se entrevistarían en promedio a $\bar{n}$ 35 personas. Con lo anterior se obtendría un efecto de diseño $DEFF =$ 2.2, para un total de personas en la muestra de $n =$ 55936 que serán observados a partir de la selección de $n_{II} =$ 15982 hogares en $n_{I} =$ 1598 UPM.

|Hogares promedio por UPM|Personas promedio por UPM| DEFF| Muestra de UPM|Muestra de hogares| Muestra de personas|
|:---------:|:-----------:|:----:|:-------:|:-------:|:-------:|
|          10|          35|  2.2| 1598|   15982|    55936|

Por supuesto que es posible plantear otros escenarios a medida que se evalúe el efecto que conlleva el cambio del número de hogares que se seleccionan en cada UPM. Por ejemplo, el investigador podría proponer que se seleccionarán en promedio 5 hogares por UPM, lo cual cambiaría el número de UPM que serían seleccionadas en la muestra de la primera etapa, así como también el número total de personas que serían seleccionadas en todo el operativo. Debido a que el efecto de diseño es una función del número de hogares promedio a seleccionar en las UPM, esta cifra también variará. A continuación se muestran algunos resultados que permiten establecer estos escenarios cuando se varía el tamaño de muestra promedio de hogares por UPM. La escogencia del escenario ideal se debe dar en términos de la conveniencia logística y presupuestal en el estudio. 

|Hogares promedio por UPM|Personas promedio por UPM| DEFF| Muestra de UPM|Muestra de hogares| Muestra de personas|
|:---------:|:-----------:|:----:|:-------:|:-------:|:-------:|
|           5|          18|  1.6| 2315|   11575|    40512|
|          10|          35|  2.2| 1598|   15982|    55936|
|          15|          52|  2.8| 1359|   20386|    71351|
|          20|          70|  3.4| 1239|   24787|    86756|
|          25|          88|  3.9| 1167|   29186|   102152|
|          30|         105|  4.5| 1119|   33582|   117538|
|          35|         122|  5.1| 1085|   37976|   132915|
|          40|         140|  5.7| 1059|   42366|   148282|
|          45|         158|  6.3| 1039|   46754|   163640|

#### Ejemplo: ingreso promedio por persona  {-}

Suponga que se desea estimar el ingreso promedio por hogar con un error relativo máximo del 2%. La variable de interés (ingreso) es continua y se estima que la media oscila alrededor de $\bar{y}_U=1180$ dólares con una varianza de $S^2_{y_U}=1845.94^2$.  En este caso, la población objetivo son todos los habitantes del hogar, por lo cual $r = 1$. La composición del hogar se calcula en $b = 3.79$ personas por hogar. Por último, según levantamientos anteriores, la correlación intraclase de la característica de interés es $\rho = 0.035$. Nótese que la correlación intraclase cambia con respecto a la característica que se desee medir. 

La siguiente tabla muestra los resultados del ejercicio al seleccionar $\bar{n}_{II} =$ 15 hogares por UPM, que a su vez implica que por cada UPM se encontrarían en promedio $\bar{n}=$ 57 personas por UPM. Con lo anterior se obtendría un efecto de diseño $DEFF =$ 3, para un total de personas en la muestra de $n =$ 48861 que serán observados a partir de la selección de $n_{II} =$ 12892 hogares en $n_{I} =$ 859 UPM.

|Hogares promedio por UPM|Personas promedio por UPM| DEFF| Muestra de UPM|Muestra de hogares| Muestra de personas|
|:---------:|:-----------:|:----:|:-------:|:-------:|:-------:|
|          15|          57|    3|  859|   12892|    48861|


A continuación se muestran algunos resultados que permiten establecer otros escenarios de muestreo cuando se varía el tamaño de muestra promedio de hogares por UPM. Recuérdese que cualquiera de estos escenarios es válido, desde el punto de vista de la eficiencia estadística, aunque no todos serán válidos si se tienen en cuenta otros aspectos como los logísticos o presupuestales. Por ejemplo, si se escogiera el penúltimo escenario, entonces para 50 hogares por UPM, se debería encuestar en promedio a 190 personas, lo cual reduciría el número de UPM a 662, pero aumentaría el tamaño de muestra general a 33098 personas, lo cual involucraría mayores costos de contratación de encuestadores, supervisores y seguramente un operativo de campo de más días de duración. 

|Hogares promedio por UPM|Personas promedio por UPM| DEFF| Muestra de UPM|Muestra de hogares| Muestra de personas|
|:---------:|:-----------:|:----:|:-------:|:-------:|:-------:|
|           5|          19|  1.6| 1422|    7108|    26938|
|          10|          38|  2.3| 1000|   10001|    37902|
|          15|          57|  3.0|  859|   12892|    48861|
|          20|          76|  3.6|  789|   15783|    59816|
|          25|          95|  4.3|  747|   18672|    70766|
|          30|         114|  4.9|  719|   21560|    81711|
|          50|         190|  7.6|  662|   33098|   125443|
|         100|         379| 14.2|  619|   61857|   234439|


#### Ejemplo: tasa de desocupación en adultos mayores {-}

Suponga que la incidencia de este fenómeno está alrededor de $P = 5.5$% en la población objetivo que son las personas económicamente activas (PEA) mayores de 60 años; en este país, se ha estimado que en promedio hay $r = 4.6$% de adultos mayores por hogar que pertenecen a la PEA, cuyo tamaño promedio es de alrededor de $b = 5$ personas. Además, se quiere hacer inferencia con un error relativo máximo del 15%. Por último, según levantamientos anteriores, la correlación intraclase de la característica de interés es $\rho = 0.7$.

La siguiente tabla muestra los resultados del ejercicio, que implica que seleccionar $\bar{n}_{II} =$ 20 hogares por UPM implicaría un promedio de $\bar{n} =$ 4.6 adultos mayores en la PEA (casos de interés) por UPM. Con lo anterior se obtendría un efecto de diseño $DEFF =$ 3.5, para un total de adultos mayores en la muestra de $n =$ 7272 que serán observados a partir de la selección de $n_{II} =$ 31617 hogares en $n_{I} =$ 1581 UPM.

|Hogares promedio por UPM|Personas promedio por UPM| DEFF| Muestra de UPM|Muestra de hogares| Muestra de casos|
|:---------:|:-----------:|:----:|:-------:|:-------:|:-------:|
|          20|         4.6|  3.5| 1581|   31617|     7272|

En este caso la muestra en los 31617 hogares induce un operativo muy grande que implicaría la observación de $31617 * 5 = 158085$ personas, de las cuales $n =$ 7272, serían los casos de interés. Como se ha visto en los anteriores ejemplos, es posible plantear otros escenarios a medida que se evalúe el efecto que conlleva el cambio del número de hogares que se seleccionan en cada UPM. A continuación se muestran algunos resultados que permite establecer estos escenarios cuando se varía el tamaño de muestra promedio de hogares por UPM. 

|Hogares promedio por UPM|Personas promedio por UPM| DEFF| Muestra de UPM|Muestra de hogares| Muestra de casos|
|:---------:|:-----------:|:----:|:-------:|:-------:|:-------:|
|           5|         1.1|  1.1| 1985|    9926|     2283|
|          10|         2.3|  1.9| 1716|   17157|     3946|
|          15|         3.5|  2.7| 1626|   24387|     5609|
|          20|         4.6|  3.5| 1581|   31617|     7272|
|          25|         5.8|  4.3| 1554|   38848|     8935|
|          30|         6.9|  5.1| 1536|   46074|    10597|
|          50|        11.5|  8.3| 1500|   74983|    17246|
|         100|        23.0| 16.4| 1472|  147222|    33861|


### Tamaño de muestra para UPM y hogares

En algunas ocasiones la variable de interés y la unidad de observación están a nivel de hogar. Por ejemplo, cuando todas las variables de interés se miden en la vivienda. En este caso es posible modificar el algoritmo de la sección anterior para seleccionar únicamente a los hogares en la muestra, sin necesidad de realizar un submuestreo de personas. En este caso algunas cantidades desaparecen porque no son objeto de la población de hogares, por ejemplo $r$ y $b$; algunas otras expresiones deben ser redefinidas al contexto de los hogares, como por ejemplo, el coeficiente de correlación intraclase $\rho$, el efecto de diseño y todas las expresiones de tamaños de muestra. En todo caso, la adaptación del algoritmo se describe a continuación.

- **Definir el número promedio de hogares**. El número promedio de hogares que se desea encuestar en cada una de las UPM está dado por $\bar{n}_{II}$. Esta cifra sigue siendo el insumo más importante del algoritmo y se propone crear escenarios de muestreo a partir de su modificación y evaluación del tamaño de muestra final.

- **Calcular el efecto de diseño**. Es necesario definir (o calcular con encuestas o censos anteriores) la correlación intraclase $\rho_{II}$ de la variable de interés *a nivel del hogar* con el agrupamiento por UPM definido por la división cartográfica del último censo. Además de lo anterior, el efecto de diseño $DEFF$ será función del tamaño de muestra promedio de hogares por UPM $\bar{n}_{II}$, como se muestra a continuación:
$$
DEFF \approx 1 + (\bar{n}_{II} - 1)\rho_{II}
$$

- **Tamaño de muestra de hogares**. Partiendo de las expresiones de tamaño de muestra generales para muestreos complejos y teniendo en cuenta que la población de interés son los hogares y que la variable de interés $y_{II}$ está a nivel de hogar, entonces el tamaño de muestra necesario para alcanzar un error relativo máximo de $\delta$ % es de 
$$
n_{II} \geq \dfrac{S^2_{y_{II}}DEFF}{\dfrac{\delta^2 \bar{y}_{II}^2}{z_{\alpha}^2}+\dfrac{S^2_{y_{II}}DEFF}{N_{II}}}
$$

La expresión apropiada para calcular el tamaño de muestra para una proporción estará dada por
$$
n_{II} \geq \dfrac{P_{II}\ (1-P_{II})\ DEFF}{\dfrac{\delta^2P^2_{II}}{z_{\alpha}^2 }+\dfrac{P_{II}\ (1-P_{II}) \ DEFF}{N_{II}}}
$$

- **Cálculo del número de UPMs**. Los hogares se observan a partir de las UPM. En este paso final es necesario calcular el número de UPM que deben ser seleccionadas en el muestreo a partir de la relación 
$$
n_{I} = \frac{n_{II}}{\bar{n}_{II}}
$$ 

#### Ejemplo: gasto promedio del hogar

Suponga que se desea estimar el promedio de gasto en dólares en los hogares del país con un error relativo máximo admisible del 3.5%. La variable de interés (gasto) es continua y se estima que la media oscila alrededor de $\bar{y}_U=1407$ dólares con una varianza de $S^2_{y_U}=2228^2$. En este ejemplo se supone que el país está dividido en $N_I = 10$ mil UPM y la correlación intraclase de la característica de interés, medida a nivel del hogar, con las UPM es de $\rho_{II} = 0.173$.

La siguiente tabla muestra los resultados del ejercicio para $\bar{n}_{II} =$ 12 hogares por UPM, que serán observados a partir de la selección de $n_{I} =$ 1338 UPM y $n_{I} =$ 16056 hogares que inducen un efecto de diseño $DEFF =$ 2.9.

|Hogares promedio por UPM| DEFF|Muestra de UPM|Muestra de hogares|
|:-----------:|:----:|:----:|:-------:|
|          12|  2.9| 1338|   16056|


A continuación se muestran algunos resultados que permiten establecer otros escenarios de muestreo al variar el tamaño de muestra promedio de hogares por UPM. Nótese que, por ejemplo, en el caso de seleccionar 20 hogares por UPM, se debería seleccionar una muestra de 23695 hogares en tan solo 1185 UPM. Por otro lado, si sólo se seleccionaran 2 hogares por UPM, se tendrían que visitar 3246 UPM en todo el país, aunque el número de encuestas totales descendería a 6493. 

Para este tipo de operativos, en donde los cuestionarios de gasto de los hogares están acompañados de un operativo exhaustivo que le permite al investigador conocer los hábitos de consumo del hogar de forma desagregada, y en donde se visita el hogar durante un periodo de tiempo determinado, tal vez sea más conveniente estudiar la viabilidad de seleccionar más hogares por UPM y menos UPM para que el operativo de campo no exija la contratación de demasiado personal en campo. Al estar agrupados en menos UPM, se podría definir un mejor levantamiento de la información con un equipo mediano de personas; de lo contrario, se debería contratar bastante más personal que cubra las UPM dispersas a lo largo del país. 

|Hogares promedio por UPM| DEFF|Muestra de UPM|Muestra de hogares|
|:-----------:|:----:|:----:|:-------:|
|           2|  1.2| 3246|    6493|
|           4|  1.5| 2102|    8407|
|           6|  1.9| 1720|   10320|
|           8|  2.2| 1529|   12233|
|          10|  2.6| 1414|   14145|
|          12|  2.9| 1338|   16056|
|          14|  3.2| 1283|   17967|
|          16|  3.6| 1242|   19877|
|          18|  3.9| 1210|   21787|
|          20|  4.3| 1185|   23695|

#### Ejemplo: proporción de hogares sin agua potable

Suponga que se desea obtener una muestra con un error relativo máximo admisible del 10% sobre la variable de interés (necesidades básicas insatisfechas en agua) y el parámetro de interés es el porcentaje de hogares con esta carencia. En este país, se estima que la proporción de hogares con esta condición asciende a $P = 7.5$%.  En este ejemplo se supone que la correlación intraclase de la característica de interés con las UPM es de $\rho_{II} = 0.045$.

La siguiente tabla muestra los resultados del ejercicio para $\bar{n}_{II} =$ 10 hogares por UPM, que serán observados a partir de la selección de $n_{I} =$ 436 UPM y $n_{II} =$  4357 hogares que inducen un efecto de diseño $DEFF =$ 1.3.

|Hogares promedio por UPM| DEFF|Muestra de UPM|Muestra de hogares|
|:-----------:|:----:|:----:|:-------:|
|          10|  1.3|  436|    4357|

A continuación se muestran algunos resultados que permiten establecer otros escenarios de muestreo al variar el tamaño de muestra promedio de hogares por UPM. Observe que el efecto de diseño DEFF es directamente proporcional al número de hogares entrevistados por UPM y al tamaño de muestra de hogares final; de la misma manera, es inversamente proporcional al número de UPM. 

|Hogares promedio por UPM| DEFF|Muestra de UPM|Muestra de hogares|
|:-----------:|:----:|:----:|:-------:|
|           5|  1.1|  758|    3790|
|          10|  1.3|  436|    4357|
|          15|  1.5|  328|    4924|
|          20|  1.6|  274|    5490|
|          25|  1.8|  242|    6057|
|          30|  2.0|  221|    6624|
|          35|  2.2|  205|    7190|
|          40|  2.3|  194|    7757|
|          45|  2.5|  185|    8323|

### Tamaño de muestra para UPM y personas

En algunos casos en donde la variable de interés esté a nivel de persona y el cuestionario de la encuesta no induzca preguntas acerca del hogar, y además exista un inventario detallado de las personas que residen en cada UPM, es posible evadir la selección de los hogares e ir directamente a la selección de personas. En este caso, la lógica del cálculo del tamaño de muestra se mantiene modificando en cierta manera el algoritmo de las secciones anteriores, tal como se ilustra a continuación. 

- **Definir la población de interés de manera explícita**. En este caso solo se mantiene la expresión correspondiente a $r$ que denota el porcentaje de personas con la característica de interés en la población.

- **Definir el número promedio de personas**. El número promedio de personas que se desea encuestar en cada una de las UPM está dado por $\bar{n}$. Al igual que en las secciones anteriores, se recomienda hacer una evaluación sobre esta cantidad para determinar posibles escenarios de muestreo. Nótese que, debido al efecto de $r$, la siguiente relación se mantiene 
$$
\bar{n}^e = \bar{n} * r
$$

En donde $\bar{n}^e$ denota el número promedio de encuestas realizadas en cada UPMS sobre la población de interés.

- **Calcular el efecto de diseño**. Es necesario definir el efecto de diseño $DEFF$ como una función de la correlación existente entre la variable de interés y la conformación de las UPM $\rho^e$, está dado por la siguiente expresión
$$
DEFF^e \approx 1 + (\bar{n}^e - 1)\rho^e
$$

- **Tamaño de muestra de personas**. A partir de las expresiones de tamaño de muestra para muestreos complejos, calcular el tamaño de muestra necesario para lograr una precisión adecuada en la inferencia. En primer lugar, el tamaño de muestra necesario para alcanzar un error relativo máximo de $\delta$ % es de 
$$
n^e \geq \dfrac{S^2_{y_U}DEFF^e}{\dfrac{\delta^2 \bar{y}_U^2}{z_{\alpha}^2}+\dfrac{S^2_{y_U}DEFF^e}{N}}
$$

Si lo que se quiere estimar es una proporción $P$, entonces la expresión apropiada para calcular el tamaño de muestra estará dada por
$$
n^e \geq \dfrac{P\ (1-P)\ DEFF^e}{\dfrac{\delta^2P^2}{z_{\alpha}^2 }+\dfrac{P\ (1-P) \ DEFF^e}{N}}
$$

- **Tamaño de muestra final**. Es necesario calcular el número total de personas que deben ser seleccionados para lograr observar a quienes hacen parte de la población objetivo. Esta cantidad está dada por la siguiente expresión.
$$
n = n^e / r
$$

- **Cálculo del número de UPMs**. Finalmente, las personas se observan a partir de las UPM. En este paso final es necesario calcular el número de UPM que deben ser seleccionadas en el muestreo a partir de la relación. 
$$
n_{I} = \frac{n}{\bar{n}} 
= \frac{n^e}{\bar{n}^e}
$$ 

#### Ejemplo: ingreso promedio en personas empleadas

Suponga que se desea estimar el ingreso promedio en las personas empleadas con un error relativo máximo admisible del 2%. La variable de interés (ingreso) es continua y se estima que la media oscila alrededor de $\bar{y}_U=1458$ dólares con una varianza de $S^2_{y_U}=2191^2$. Nótese que la población objetivo son todas las personas empleadas, cuya proporción se estima en $r = 46$%. La correlación intraclase de la característica de interés es $\rho = 0.038$.

La siguiente tabla muestra los resultados del ejercicio al seleccionar $\bar{n}_{II} =$ 50 personas por UPM, que a su vez implica que por cada UPM se encontrarían en promedio $\bar{n}$ 23 personas ocupadas por UPM. Con lo anterior se obtendría un efecto de diseño $DEFF =$ 1.8, para un total de personas en la muestra de $n =$ 60933 de las cuales habrían $n_e =$ 28029 ocupados repartidos en $n_{I} =$ 1219 UPM.

|Personas promedio por UPM|Casos promedio por UPM| DEFF| Muestra de UPM|Muestra de Casos|Muestra de personas|
|:-----------:|:-------------:|:----:|:-------:|:-------:|:---------:|
|          50|            23|  1.8| 1219|      28029|    60933|


A continuación se muestran algunos resultados que permiten establecer otros escenarios de muestreo cuando se varía el tamaño de muestra promedio de hogares por UPM. 

|Personas promedio por UPM|Casos promedio por UPM| DEFF| Muestra de UPM|Muestra de Casos|Muestra de personas|
|:-----------:|:-------------:|:----:|:-------:|:-------:|:---------:|
|          25|            12|  1.4| 1857|      21360|    46435|
|          50|            23|  1.8| 1219|      28029|    60933|
|          75|            34|  2.3| 1006|      34695|    75424|
|         100|            46|  2.7|  899|      41360|    89913|
|         125|            58|  3.1|  835|      48023|   104398|

#### Ejemplo: proporción de analfabetas pobres

Suponga que se quiere estimar la proporción de incidencia de la pobreza sobre la población analfabeta con un error relativo máximo admisible del 15%. Se ha estimado que alrededor del $r = 14$% de las personas del país no saben leer ni escribir. Por otro lado, tal como se vio en un ejemplo anterior, el fenómeno de la pobreza está estimado en $P = 4$%. y la correlación intraclase de la característica de interés es $\rho^e = 0.045$.

La siguiente tabla muestra los resultados del ejercicio al seleccionar $\bar{n}_{II} =$ 100 personas por UPM, que a su vez implica que por cada UPM se encontrarían en promedio $\bar{n}$ 14 personas que no saben leer ni escribir por UPM. Con lo anterior se obtendría un efecto de diseño $DEFF =$ 1.6, para un total de personas en la muestra de $n =$ 32671 de las cuales habrían $n_e =$ 4574 ocupados repartidos en $n_{I} =$ 327 UPM.

|Personas promedio por UPM|Casos promedio por UPM| DEFF| Muestra de UPM|Muestra de Casos|Muestra de personas|
|:-----------:|:-------------:|:----:|:-------:|:-------:|:---------:|
|         100|            14|  1.6|  327|       4574|    32671|


Es posible plantear otros escenarios a medida que se evalúe el efecto que conlleva el cambio del número de hogares que se seleccionan en cada UPM. A continuación se muestran algunos resultados que permite establecer estos escenarios cuando se varía el tamaño de muestra promedio de hogares por UPM. 

|Personas promedio por UPM|Casos promedio por UPM| DEFF| Muestra de UPM|Muestra de Casos|Muestra de personas|
|:-----------:|:-------------:|:----:|:-------:|:-------:|:---------:|
|          25|           3.5|  1.1|  917|       3211|    22936|
|          50|           7.0|  1.3|  524|       3665|    26179|
|          75|          10.5|  1.4|  392|       4120|    29429|
|         100|          14.0|  1.6|  327|       4574|    32671|
|         125|          17.5|  1.7|  287|       5029|    35921|


## Otros escenarios de interés

En las encuestas de hogares también surgen escenarios particulares que llevan a sugerir distintos caminos para la adopción de un determinado tamaño de muestra. En esta sección analizaremos los casos en los que se quieren realizar diferencias de proporciones, diferencias en diferencias y pruebas de hipótesis. 

### Tamaño de muestra para la estimación de la diferencia de proporciones


Suponga una población $U$, que se encuentra particionada en dos subpoblaciones $U_1$ de tamaño $N_1$ y $U_2$, de tamaño $N_2$. El interés del investigador está en conocer la diferencia de algunas proporciones entre estos grupos. Por ejemplo, suponga que se quiere conocer la diferencia entre las proporciones de niños desnutridos por sexo. Se espera que la proporción de niños desnutridos no supere la proporción de niñas desnutridas en el grupo control. Por lo tanto, el parámetro de interés se escribe como:
\begin{equation}
\theta=P_1-P_2=\frac{N_{d1}}{N_1}-\frac{N_{d2}}{N_2}
\end{equation}

En donde $N_{di}=\sum_{k\in U_i}Z_{dik}$, para $i=1,2.$ Ahora, $Z_{dik}$ es una característica dicotómica que indica si el individuo $k$-ésimo de la subpoblación $U_i$ está en estado de desnutrición. Por supuesto, bajo muestreo aleatorio simple, un estimador insesgado para $\theta$ es
\begin{align}
\hat{\theta}=\hat{P}_1-\hat{P}_2=\frac{\hat{N}_{d1}}{N_1}-\frac{\hat{N}_{d2}}{N_2}
\end{align}

En donde, $\hat{N}_{di}=\frac{N_i}{n_i}\sum_{k\in S_i}Z_{dik}$, para $i=1,2.$ La varianza del anterior estimador es:
\begin{align*}
Var(\hat{P}_1-\hat{P}_2)&=Var\left(\hat{P}_1\right)+Var\left(\hat{P}_2\right)-2Cov\left(\hat{P}_1, \hat{P}_2\right)
\end{align*}

Por otro lado, siendo $T_1$ y $T_2$, el porcentaje de traslape de las subpoblaciones y la $R_{1,2}$ la correlación de Pearson entre los datos observados de ambas subpoblaciones, la covarianza entre este par de estimadores está determinada por la siguiente relación [@Kish_2004]:

$$
Cov(\hat{\theta}_1, \hat{\theta}_2) = \sqrt{Var(\hat{\theta}_1)}\sqrt{Var(\hat{\theta}_2)}\sqrt{T_1}\sqrt{T_2}R_{1,2}
$$

Ahora, para encontrar el tamaño de muestra óptimo, es útil realizar los siguientes supuestos:

1. Asumir que las subpoblaciones son grandes y por ende $N_1=N_2=N$.
2. Por lo anterior, asumir que los tamaños de muestra pueden ser iguales, tales que $n_1=n_2=n$. 

Nótese a su vez que, si el levantamiento de las observaciones no puede ser realizado utilizando muestreo aleatorio simple, sino que por el contrario, la muestra aleatoria fue seleccionada mediante un diseño de muestreo complejo con un efecto de diseño^[Recuerde que si el muestreo es aleatorio simple, el efecto de diseño es $DEFF=1$.] $(DEFF)$ no ignorable y mayor a uno, entonces la varianza tomaría la siguiente forma 
\begin{align}
Var(\hat{P}_1-\hat{P}_2)=\frac{DEFF}{n}\left(1-\frac{n}{N}\right)(P_1Q_1+P_2Q_2) * \sqrt{T_1}\sqrt{T_2}R_{1,2}
\end{align}

De esta manera, un intervalo de confianza del 95\% para la diferencia de proporciones está dado por
\begin{align}
IC(95\%)_{P_1-P_2}&=(\hat{P}_1-\hat{P}_2) \pm Z_{1-\alpha/2} \sqrt{\frac{DEFF}{n}\left(1-\frac{n}{N}\right)(P_1Q_1+P_2Q_2)* \sqrt{T_1}\sqrt{T_2}R_{1,2}}
\end{align}

Lo anterior quiere decir que el margen de error, $e$, de la encuesta debe ser tal que:
\begin{align}
e< Z_{1-\alpha/2}\sqrt{\frac{DEFF}{n}\left(1-\frac{n}{N}\right)(P_1Q_1+P_2Q_2)* \sqrt{T_1}\sqrt{T_2}R_{1,2}}
\end{align}

Por lo tanto, despejando $n$, se tiene que la muestra en cada subgrupo debe mayor que:
\begin{align}
 n> \dfrac{DEFF(P_1Q_1+P_2Q_2)* \sqrt{T_1}\sqrt{T_2}R_{1,2}}{\dfrac{e^2}{Z_{1-\alpha/2}^2}+\dfrac{DEFF(P_1Q_1+P_2Q_2)* \sqrt{T_1}\sqrt{T_2}R_{1,2}}{N}}
 \end{align}
 
Para el levantamiento de una línea de base, que quiera estimar una diferencia de proporciones $P_1-P_2$ (donde $Q_1=1-P_1$ y $Q_2=1-P_2$), entonces el tamaño de muestra mínimo\footnote{Note que el tamaño de muestra de toda la encuesta es $2n$, puesto que se debe seleccionar $n$ elementos en cada subgrupo.} necesario para lograr una estimación confiable de esta diferencia, con menos de $\varepsilon\%$ de error, es:
 
\begin{equation} 
n \geq \dfrac{(P_1Q_1+P_2Q_2)DEFF* \sqrt{T_1}\sqrt{T_2}R_{1,2}}{\dfrac{\varepsilon^2}{z_{\alpha}^2}+\dfrac{(P_1Q_1+P_2Q_2)DEFF* \sqrt{T_1}\sqrt{T_2}R_{1,2}}{N}}
\end{equation} 

#### Covarianza en comparaciones mensuales {-}

Suponga que se quiere comparar la tasa de desempleo nacional entre dos meses consecutivos. En este escenario, asumiendo que existe independencia en el muestreo de los dos meses consecutivos, el porcentaje de traslape de muestra entre los dos meses (que por diseño es nulo) es igual a cero. Por lo tanto, $T_1 = T_2 = 0$. Luego, el término de la covarianza se anula. En resumen, la varianza del estimador en este caso sería igual a:

$$
Var(\hat{P}_1-\hat{P}_2) 
= Var(\hat{P}_1) + Var(\hat{P}_2)
$$

#### Covarianza en comparaciones trimestrales o anuales {-}

Bajo un esquema rotativo 2(2)2, suponga que se quiere comparar la tasa de desempleo nacional entre trimestres consecutivos o entre el mismo mes de dos años consecutivos. En este escenario no existe independencia en el muestreo de los dos trimestres consecutivos puestos que la estructura del panel garantiza un traslape del 50%. En este caso $T_1 = T_2 \approx 0.5$.

Por otro lado, existe una correlación natural entre las viviendas comunes en el panel que se midieron en los periodos de interés, por lo tanto $R_{1,2} \neq 0$. Note que esta correlación se calcula sobre los individuos comunes en el panel y sobre la variable dicotómica que induce la tasa de desempleo (perteneciente a la población económicamente activa). En resumen, el término de covarianza en este caso sería igual a:

$$
Cov(\hat{P}_1, \hat{P}_2) = \frac{1}{2}\sqrt{Var(\hat{P}_1)}\sqrt{Var(\hat{P}_2)}R_{1,2}
$$

#### Covarianza en comparaciones de un mismo mes {-}

Suponga que se quiere comparar la tasa de desempleo entre hombres y mujeres en un mismo mes. En este escenario no existe independencia en el muestreo de hombres y mujeres puesto que estos grupos no son estratos de muestreo. En este caso $T_1$ es la proporción de hombres en la muestra y $T_2$ es la proporción de mujeres en la muestra. Nótese que $P_1 \neq P_2$. 

Por otro lado, existe una correlación natural entre las UPMs que fueron seleccionadas y que contienen tanto a hombres como a mujeres, por lo tanto $R_{12} \neq 0$. Note que esta correlación se calcula sobre todos los individuos de la muestra pertenecientes a la fuerza de trabajo y sobre la variable dicotómica que induce la tasa de desempleo. En resumen, el término de covarianza en este caso sería igual a:

$$
Cov(\hat{P}_1, \hat{P}_2) = \sqrt{Var(\hat{P}_1)}\sqrt{Var(\hat{P}_2)}\sqrt{T_1}\sqrt{T_2}R_{1,2}
$$

#### Covarianza en comparaciones de un mismo mes {-}

Suponga que se quiere comparar la tasa de desempleo entre dos ciudades del mismo país en un mismo mes. En este escenario existe independencia en el muestreo de las dos ciudades porque la selección es independiente en cada ciudad. Esta independencia se tiene por definición del diseño de muestreo puesto que ambas ciudades son estratos de muestreo. En este caso $T_1$  es la proporción de personas de la primera ciudad en la muestra y $T_2$ es la proporción de personas de la segunda ciudad en la muestra. Además, tampoco no existe una correlación entre las UPMs que fueron seleccionadas entre estas ciudades porque la selección fue independiente, por lo tanto $R_{12} = 0$. En resumen, el término de covarianza es nulo y por ende la varianza del estimador sería igual a:

$$
Var(\hat{d}) 
= Var(\hat{P}_1) + Var(\hat{P}_2)
$$

### Tamaño de muestra para la estimación del impacto en dos mediciones longitudinales

Para las encuestas que planean un seguimiento panel o de panel rotativo, es posible contemplar escenarios en los que se quiera estimar el efecto de una intervención, definido como la diferencia en diferencias de las proporciones de interés. De esta forma, el efecto se define como:

\begin{equation}
Efecto =(P_{1,1}-P_{2,1})-(P_{1,2}-P_{2, 2})
\end{equation}

En donde $P_{i,j}$ $(i, j = 1, 2.)$ corresponden a las proporciones del grupo $i$ en la oleada $j$. Entonces el tamaño de muestra mínimo^[Note que el tamaño de muestra de toda la encuesta es $4n$, en las dos oleadas, puesto que se debe seleccionar $n$ elementos en cada grupo.]  necesario para lograr una estimación confiable de esta diferencia, con menos de $\varepsilon \%$ de error, es:
 
\begin{equation} 
n \geq \dfrac{(P_{1,SO}Q_{1,SO}+P_{1,LB}Q_{1,LB}+P_{2,SO}Q_{2,SO}+P_{2,LB}Q_{2,LB})(1-TR)DEFF}{\dfrac{\varepsilon^2}{z_{\alpha}^2}+\dfrac{(P_{1,SO}Q_{1,SO}+P_{1,LB}Q_{1,LB}+P_{2,SO}Q_{2,SO}+P_{2,LB}Q_{2,LB})(1-TR_{1,2})DEFF}{N}}
\end{equation} 

En donde $T$ corresponde a la tasa de traslape ($T=1$ corresponde a un panel completo, $T=0.5$ a un semi-panel con traslape del 50\% y el caso extremo $T=0$ a una encuesta en donde no hay traslape) y $R_{1,2}$ se define como la correlación entre las dos oleadas ($R=0$ implica que no hay correlación entre los dos momentos, $R=-1$ implica una máxima correlación negativa entre los dos momentos y $R=1$ implica una correlación positiva máxima entre los dos momentos). 

Por ejemplo, en una encuesta de fuerza laboral intermediada por alguna intervención gubernamental, puede ser de interés la evaluación del efecto de esa política de asistencia laboral entre hombres y mujeres en dos periodos de tiempo. 

### Tamaño de muestra para el contraste de hipótesis en la diferencia de proporciones

Suponga que el investigador desea realizar el contraste de una hipótesis de interés. En particular, suponga que hay dos grupos de interés en la población finita y que la hipótesis está inducida por la diferencia de las proporciones en las dos poblaciones. El investigador considera que la diferencia es significativa para el fenómeno en cuestión si es mayor que un valor $D$ definido de antemano y conocido como el *tamaño del efecto* que el investigador desea detectar.

Nótese que la significación estadística, inducida por un valor-p, no siempre tiene la misma connotación de significación científica o económica, que puede presentarse en fenómenos raros, para los cuales no necesariamente se gozaría de significación estadística. Por lo tanto el sistema de hipótesis que se quiere contrastar es el siguiente:
\begin{equation*}
H_o: P_1-P_2=0 \ \ \ \ \ vs.  \ \ \ \ \ H_a: P_1 -P_2 =D > 0 
\end{equation*}

Nótese que, acudiendo a la distribución normal de los estimadores de las proporciones, y suponiendo independencia en el muestreo de los subgrupos, la regla de decisión en este caso induce el rechazo de la hipótesis nula cuando 
\begin{align*}
\dfrac{\hat{P}_1-\hat{P}_2}{\sqrt{Var(\hat{P}_1-\hat{P}_2)}} > Z_{1-\alpha}
\end{align*}

Si las características del estudio implican que el diseño de muestreo es complejo con un $DEFF > 1$, entonces esta regla de decisión rechaza la hipótesis nula si
\begin{align*}
\dfrac{\hat{P}_1-\hat{P}_2}{\sqrt{\frac{DEFF}{n}\left(1-\frac{n}{N}\right)(P_1Q_1+P_2Q_2)}} > Z_{1-\alpha}
\end{align*}

En este caso, es necesario controlar la probabilidad de cometer el error tipo 2 (aceptar una hipótesis nula, dado que ésta es falsa). A esta probabilidad se le conoce como *potencia} y, suponiendo que nuestro interés está en $P_1 -P_2 =D$, está dada por

\begin{align*}
\beta &\leq Pr\left(\dfrac{\hat{P}_1-\hat{P}_2}{\sqrt{\frac{DEFF}{n}\left(1-\frac{n}{N}\right)(P_1Q_1+P_2Q_2)}} > Z_{1-\alpha} \left. | \right. P_1 -P_2 =D \right)\\
&= Pr\left(\dfrac{(\hat{P}_1-\hat{P}_2)-D}{\sqrt{\frac{DEFF}{n}\left(1-\frac{n}{N}\right)(P_1Q_1+P_2Q_2)}} > Z_{1-\alpha} - \dfrac{D}{\sqrt{\frac{DEFF}{n}\left(1-\frac{n}{N}\right)(P_1Q_1+P_2Q_2)}} \right)\\
&= 1-\Phi\left(Z_{1-\alpha} - \dfrac{D}{\sqrt{\frac{DEFF}{n}\left(1-\frac{n}{N}\right)(P_1Q_1+P_2Q_2)}} \right)
\end{align*}

Por lo anterior, se tiene que 
\begin{align*}
1-\beta \geq \Phi\left(Z_{1-\alpha} - \dfrac{D}{\sqrt{\frac{DEFF}{n}\left(1-\frac{n}{N}\right)(P_1Q_1+P_2Q_2)}} \right)
\end{align*}

Entonces, 
\begin{align*}
Z_{1-\beta}& \leq Z_{1-\alpha} - \dfrac{D}{\sqrt{\frac{DEFF}{n}\left(1-\frac{n}{N}\right)(P_1Q_1+P_2Q_2)}} 
\end{align*}

En consecuencia, al despejar $n$, se tiene que la muestra en cada subgrupo debe mayor que:
\begin{align}
n \geq \dfrac{DEFF(P_1Q_1+P_2Q_2)}{\dfrac{D^2}{(Z_{1-\alpha}+Z_{\beta})^2}+\dfrac{DEFF(P_1Q_1+P_2Q_2)}{N}}
 \end{align}
 

## Algunas consideraciones adicionales

Cuando la encuesta se ha planeado para que tenga representatividad para algún conjunto de estratos, es necesario replicar estas mismas expresiones en cada uno de los subgrupos de interés. Por otro lado, las anteriores aproximaciones al cálculo de tamaño de muestra son insuficientes ante la realidad de la ausencia de respuesta y las desactualizaciones de los marcos de muestreo de UPM. 

### Ajustes de subcobertura

Debido a las características propias de las encuestas de hogares, siempre se presentará un fenómeno que puede ser descrito como una realidad: *existirá ausencia de respuesta en las encuestas de hogares*. En estos términos, los institutos nacionales de estadística deben tomar medidas preventivas al momento de adjudicar los tamaños de muestra en cada estrato, puesto que contar con un tamaño efectivo de muestra mucho menor al planeado inicialmente puede conllevar problemas de sesgo y de precisión en las estimaciones de las cifras nacionales o regionales, con las cuales se aborda la política económica y de desarrollo de los países de la región. 

En encuestas de hogares cuyo diseño es longitudinal, no solamente se debe abordar el problema de la ausencia de respuesta al momento de la aplicación de la encuesta, sino que debe ser visto de manera integral y más general debido a que un hogar que pertenezca a un panel puede decidir no participar más después de un par de visitas. Es así como la atrición se convierte en un problema que enmarca la ausencia de respuesta como un fenómeno al cual se debe prestar atención para evitar problemas de sesgo y baja confiabilidad. 

@Kalton_2009 advierte que el diseño de la encuesta debe tener en cuenta el ajuste de submuestras; por ejemplo, para estimar el cambio de la condición de pobreza o indigencia en los hogares es necesario realizar un ajuste al tamaño de muestra inicial para que al final de la aplicación de la encuesta el tamaño de muestra efectivo cumpla con los requerimientos de precisión de la inferencia estadística. Los INE pueden estimar, con base en su basta experiencia en la realización de encuestas, la probabilidad de que una persona (o jefe de hogar) responda al instrumento. Si esta probabilidad es denotada como $\phi=Pr(k \in s_r)$, en donde $s_r$ denota el subconjunto de respondientes efectivos, entonces los tamaños de muestra de individuos y hogares serán ajustados al dividirlos por $\phi$. De esta forma, si esta probabilidad fue estimada en $\phi = 0.8$, entonces todos los tamaños de muestra calculados en los pasos anteriores deberán ser ajustados como 

$$n_{final} = \frac{n_{inicial}}{0.8}$$

Por último, si la información auxiliar lo permite, este ajuste debería realizarse de manera diferenciada en cada uno de los estratos. Por ejemplo, si se conoce que este fenómeno de ausencia de respuesta tiene una mayor incidencia en lo rural que en lo urbano, entonces este ajuste debería tenerse en cuenta de forma diferenciada. 

### Sustituciones y reemplazos

Una práctica común en los operativos de campo de las encuestas de hogares en Latinoamérica es sustituir las UPM y viviendas para las cuales no se ha obtenido respuesta. Por ejemplo, se consideraría el reemplazo de las UPM cuando no se puede acceder al sitio geográfico por diferentes razones, como por ejemplo problemas de orden público o seguridad, algún cambio importante en la infraestructura de la zona, o porque no se tiene el consentimiento informado de las autoridades de la comunidad. En este caso, si no se puede acceder a la UPM, no se puede tampoco acceder a ninguno de los hogares que la integran. Los esquemas de sustituciones y reemplazos en las encuestas de hogares utiliza, por lo general, la metodología de *estratificación implícita* que permite seleccionar de manera automática a los reemplazos adecuados de acuerdo a la conformación de subgrupos poblacionales similares. 

La estratificación implícita es usada cuando la encuesta está enfocada en un tema particular y, para su ejecución exitosa, requiere el uso del muestreo sistemático con probabilidades desiguales en la selección de las UPM, es decir en la definición del diseño de muestreo de la primera etapa. Según @United_Nations_2008[pág. 46], en la mayoría de países la secuencia podría empezar con el estrato urbano, desagregado por departamento, a su vez desagregado por municipio; el estrato rural, de forma similar, es desagregado por departamento, a su vez desagregado por comuna o vereda. Observe que la selección sistemática de UPM está condicionada a la medida de tamaño utilizada en la primera etapa, es decir el número de viviendas que la componen. De esta forma, la estratificación implícita consiste en que, para cada estrato explícito (urbano, rural, regiones, etc.) se crea una lista ordenada de UPM. Esta lista estará ordenada por los estratos implícitos definidas en la planeación de la encuesta (departamento, municipio) y dentro de cada subgrupo se ordenan las UPM en orden descendente (o ascendente). De esta forma, esta metodología constituye un método objetivo de selección de reemplazos, puesto que si no se puede acceder a la UPM seleccionada originalmente, su reemplazo será la inmediatamente anterior (o posterior) en la lista estratificada implícitamente. Este procedimiento seleccionará como reemplazo a la UPM ubicada en el mismo municipio, dentro del mismo departamento, en la misma zona y con un número similar de viviendas, respetando el principio de representatividad. De otra forma, si no se considera un procedimiento similar a la estratificación implícita, los reemplazos de las UPM podrían ser seleccionados aleatoriamente en otro departamento y con un número de viviendas mucho más grande o mucho más pequeño, añadiendo sesgo a la selección inicial. 

Aunque la estratificación implícita permite acotar el sesgo generado por la ausencia de respuesta de las UPM, @Vehovar_1999[págs. 348 - 349] advierte que se debe tener precaución en cuanto a los usos de esta práctica puesto que también puede conllevar sesgos importantes en las estimaciones de interés. Lo anterior se desprende del hecho de que los individuos ubicados en zonas donde sí es posible acceder diferirán significativamente de aquellos individuos ubicados en las zonas de difícil acceso; es evidente que se trata de dos realidades diferentes. Por esta razón es útil que, después de haber valorado los posibles sesgos, si se ha tomado la determinación de realizar las sustituciones sobre las UPM de difícil acceso, se realice un seguimiento exhaustivo en cada levantamiento que permita clasificar el esquema de recolección de información primaria y se valore su impacto en la precisión de los estimadores resultantes. 
