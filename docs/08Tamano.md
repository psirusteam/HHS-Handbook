# Cálculo del tamaño de muestra

Uno de los tópicos más importantes en la literatura del diseño y análisis de encuestas de hogares es el tamaño de muestra. En general, en los libros de estadística y muestreo se establecen las características generales de los esquemas de muestreo y las propiedades estocásticas de los estimadores sin profundizar en que la muestra debe seleccionarse y que esta selección depende de cuántos hogares se necesiten en el estudio. De hecho, al hablar del tamaño de muestra en una encuesta de hogares, no solo se debe hacer referencia a los hogares, sino también a las personas. 

En efecto, la determinación del tamaño de muestra debe depender del propósito de la encuesta. Por ejemplo, considere una encuesta de propósitos múltiples que se levanta cada año con el fin de indagar acerca de fenómenos demográficos, sociales, educativos, y de condiciones de vida; en este contexto, se debe tener en cuenta que el tamaño de muestra definido debe ser útil, pertinente y apropiado para todos los indicadores que se desean medir al mismo tiempo. En este capítulo, el lector podrá encontrar una guía útil para identificar la mejor ruta a la hora de abordar el cálculo del tamaño de muestra en las encuestas de hogares. 

## Confiabilidad y precisión

Antes de introducir las metodologías básicas para el cálculo del tamaño de muestra mínimo, es necesario definir los diferentes tipos de error muestral en una encuesta. En principio, se define un intervalo de confianza para el parámetro $\theta$, inducido por su estimador insesgado $\hat{\theta}$ (que se supone con distribución normal de media $\theta$ y varianza $Var(\hat{\theta})$, como 

$$
IC(1-\alpha)=\left[\hat{\theta}-z_{1-\alpha / 2}\sqrt{ Var(\hat{\theta})},\hat{\theta}+z_{1-\alpha / 2}\sqrt{Var(\hat{\theta})}\right]
$$

donde $z_{1-\alpha / 2}$ se refiere al cuantil $(1-\alpha / 2)$ de una variable aleatoria con distribución normal estándar. Cuando el diseño de muestreo es complejo, es necesario reemplazar el percentil de la distribución normal estándar por el presentir de una distribución $t-student$ con $N_I - H$ grados de libertad, suponiendo que hay $N_I$ unidades primarias de muestreo y $H$ estratos. En este orden de ideas, nótese que

$$
1-\alpha=\sum_{Q_0 \supset s}p(s),
$$

donde $Q_0$ es el conjunto de todas las posible muestras cuyo intervalo de confianza contiene al parámetro $\theta$. Desde la expresión del intervalo de confianza, se define el *margen de error*, como aquella cantidad que se suma y se resta al estimador insesgado. En este caso, se define como 

$$
ME = z_{1-\alpha / 2}\sqrt{ Var(\hat{\theta})}
$$

Desde esta expresión también es posible definir el *error estándar*, dado por

$$
EE = \sqrt{ Var(\hat{\theta})}
$$

Las anteriores medidas sólo tienen en cuenta la precisión del estimador. Una medida que tiene en cuenta la precisión y el sesgo del estimador es el *margen de error relativo*, que se define como 

$$
MER = z_{1-\alpha / 2}\frac{\sqrt{ Var(\hat{\theta})}}{E(\hat{\theta})}
$$

De la misma manera, también se define el *coeficiente de variación* o *error estándar relativo* definido por 

$$
CV =  \frac{\sqrt{ Var(\hat{\theta})}}{E(\hat{\theta})}
$$

El tamaño de muestra dependerá del tipo de error que se quiera minimizar. Por ejemplo, para una población particular, el tamaño de muestra requerido para minimizar el margen de error, no será el mismo que el que se necesitará para minimizar el coeficiente de variación. 

## El efecto de diseño en la determinación del tamaño de muestra

Al momento de diseñar un estudio por muestreo con encuestas de hogares, es importante establecer el número mínimo de encuestas que se deben realizar. Esto es necesario para determinar el costo del estudio; y en el aspecto técnico, permite tener control desde la fase de diseño sobre la calidad estadística de los resultados esperados en el estudio. Como se mencionó anterioMERnte, esta calidad puede ser medida en términos del error muestral, con indicadores tales como el margen de error, el margen de error relativo o el coeficiente de variación. Todas estas medidas dependen de la varianza del estimador bajo el diseño muestral complejo; por lo tanto, contar con un valor aproximado para el efecto de diseño $DEFF$ nos permite obtener una aproximación a dicha varianza, y acercarnos al error muestral del estudio en la fase del diseño.

Uno de los primeros paradigmas con el que se debe lidiar es el de la independencia entre las observaciones. Este es un supuesto que gobierna gran parte de la teoría de análisis estadístico, pero que infortunadamente no se aplica en el contexto de las encuestas de hogares. Ante los retos que se debe enfrentar y las diversas estrategias de recolección de información, las fórmulas que se desprenden del supuesto de que los observaciones corresponden a una muestra de variables independientes e idénticamente distribuidas no son plausibles. 

La estratificación, las múltiples etapas y la aglomeración de las unidades de muestreo hacen que este supuesto no se cumpla en la práctica y por tanto, utilizar las expresiones tradicionales que se encuentran en los libros introductorios de estadística guiará a tamaños de muestra insuficientes. El problema del tamaño de muestra en encuestas de hogares ha sido abordado por diferentes autores con diferentes enfoques. Quizás uno de los más aceptados es aquel que define un factor de ajuste, llamado efecto de diseño, en función de la correlación que hay entre la variable de interés con las unidades primarias de muestreo. A partir de este efecto de diseño se calcula el número de personas que deben ser encuestadas para minimizar un error de muestreo predefinido. 

Cuando para la población de interés, se selecciona una muestra utilizando un diseño de muestreo de conglomerados o en varias etapas, no es imposible afirmar que existe independencia entre las observaciones. Lo anterior hace que no sea posible utilizar las fórmulas clásicas para la determinación de un tamaño de muestra, al considerar un diseño de muestreo aleatorio simple. Sin embargo, una forma sencilla de incorporar este efecto de aglomeración en las expresiones clásicas del muestreo aleatorio simple la da relación de las varianzas en el efecto de diseño:

$$
DEFF(\hat{\theta})=\frac{Var_p(\hat{\theta})}{Var_{MAS}(\hat{\theta})}
$$

Esta cifra da cuenta del efecto de aglomeración causado por la utilización de un diseño de muestreo cualquiera $(p)$, frente a un diseño de muestreo aleatorio simple (MAS) en la inferencia de un parámetro de la población finita $\theta$ (que puede ser un total, una proporción, una razón, un coeficiente de regresión, etc.). Por lo anterior, es posible escribir la varianza del estimador bajo el diseño de muestreo complejo como 

\begin{align}
Var_p(\hat{\theta}) & = DEFF(\hat{\theta}) \ Var_{MAS}(\hat{\theta}) \\
& = DEFF(\hat{\theta}) \ \frac{N^2}{n}\left(1-\frac{n}{N}\right)S^2_{y_U}
\end{align}

Por lo tanto, si al implementar un muestreo aleatorio simple el tamaño de muestra $n_0$ es suficiente para conseguir la precisión deseada, entonces el valor del tamaño de muestra que tendrá en cuenta el efecto de aglomeración para un diseño complejo estará cercano a $n \approx  n_0 \times DEFF$. Por ende, un efecto de diseño *DEFF = 2.0* implicaría que se deberían seleccionar casi el doble de unidades para lograr la misma confiabilidad que la producida por una muestra aleatoria simple. @United_Nations_2008 afirma que, dada esta relación, es claramente indeseable tener un plan de muestreo con valores mucho mayores que 2.5 o 3.0 para los indicadores clave de la encuesta. Esta advertencia crea una regla precisa a la hora de escoger el escenario de muestreo más conveniente, puesto que las tablas de muestreo deberán ser filtradas por los casos que induzcan efectos de diseño menores a 3. Lo cual quiere decir que los equipos técnicos dentro de los INE deben plantear esquemas en donde el efecto de diseño para los indicadores claves de la encuesta no sea desproporcionadamente grande. 

En particular, para el caso de una proporción, la calidad del estimador se puede medir en términos de la amplitud del intervalo de confianza de al menos $(1-\alpha) \times 100\%$; esto es, la distancia entre el estimador y el parámetro no debería superar un margen de error previamente establecido ($ME$). Así:

$$
1-\alpha \geq \Pr\left(|\hat{P}-P|<ME\right)
$$

Por ejemplo, el estimador de Horvitz-Thompson de la proporción $\hat{P}$ es insesgado para $P$ y su distribución asintótica es gausiana con varianza dada por

$$
Var\left(\hat{P}\right)=DEFF\frac{1}{n}(1-\frac{n}{N})P(1-P)
$$

Al despejar el tamaño muestral $n$ de la anterior expresión, se tiene que

$$
n\geq\frac{P(1-P)}{\frac{ME^2}{DEFF \ z_{1-\alpha/2}^2}+\frac{P(1-P)}{N}}
$$

De la misma manera, si el interés recae en la estimación de un promedio $\bar{y}_U$, el tamaño de muestra necesario para que la amplitud relativa del intervalo de confianza no supre un margen de error relativo previamente establecido ($MER$) es de 

$$
n \geq \dfrac{S^2_{y_U}DEFF}{\dfrac{MER^2 \bar{y}_U^2}{z_{1-\alpha/2}^2}+\dfrac{S^2_{y_U}DEFF}{N}}
$$

Por consiguiente, se evidencia que valores grandes del efecto de diseño inducirán un mayor tamaño de muestra. Claramente el incremento no es lineal, más aún, el tamaño de muestre se ve más afectado en la medida en que el $DEFF$ sea más grande.

## Algunos escenarios de interés

En general, en encuestas de hogares se parte de un marco de muestreo de áreas que agrupa a toda la población de un país. Estas áreas están definidas como agregaciones cartográficas o UPM y contienen a su vez a los hogares en donde se encuentran las personas que son susceptibles de ser entrevistadas. Sin embargo, debido a la agrupación natural de las personas en hogares, a veces los cálculos se hacen complejos, máxime conociendo que la población de interés es un subconjunto de los habitantes de los hogares. Por otro lado, debido a que el marco de muestreo comúnmente usado por las INE es una lista de UPM, se hace necesario más allá de calcular el tamaño de muestra de las personas, también calcular el tamaño de muestra de UPM y hogares en la muestra. Por lo tanto, en este documento se pretende sintetizar los mecanismos de asignación de muestra en tres escenarios que son comunes en la práctica estadística del diseño de encuestas de hogares: 

1. Asignación del tamaño de muestra en problemas de inferencia que tienen que ver con la estimación de parámetros de personas. En este escenario se presenta la metodología apropiada para calcular el tamaño de muestra de UPM, hogares y finalmente personas. 

2. Cuando la variable de diseño y en general, las variables más importantes de la encuestas están presentes a nivel de hogar, entonces no es necesario realizar un submuestreo de personas. Partiendo de la lógica presentada en el escenario anterior, se presenta la metodología adecuada para calcular el tamaño de muestra de UPM y de hogares. 

3. Un caso menos común en los países de América Latina se presenta cuando el marco de muestreo empadrona las personas dentro de las UPM y además la encuesta sólo pretende observar características asociadas a los habitantes del hogar (y por tanto no intenta observar características ni del hogar ni de la vivienda). En este caso no hay un submuestreo de hogares.

En general, al definir las expresiones de tamaño de muestra, se debe ser cuidadoso con la notación, para lo cual suponemos una población $U$ de $N$ elementos sobre la que se desea seleccionar una muestra $s$ de $n$ elementos en los cuales se quiere medir una característica de interés. En algunos casos, la población $U$ no constituye la población de interés sino que la contiene; es decir, si se define a $U_d$ como la población de interés, entonces $U_d \subseteq U$. En términos de notación, se tiene lo siguiente:

- $N$ es el tamaño de la población $U$.
- $n$ es el tamaño de la muestra $s$.
- $N_{I}$ es el número de UPM en el marco de muestreo.
- $n_{I}$ es el número de UPM que se selecciona en la muestra de la primera etapa $s_i$.
- $N_{II}$ es el número de hogares existentes en el país. 
- $n_{II}$ es el número de hogares seleccionados en la muestra de la segunda etapa $s_{II}$.
- $\bar{n}$ es el número promedio de personas que se van a seleccionar en cada UPM.
- $\bar{n}_{II}$ es el número promedio de hogares que se van a seleccionar en cada UPM.
- $\rho_y$ es el coeficiente de correlación intraclase, calculado para la variable de interés sobre las UPM.
- $b$ es el número promedio de personas por hogar.
- $r$ es el porcentaje promedio de personas en el hogar susceptibles de ser observadas para la característica de interés.
- $z_{1-\alpha/2}$ es el percentil ($1- \alpha/2$) asociado a una distribución normal estándar y a la confianza que se requiera en la inferencia. 

Para introducir las metodologías apropiadas, junto con las  expresiones adecuadas, en cada escenario se definirán las cantidades de interés, se dará una breve introducción al problema y se realizarán los cálculos detenidamente con ejemplos de encuestas reales. Para mantener la uniformidad en los cálculos, todos los ejemplos suponen una población de tamaño $N=50$ millones, con $N_{II} = 12$ millones de hogares, para el cual se desea obtener una muestra con una confianza del 90%. En cada escenario se supone que el país está dividido en $N_{I} =30$ mil UPM, conformadas por segmentos cartográficos (agregaciones de manzanas).

Para simplificar los cálculos y mantener la atención del lector, las expresiones que se presentarán en este capítulo corresponden al número de individuos que deberían ser seleccionados a nivel nacional, o para un solo subgrupo de interés. Por lo tanto, estos cálculos deben ser hechos tantas veces como dominios de representatividad exista en la encuesta. Por ejemplo, si el interés está en hacer inferencia en dos estratos: el rural y el urbano, entonces se debe calcular estas expresiones dos veces, una para cada área. Al final, el tamaño de muestra nacional será la sumatoria de los tamaños de muestra en cada uno de los estratos del país. 

## Tamaño de muestra para UPM, hogares y personas

Cuando la unidad de observación sean las personas, sin importar que la variable de interés esté a nivel de hogar, será necesario siempre basar nuestros cálculos en el tamaño de muestra de las personas. Por ejemplo, para tener una inferencia apropiada al estimar el ingreso medio percápita, el porcentaje de personas pobres o el porcentaje de personas con una característica particular es necesario definir a la población objetivo como todas las personas que componen un hogar para posterioMERnte medir la variable de interés que será observada para todas ellas.

Con estos elementos es posible realizar simulaciones de algunos escenarios de muestreo, que indiquen el tamaño de muestra necesario en cada una de las etapas de la selección de la muestra. Si fuese posible sistematizar los elementos más importantes a la hora de calcular el tamaño de muestra en una encuesta de hogares, sería necesario recurrir a los siguientes pasos de manera ordenada: 

- **Definir la población de interés de manera explícita**. En particular, es necesario aclarar si la unidad de análisis son las personas o los hogares. De esta forma, se debe fijar los valores para $r$ y $b$. Si la unidad de análisis son todas las personas del hogar, entonces el porcentaje de personas con la característica de interés será $r = 1$, de otra forma $r<1$. Por otro lado, el número promedio de personas por hogar $b$ dependerá del dominio de representatividad en el que se requiera el cálculo.

- **Definir el número promedio de hogares**. El número promedio de hogares que se desea encuestar en cada una de las UPM está dado por $\bar{n}_{II}$. Este proceso debería ser repetido de forma iterativa en los pasos subsiguientes para poder evaluar la calidad del diseño. De las varias opciones de $\bar{n}_{II}$ será necesario escoger solo una. 

- **Calcular el número promedio de personas que serán encuestadas**. Al igual que en el paso anterior es necesario probar varios escenarios que redundarán en la escogencia de un número óptimo de personas por UPM. Los valores de $\bar{n}$ dependen directamente del paso anterior al escoger $\bar{n}_{II}$. Debido a que la selección de las personas está supeditada a la selección de los hogares, entonces $\bar{n}$ se puede descomponer manteniendo la relación con $r$ y $b$, de la siguiente manera:

$$
\bar{n} = \bar{n}_{II} \times r \times b
$$

- **Calcular el efecto de diseño**. Es necesario definir (o calcular con encuestas o censos anteriores) la correlación intraclase de la variable de interés con el agrupamiento por UPM $\rho_y$. Luego de esto, se debe calcular el efecto de diseño $DEFF$ como función de $\rho_y$ y de $\bar{n}$; esto es $DEFF \approx 1 + (\bar{n} - 1)\rho_y$. Nótese que esta cifra sólo se calcula sobre la población de interés.

- **Calcular el tamaño de muestra de personas**. A partir de las expresiones de tamaño de muestra para diseños de muestreo complejos, calcular el tamaño de muestra necesario para lograr una precisión adecuada en la inferencia. En primer lugar, si lo que se quiere estimar es un promedio $\bar{y}_U$, el tamaño de muestra necesario para alcanzar un margen de error relativo máximo de $MER \times 100\%$ es de 

$$
n \geq \dfrac{S^2_{y_U}DEFF}{\dfrac{MER^2 \bar{y}_U^2}{z_{1 - \alpha/2}^2}+\dfrac{S^2_{y_U}DEFF}{N}}
$$

Por otro lado, si lo que se quiere estimar es una proporción $P$, y se utiliza el margen de error, entonces la expresión apropiada para calcular el tamaño de muestra estará dada por

$$
n \geq \dfrac{P\ (1-P)\ DEFF}{\dfrac{MER^2P^2}{z_{1-\alpha/2}^2}+\dfrac{P\ (1-P) \ DEFF}{N}}
$$

- **Calcular el tamaño de muestra de hogares**. Es necesario calcular el número total de hogares que deben ser seleccionados para lograr entrevistar a todas las personas que serán observadas en el punto anterior. El número de hogares que deben ser seleccionados estará determinado por las cantidades $n$, $b$ y $r$, de la siguiente forma

$$
n_{II} = \dfrac{n}{r \times b}
$$

- **Calcular el número de UPM**. Los hogares y las personas se observan a partir de las UPM. En este paso final es necesario calcular el número de UPM que deben ser seleccionadas en el muestreo a partir de la relación 

$$
n_{I} = \frac{n}{\bar{n}} 
= \frac{n_{II}}{\bar{n}_{II}}
$$ 

### Ejemplo: proporción de personas pobres 

Suponga que el parámetro de interés es el porcentaje de personas pobres (cuyo ingreso está por debajo de un umbral preestablecido) y se quiere hacer inferencia con un margen de error relativo máximo del 5%. Por estudios anteriores en este país, se ha estimado que la proporción de personas pobres está alrededor de $P = 4$%. Nótese que la población objetivo está conformada por todos los habitantes del hogar puesto que $r = 100$%. En este país se ha estimado que el tamaño promedio del hogar es de alrededor de $b = 3.5$ personas. Por último, según levantamientos anteriores, la correlación intraclase de la característica de interés con las unidades primarias de muestreo es $\rho_y = 0.034$.

La siguiente tabla resume los resultados del ejercicio para $\bar{n}_{II} =$ 10 hogares por UPM, los cuales implican que por cada UPM se entrevistarían en promedio a $\bar{n} = 10 * 1 * 3.5 = 35$ personas. Con lo anterior se obtendría un efecto de diseño $DEFF =$ 2.2, para un total de personas en la muestra de $n = 55936$ que serán observados a partir de la selección de $n_{II} = 55936/(1 * 3.5) = 15982$ hogares en $n_{I} = 55936 / 35 = 1598$ UPM.

|Hogares promedio por UPM $(\bar{n}_{II})$|Personas promedio por UPM $(\bar n)$| DEFF| Muestra de UPM $(n_I)$|Muestra de hogares $(n_{II})$| Muestra de personas $(n)$|
|:---------:|:-----------:|:----:|:-------:|:-------:|:-------:|
|          10|          35|  2.2| 1598|   15982|    55936|

Por supuesto que es posible plantear otros escenarios a medida que se evalúe el efecto que conlleva el cambio del número de hogares que se seleccionan en cada UPM. Por ejemplo, el investigador podría proponer que se seleccionarán en promedio 5 hogares por UPM, lo cual cambiaría el número de UPM que serían seleccionadas en la muestra de la primera etapa, así como también el número total de personas que serían seleccionadas en todo el operativo. Debido a que el efecto de diseño es una función del número de hogares promedio a seleccionar en las UPM, esta cifra también variará. A continuación se muestran algunos resultados que permiten establecer estos escenarios cuando se varía el tamaño de muestra promedio de hogares por UPM. La escogencia del escenario ideal se debe dar en términos de la conveniencia logística y presupuestal en el estudio. Siguiendo las recomendaciones internacionales, se desestimarían los escenarios con efectos de diseño mayores a 3.

|Hogares promedio por UPM $(\bar{n}_{II})$|Personas promedio por UPM $(\bar n)$| DEFF| Muestra de UPM $(n_I)$|Muestra de hogares $(n_{II})$| Muestra de personas $(n)$|
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


### Ejemplo: ingreso promedio por persona  

Suponga que se desea estimar el ingreso promedio por hogar con un margen de error relativo máximo del 2%. La variable de interés (ingreso) es continua y se estima que la media oscila alrededor de $\bar{y}_U=1180$ dólares con una varianza de $S^2_{y_U}=1845.94^2$.  En este caso, la población objetivo son todos los habitantes del hogar, por lo cual $r = 100\%$. La composición del hogar se calcula en $b = 3.79$ personas por hogar. Por último, según levantamientos anteriores, la correlación intraclase de la característica de interés es $\rho_y = 0.035$. Nótese que la correlación intraclase cambia con respecto a la característica que se desee medir. 

La siguiente tabla muestra los resultados del ejercicio al seleccionar $\bar{n}_{II} =$ 15 hogares por UPM, que a su vez implica que por cada UPM se encontrarían en promedio $\bar{n}= 15 * 1 * 3.79 \cong 57$ personas por UPM. Con lo anterior se obtendría un efecto de diseño $DEFF =$ 3, para un total de personas en la muestra de $n = 48861$ que serán observados a partir de la selección de $n_{II} = 48861 / (1 * 3.79) = 12892$ hogares en $n_{I} =$ 859 UPM.

|Hogares promedio por UPM $(\bar{n}_{II})$|Personas promedio por UPM $(\bar n)$| DEFF| Muestra de UPM $(n_I)$|Muestra de hogares $(n_{II})$| Muestra de personas $(n)$|
|:---------:|:-----------:|:----:|:-------:|:-------:|:-------:|
|          15|          57|    3|  859|   12892|    48861|


A continuación se muestran algunos resultados que permiten establecer otros escenarios de muestreo cuando se varía el tamaño de muestra promedio de hogares por UPM. Recuérdese que cualquiera de estos escenarios es válido, desde el punto de vista de la eficiencia estadística, aunque no todos serán válidos si se tienen en cuenta otros aspectos como los logísticos o presupuestales. Por ejemplo, si se escogiera el penúltimo escenario, entonces para 50 hogares por UPM, se debería encuestar en promedio a 190 personas, lo cual reduciría el número de UPM a 662, pero aumentaría el tamaño de muestra general a 33098 personas, lo cual involucraría mayores costos de contratación de encuestadores, supervisores y seguramente un operativo de campo de más días de duración. Siguiendo las recomendaciones internacionales, se desestimarían los escenarios con efectos de diseño mayores a 3.

|Hogares promedio por UPM $(\bar{n}_{II})$|Personas promedio por UPM $(\bar n)$| DEFF| Muestra de UPM $(n_I)$|Muestra de hogares $(n_{II})$| Muestra de personas $(n)$|
|:---------:|:-----------:|:----:|:-------:|:-------:|:-------:|
|           5|          19|  1.6| 1422|    7108|    26938|
|          10|          38|  2.3| 1000|   10001|    37902|
|          15|          57|  3.0|  859|   12892|    48861|
|          20|          76|  3.6|  789|   15783|    59816|
|          25|          95|  4.3|  747|   18672|    70766|
|          30|         114|  4.9|  719|   21560|    81711|
|          50|         190|  7.6|  662|   33098|   125443|
|         100|         379| 14.2|  619|   61857|   234439|



### Ejemplo: tasa de desocupación en adultos mayores 

Suponga que la incidencia de la desocupación está alrededor de $P = 5.5$% en la población objetivo, que son las personas económicamente activas (PEA) mayores de 60 años; en este país, se ha estimado que en promedio hay $r = 4.6$% de adultos mayores por hogar que pertenecen a la PEA, cuyo tamaño promedio es de alrededor de $b = 5$ personas. Además, se quiere hacer inferencia con un margen de error relativo máximo del 15%. Por último, según levantamientos anteriores, la correlación intraclase de la característica de interés es $\rho_y = 0.7$.

La siguiente tabla muestra los resultados del ejercicio, que implica que seleccionar $\bar{n}_{II} =$ 20 hogares por UPM implicaría un promedio de $\bar{n} = 20 * 0.046 * 5 = 4.6$ adultos mayores en la PEA (personas de interés) por UPM. Con lo anterior se obtendría un efecto de diseño $DEFF =$ 3.5, para un total de $n = 7272$ adultos mayores en la PEA que serán observados en la muestra a partir de la selección de $n_{II} = 7272 / (0.046 * 5) \cong 31617$ hogares en $n_{I} = 7272 / 4.6 \cong 1581$ UPM.

|Hogares promedio por UPM $(\bar{n}_{II})$|Personas promedio por UPM $(\bar n)$| DEFF| Muestra de UPM $(n_I)$|Muestra de hogares $(n_{II})$| Muestra de personas $(n)$|
|:---------:|:-----------:|:----:|:-------:|:-------:|:-------:|
|          20|         4.6|  3.5| 1581|   31617|     7272|

En este caso la muestra en los 31617 hogares induce un operativo muy grande que implicaría la observación de $31617 * 5 = 158085$ personas en los hogares, de las cuales $n = 7272$ serían los casos de interés. Como se ha visto en los anteriores ejemplos, es posible plantear otros escenarios a medida que se evalúe el efecto que conlleva el cambio del número de hogares que se seleccionan en cada UPM. A continuación se muestran algunos resultados que permite establecer estos escenarios cuando se varía el tamaño de muestra promedio de hogares por UPM. Siguiendo las recomendaciones internacionales, se desestimarían los escenarios con efectos de diseño mayores a 3.

|Hogares promedio por UPM $(\bar{n}_{II})$|Personas promedio por UPM $(\bar n)$| DEFF| Muestra de UPM $(n_I)$|Muestra de hogares $(n_{II})$| Muestra de personas $(n)$|
|:---------:|:-----------:|:----:|:-------:|:-------:|:-------:|
|           5|         1.1|  1.1| 1985|    9926|     2283|
|          10|         2.3|  1.9| 1716|   17157|     3946|
|          15|         3.5|  2.7| 1626|   24387|     5609|
|          20|         4.6|  3.5| 1581|   31617|     7272|
|          25|         5.8|  4.3| 1554|   38848|     8935|
|          30|         6.9|  5.1| 1536|   46074|    10597|
|          50|        11.5|  8.3| 1500|   74983|    17246|
|         100|        23.0| 16.4| 1472|  147222|    33861|

 

## Tamaño de muestra para UPM y hogares

En algunas ocasiones la variable de interés y la unidad de observación están a nivel de hogar. Por ejemplo, cuando todas las variables de interés se miden a nivel de la vivienda o del hogar. En este caso es posible modificar el algoritmo de la sección anterior para seleccionar únicamente a las viviendas u hogares en la muestra, sin necesidad de realizar un submuestreo de personas. En este caso algunas cantidades desaparecen porque no son objeto de la población de hogares, como lo son $r$ y $b$; algunas otras expresiones deben ser redefinidas al contexto de los hogares, como por ejemplo, el coeficiente de correlación intraclase $\rho_y$, el efecto de diseño y todas las expresiones de tamaños de muestra. En todo caso, la adaptación del algoritmo se describe a continuación.

- **Definir el número promedio de hogares**. El número promedio de hogares que se desea encuestar en cada una de las UPM está dado por $\bar{n}_{II}$. Esta cifra sigue siendo el insumo más importante del algoritmo y se propone crear escenarios de muestreo a partir de su modificación y evaluación del tamaño de muestra final.

- **Calcular el efecto de diseño**. Es necesario definir (o calcular con encuestas o censos anteriores) la correlación intraclase $\rho_y$ de la variable de interés *a nivel del hogar* con el agrupamiento por UPM definido por la división cartográfica del último censo. De igual forma, el efecto de diseño $DEFF \approx 1 + (\bar{n}_{II} - 1)\rho_y$ sigue siendo función del tamaño de muestra promedio de hogares por UPM $(\bar{n}_{II})$.

- **Tamaño de muestra de hogares**. Partiendo de las expresiones de tamaño de muestra generales para muestreos complejos y teniendo en cuenta que la población de interés son los hogares y que la variable de interés está a nivel de hogar, entonces el tamaño de muestra necesario para alcanzar un margen de error relativo máximo de $MER$ % es de 

$$
n_{II} \geq \dfrac{S^2_{y}DEFF}{\dfrac{MER^2 \bar{y}^2}{z_{1-\alpha/2}^2}+\dfrac{S^2_{y_U}DEFF}{N_{II}}}
$$

La expresión apropiada para calcular el tamaño de muestra para una proporción estará dada por
$$
n_{II} \geq \dfrac{P\ (1-P)\ DEFF}{\dfrac{MER^2P^2}{z_{1-\alpha/2}^2}+\dfrac{P\ (1-P) \ DEFF}{N_{II}}}
$$

- **Cálculo del número de UPM**. Los hogares se observan a partir de las UPM. En este paso final es necesario calcular el número de UPM que deben ser seleccionadas en el muestreo a partir de la relación 
$$
n_{I} = \frac{n_{II}}{\bar{n}_{II}}
$$ 

### Ejemplo: gasto promedio del hogar  

Suponga que se desea estimar el promedio de gasto anual en dólares en los hogares del país con un margen de error relativo máximo admisible del 3.5%. La variable de interés (gasto) es continua y se estima que la media oscila alrededor de $\bar{y}_U=1407$ dólares con una varianza de $S^2_{y_U}=2228^2$. En este ejemplo se supone que el país está dividido en $N_I = 10$ mil UPM y la correlación intraclase de la característica de interés, medida a nivel del hogar, con las UPM es de $\rho_y = 0.173$.

La siguiente tabla muestra los resultados del ejercicio para $\bar{n}_{II} = 12$ hogares promedio por UPM, que serán observados a partir de la selección de $n_{II} = 16056$ hogares y $n_{I} = 16056 / 12 = 1338$ UPM, los cuales inducen un efecto de diseño $DEFF =$ 2.9.

|Hogares promedio por UPM $(\bar{n}_{II})$| DEFF|Muestra de UPM $(n_I)$|Muestra de hogares $(n_{II})$|
|:-----------:|:----:|:----:|:-------:|
|          12|  2.9| 1338|   16056|


A continuación se muestran algunos resultados que permiten establecer otros escenarios de muestreo al variar el tamaño de muestra promedio de hogares por UPM. Nótese que, por ejemplo, en el caso de seleccionar 20 hogares por UPM, se debería seleccionar una muestra de 23695 hogares en tan solo 1185 UPM. Por otro lado, si sólo se seleccionaran 2 hogares por UPM, se tendrían que visitar 3246 UPM en todo el país, aunque el número de encuestas totales descendería a 6493. 

Para este tipo de operativos, en donde los cuestionarios de gasto de los hogares están acompañados de un operativo exhaustivo que le permite al investigador conocer los hábitos de consumo del hogar de forma desagregada, y en donde se visita el hogar durante un periodo de tiempo determinado, tal vez sea más conveniente estudiar la viabilidad de seleccionar más hogares por UPM y menos UPM para que el operativo de campo no exija la contratación de demasiado personal en campo. Al estar agrupados en menos UPM, se podría definir un mejor levantamiento de la información con un equipo mediano de personas; de lo contrario, se debería contratar bastante más personal que cubra las UPM dispersas a lo largo del país. Siguiendo las recomendaciones internacionales, se desestimarían los escenarios con efectos de diseño mayores a 3. 

|Hogares promedio por UPM $(\bar{n}_{II})$| DEFF|Muestra de UPM $(n_I)$|Muestra de hogares $(n_{II})$|
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

### Ejemplo: proporción de hogares sin agua potable  

Suponga que se desea obtener una muestra con un margen de error relativo máximo admisible del 10% sobre la variable de interés (necesidades básicas insatisfechas en agua) y el parámetro de interés es el porcentaje de hogares con esta carencia. En este país, se estima que la proporción de hogares con esta condición asciende a $P = 7.5$%.  En este ejemplo se supone que la correlación intraclase de la característica de interés con las UPM es de $\rho_y = 0.045$.

La siguiente tabla muestra los resultados del ejercicio para $\bar{n}_{II} =$ 10 hogares por UPM, que serán observados a partir de la selección de $n_{II} = 4360$ hogares en $n_{I} = 4360/10 = 436$ UPM, que inducen un efecto de diseño $DEFF =$ 1.3.

|Hogares promedio por UPM $(\bar{n}_{II})$| DEFF|Muestra de UPM $(n_I)$|Muestra de hogares $(n_{II})$|
|:-----------:|:----:|:----:|:-------:|
|          10|  1.3|  436|    4360|

A continuación se muestran algunos resultados que permiten establecer otros escenarios de muestreo al variar el tamaño de muestra promedio de hogares por UPM. Observe que el efecto de diseño DEFF es directamente proporcional al número de hogares entrevistados por UPM y al tamaño de muestra de hogares final; de la misma manera, es inversamente proporcional al número de UPM. 

|Hogares promedio por UPM $(\bar{n}_{II})$| DEFF|Muestra de UPM $(n_I)$|Muestra de hogares $(n_{II})$|
|:-----------:|:----:|:----:|:-------:|
|           5|  1.1|  758|    3790|
|          10|  1.3|  436|    4360|
|          15|  1.5|  328|    4924|
|          20|  1.6|  274|    5490|
|          25|  1.8|  242|    6057|
|          30|  2.0|  221|    6624|
|          35|  2.2|  205|    7190|
|          40|  2.3|  194|    7757|
|          45|  2.5|  185|    8323|

 

## Tamaño de muestra para UPM y personas

En algunos casos en donde la variable de interés esté a nivel de persona y el cuestionario de la encuesta no induzca preguntas acerca del hogar, y además exista un inventario detallado de las personas que residen en cada UPM, es posible evadir la selección de los hogares e ir directamente a la selección de personas. En este caso, la lógica del cálculo del tamaño de muestra se mantiene modificando en cierta manera el algoritmo de las secciones anteriores, tal como se ilustra a continuación. 

- **Definir la población de interés de manera explícita**. En este caso solo se mantiene la expresión correspondiente a $r$ que denota el porcentaje de personas con la característica de interés en la población.

- **Definir el número promedio de personas**. El número promedio de personas (casos de la población objetivo) que se desean encuestar por cada UPM está dado por $\bar{n}$. Al igual que en las secciones anteriores, se recomienda hacer una evaluación sobre esta cantidad para determinar posibles escenarios de muestreo. 

- **Calcular el efecto de diseño**. Es necesario definir el efecto de diseño $DEFF$ como una función de la correlación existente entre la variable de interés y la conformación de las UPM. De esta forma, $DEFF \approx 1 + (\bar{n} - 1)\rho_y$. Nótese que esta cifra solo podrá ser calculada sobre la población de interés. 

- **Tamaño de muestra de personas**. A partir de las expresiones de tamaño de muestra para muestreos complejos, calcular el tamaño de muestra necesario para lograr una precisión adecuada en la inferencia. En este caso, las expresiones de tamaño de muestra coinciden con las del primer escenario. 

- **Tamaño de muestra final**. Es necesario calcular el número total de personas que deben ser seleccionados para lograr observar a quienes hacen parte de la población objetivo. Esta cantidad está dada por $n / r$.

- **Cálculo del número de UPM**. Finalmente, las personas se observan a partir de las UPM. En este paso final es necesario calcular el número de UPM que deben ser seleccionadas en el muestreo a partir de la relación. 
$$
n_{I} = \frac{n}{\bar{n}} 
$$ 

### Ejemplo: ingreso promedio en personas empleadas  

Suponga que se desea estimar el ingreso promedio en las personas empleadas con un margen de error relativo máximo admisible del 2%. La variable de interés (ingreso) es continua y se estima que la media oscila alrededor de $\bar{y}_U=1458$ dólares con una varianza de $S^2_{y_U}=2191^2$. Nótese que la población objetivo son todas las personas empleadas, cuya proporción se estima en $r = 46$%. La correlación intraclase de la característica de interés es $\rho_y = 0.038$.

La siguiente tabla muestra los resultados del ejercicio al seleccionar $\bar{n} = 23$ personas de la población de interés por UPM, que a su vez implica que por cada UPM se deberían seleccionar y enlistar en promedio $23/0.46 = 50$ personas por UPM. Con lo anterior se esperarían $n = 28029$ personas empleadas en la muestra repartidas en $n_{I} = 28029 / 23 \cong 1219$ UPM; en este caso se obtendría un efecto de diseño $DEFF = 1.8$. Nótese que en este escenario, el operativo de campo abarcaría la selección y enlistamiento de $28029/0.46 \cong 60933$ personas, de las cuales se esperaría que 28029 fueran de la población de interés (personas empleadas). 

|Personas seleccionadas por UPM $(\bar{n} / r )$|Personas empleadas por UPM $\bar{n}$| DEFF| Muestra de UPM $(n_I)$|Muestra de personas empleadas $(n)$|Muestra de personas $(n/r)$|
|:-----------:|:-------------:|:----:|:-------:|:-------:|:---------:|
|          50|            23|  1.8| 1219|      28029|    60933|


A continuación se muestran algunos resultados que permiten establecer otros escenarios de muestreo cuando se varía el tamaño de muestra promedio de hogares por UPM. Siguiendo las recomendaciones internacionales, se desestimarían los escenarios con efectos de diseño mayores a 3. 

|Personas seleccionadas por UPM $(\bar{n} / r )$|Personas empleadas por UPM $\bar{n}$| DEFF| Muestra de UPM $(n_I)$|Muestra de personas empleadas $(n)$|Muestra de personas $(n/r)$|
|:-----------:|:-------------:|:----:|:-------:|:-------:|:---------:|
|          25|            12|  1.4| 1857|      21360|    46435|
|          50|            23|  1.8| 1219|      28029|    60933|
|          75|            34|  2.3| 1006|      34695|    75424|
|         100|            46|  2.7|  899|      41360|    89913|
|         125|            58|  3.1|  835|      48023|   104398|


### Ejemplo: proporción de analfabetas pobres  

Suponga que se quiere estimar la proporción de incidencia de la pobreza sobre la población analfabeta con un margen de error relativo máximo admisible del 15%. Se ha estimado que alrededor del $r = 14$% de las personas del país no saben leer ni escribir. Por otro lado, tal como se vio en un ejemplo anterior, el fenómeno de la pobreza está estimado en $P = 4$%. y la correlación intraclase de la característica de interés es $\rho_y = 0.0454$.

La siguiente tabla muestra los resultados del ejercicio al seleccionar un promedio de $\bar{n} = 14$ personas por UPM que no saben leer ni escribir; esto implica la selección y enlistamiento de $14 / 0.14 = 100$ personas por UPM. Con lo anterior se obtendría un efecto de diseño $DEFF =$ 1.6, para un total de personas en la muestra de $n = 4574$ personas analfabetas, de una muestra 32671 personas enlistadas y repartidas en $n_{I} = 4574/14 \cong 327$ UPM.

|Personas seleccionadas por UPM $(\bar{n} / r)$|Personas analfabetas por UPM $(\bar{n})$| DEFF| Muestra de UPM $(n_I)$|Muestra de personas analfabetas $(n)$|Muestra de personas $(n/r)$|
|:-----------:|:-------------:|:----:|:-------:|:-------:|:---------:|
|         100|            14|  1.6|  327|       4574|    32671|


Es posible plantear otros escenarios a medida que se evalúe el efecto que conlleva el cambio del número de hogares que se seleccionan en cada UPM. A continuación se muestran algunos resultados que permite establecer estos escenarios cuando se varía el tamaño de muestra promedio de hogares por UPM. 

|Personas seleccionadas por UPM $(\bar{n} / r )$|Personas analfabetas por UPM $(\bar{n})$| DEFF| Muestra de UPM $(n_I)$|Muestra de personas analfabetas $(n)$|Muestra de personas $(n/r)$|
|:-----------:|:-------------:|:----:|:-------:|:-------:|:---------:|
|          25|           3.5|  1.1|  917|       3211|    22936|
|          50|           7.0|  1.3|  524|       3665|    26179|
|          75|          10.5|  1.4|  392|       4120|    29429|
|         100|          14.0|  1.6|  327|       4574|    32671|
|         125|          17.5|  1.7|  287|       5029|    35921|


## Otros escenarios de interés

En las encuestas de hogares también surgen escenarios particulares que llevan a sugerir distintos caminos para la adopción de un determinado tamaño de muestra. En esta sección analizaremos los casos en los que los parámetros de interés son diferencias de proporciones y dobles diferencias. También se revisará el caso del planteamiento de pruebas de hipótesis y su relación con el tamaño de muestra. 

### Tamaño de muestra para la estimación de la diferencia de dos proporciones   


Suponga una población $U$, que se encuentra particionada^[Esta metodología también aplica en el caso en el que $U \supset (U_1 \cup U_2)$.] en dos subpoblaciones $U_1$ de tamaño $N_1$ y $U_2$, de tamaño $N_2$. El interés del investigador está en conocer la diferencia de algunas proporciones entre estos grupos. Por ejemplo, suponga que se quiere conocer la diferencia entre las proporciones de niños desnutridos por sexo. Se espera que la proporción de niños desnutridos no supere la proporción de niñas desnutridas para verificar que no hay brechas de sexo. Por lo tanto, el parámetro de interés se escribe como:

$$
\theta=P_1-P_2=\frac{N_{d1}}{N_1}-\frac{N_{d2}}{N_2}
$$

En donde $N_{di}=\sum_{k\in U_i}z_{dik}$ $(i=1,2)$ y $z_{dik}$ es una característica dicotómica que indica si el individuo $k$-ésimo de la subpoblación $U_i$ está en estado de desnutrición. Por supuesto, bajo muestreo aleatorio simple, un estimador insesgado para $\theta$ es

$$
\hat{\theta}=\hat{P}_1-\hat{P}_2=\frac{\hat{N}_{d1}}{N_1}-\frac{\hat{N}_{d2}}{N_2}
$$

En donde, $\hat{N}_{di}=\frac{N_i}{n_i}\sum_{k\in s_i}z_{dik}$ y $s_i$ es la muestra asociada con la población $U_i$. Luego, la varianza del anterior estimador es:

$$
Var(\hat{\theta})=Var\left(\hat{P}_1\right)+Var\left(\hat{P}_2\right)-2Cov\left(\hat{P}_1, \hat{P}_2\right)
$$

Por otro lado, siendo $|U_i|$ la cardinalidad del conjunto $U_i$, se definen las siguientes relaciones:

$$
T_i = \frac{|U_1 \cap U_2|}{|U_i|} \ \ \ \ \ \ i =1, 2. 
$$


De esta forma, $T_1$ y $T_2$ corresponde al porcentaje de traslape de las subpoblaciones. De la misma manera, definiendo a $R_{1,2}$ como la correlación de Pearson entre los datos observados de ambas subpoblaciones, entonces la covarianza entre este par de estimadores estaría determinada por la siguiente relación [@Kish_2004]:

$$
Cov(\hat{P}_1, \hat{P}_2) = \sqrt{Var(\hat{P}_1)}\sqrt{Var(\hat{P}_2)}\sqrt{T_1}\sqrt{T_2}R_{1,2}
$$

En esta instancia, es útil recordar que si las poblaciones $U_1$ y $U_2$ son estratos (o agregaciones de estratos) que inducen conjuntos dijuntos y la selección de la muestra en cada uno es independiente por diseño, entonces $Cov(\hat{P}_1, \hat{P}_2) = 0$. Si, por otro lado, no existe independencia en el muestreo de ambas poblaciones, entonces $R_{1,2} \neq 0$ necesariamente. Es útil recordar que esta correlación se debe evaluar a través de las UPM. Siguiendo con el ejemplo, a pesar de que las subpoblaciones son niños y niñas, $R_{1,2} \neq 0$. Por otro lado, para encontrar el tamaño de muestra óptimo, es útil realizar los siguientes supuestos:

1. Asumir que las subpoblaciones son grandes y por ende $N_1=N_2=N$.
2. Por lo anterior, asumir que los tamaños de muestra pueden ser iguales, tales que $n_1=n_2=n$. 

Nótese a su vez que, si el levantamiento de las observaciones no puede ser realizado utilizando muestreo aleatorio simple, sino que por el contrario, la muestra aleatoria fue seleccionada mediante un diseño de muestreo complejo con un efecto de diseño^[Recuerde que si el muestreo es aleatorio simple, el efecto de diseño es $DEFF=1$.] $(DEFF)$ no ignorable y mayor a uno, entonces la varianza tomaría la siguiente forma 

$$
Var(\hat{\theta})=\frac{DEFF}{n}\left(1-\frac{n}{N}\right)S^2_{\theta}
$$

En donde, definiendo a $Q_i = 1-P_i$, se tiene que:

$$
S^2_{\theta} = P_1Q_1+P_2Q_2 - 2 \sqrt{T_1}\sqrt{T_2}R_{1,2} \sqrt{P_1Q_1}\sqrt{P_2Q_2}
$$
De esta manera, un intervalo de confianza del 95% para la diferencia de proporciones está dado por

$$
IC(95\%)_{\theta}=\hat{\theta} \pm z_{1-\alpha/2} \sqrt{\frac{DEFF}{n}\left(1-\frac{n}{N}\right)S^2_{\theta}}
$$

Lo anterior quiere decir que el margen de error $(ME)$ de la encuesta debe ser tal que:

$$
ME < z_{1-\alpha/2} \sqrt{\frac{DEFF}{n}\left(1-\frac{n}{N}\right)S^2_{\theta}}
$$

Por lo tanto, despejando $n$, se tiene que la muestra en cada subgrupo debe mayor que:

$$
 n> \dfrac{DEFF \ S^2_{\theta}}{\dfrac{ME^2}{z_{1-\alpha/2}^2}+\dfrac{DEFF \ S^2_{\theta}}{N}}
$$

Nótese que, dependiendo de los pocentajes de traslape $\sqrt{T_1}$, $\sqrt{T_2}$ y de la correlación de la característica de interés en ambas subpoblaciones $R_{1,2}$, la varianza $S^2_{\theta}$ tomará diferentes formas, como se detalla a continuación:

1. Si no hay traslape, $T_1 = T_2 = 0$, y $S^2_{\theta} = P_1Q_1+P_2Q_2$.
1. Si hay traslape completo, $T_1 = T_2 = 1$ y $S^2_{\theta} = P_1Q_1+P_2Q_2 - 2 R_{1,2} \sqrt{P_1Q_1}\sqrt{P_2Q_2}$.
1. Si hay traslape parcial y balanceo, $T_1 = T_2 = T$ y si además se considera que las varianzas en cada subgrupo o periodo son similares $P_1Q_1 = P_2Q_2 = PQ$, entonces $S^2_{\theta} = 2PQ (1- TR_{1,2})$.

#### Covarianza en comparaciones mensuales 

Suponga que se quiere comparar la tasa de desempleo nacional entre dos meses consecutivos. En este escenario, asumiendo que existe independencia en el muestreo de los dos meses consecutivos, el porcentaje de traslape de muestra entre los dos meses (que por diseño es nulo) es igual a cero. Por lo tanto, $T_1 = T_2 = 0$. Luego, el término de la covarianza se anula. En resumen, la varianza del estimador en este caso sería igual a:

$$
Var(\hat{P}_1-\hat{P}_2) 
= Var(\hat{P}_1) + Var(\hat{P}_2)
$$

#### Covarianza en comparaciones trimestrales o anuales 

Bajo un esquema rotativo 2(2)2, suponga que se quiere comparar la tasa de desempleo nacional entre trimestres consecutivos o entre el mismo mes de dos años consecutivos. En este escenario no existe independencia en el muestreo de los dos trimestres consecutivos puestos que la estructura del panel garantiza un traslape del 50%. En este caso $T_1 = T_2 \approx 0.5$.

Por otro lado, existe una correlación natural entre las viviendas comunes en el panel que se midieron en los periodos de interés, por lo tanto $R_{1,2} \neq 0$. Note que esta correlación se calcula sobre los individuos comunes en el panel y sobre la variable dicotómica que induce la tasa de desempleo (perteneciente a la población económicamente activa). En resumen, el término de covarianza en este caso sería igual a:

$$
Cov(\hat{P}_1, \hat{P}_2) = \frac{1}{2}\sqrt{Var(\hat{P}_1)}\sqrt{Var(\hat{P}_2)}R_{1,2}
$$

#### Covarianza en comparaciones de un mismo mes 

En primer lugar, suponga que se quiere comparar la tasa de desempleo entre hombres y mujeres en un mismo mes. En este escenario no existe independencia en el muestreo de hombres y mujeres puesto que estos grupos no son estratos de muestreo. En este caso $T_1$ es la proporción de hombres y $T_2$ es la proporción de mujeres. Nótese que $T_1 \neq T_2$. 

Como se comentó anterioMERnte, existe una correlación natural entre las UPM que fueron seleccionadas y que contienen tanto a hombres como a mujeres, por lo tanto $R_{12} \neq 0$. Note que esta correlación se calcula sobre todos los individuos pertenecientes a la fuerza de trabajo y sobre la variable dicotómica que induce la tasa de desempleo. En resumen, el término de covarianza en este caso sería igual a:

$$
Cov(\hat{P}_1, \hat{P}_2) = \sqrt{Var(\hat{P}_1)}\sqrt{Var(\hat{P}_2)}\sqrt{T_1}\sqrt{T_2}R_{1,2}
$$


Por otro lado, suponga que se quiere comparar la tasa de desempleo entre dos regiones del mismo país en un mismo mes. En este escenario existe independencia en el muestreo de las dos regiones porque la selección es independiente en cada región Esta independencia se tiene por definición del diseño de muestreo puesto que ambas regiones son agrupaciones disjuntas entre estratos de muestreo. En este caso $T_1$  es la proporción de personas de la primera ciudad y $T_2$ es la proporción de personas de la segunda ciudad. Además, tampoco no existe una correlación entre las UPM que fueron seleccionadas entre estas regiones porque la selección fue independiente, por lo tanto $R_{12} = 0$. En resumen, el término de covarianza es nulo y por ende la varianza del estimador sería igual a:

$$
Var(\hat{d}) 
= Var(\hat{P}_1) + Var(\hat{P}_2)
$$

### Tamaño de muestra para la estimación del impacto en dos mediciones longitudinales   

Para las encuestas que planean un seguimiento panel o de panel rotativo, es posible contemplar escenarios en los que se quiera estimar el efecto de una intervención, definido como la diferencia en diferencias de las proporciones de interés. De esta forma, el efecto se define como:

$$
\theta = (P_{1,1}-P_{2,1})-(P_{1,2}-P_{2, 2})
$$

En donde $P_{i,j}$ $(i, j = 1, 2.)$ corresponden a las proporciones del grupo $i$ en la oleada $j$. Entonces el tamaño de muestra mínimo^[Note que el tamaño de muestra de toda la encuesta es $4n$, en las dos oleadas, puesto que se debe seleccionar $n$ elementos en cada grupo y en cada oleada.]  necesario para lograr una estimación confiable de esta diferencia, con menos del $ME \times 100\%$ de margen de error, es:
 
$$
n \geq \dfrac{DEFF \ S^2_{\theta}}{\dfrac{ME^2}{z_{1 - \alpha/2}^2}+\dfrac{DEFF \ S^2_{\theta}}{N}}
$$

En donde

$$
S^2_{\theta} = (P_{1,1}Q_{1,1}+P_{1,2}Q_{1,2}+P_{2,1}Q_{2,1}+P_{2,2}Q_{2,2})(1-TR)
$$

En donde $T$ corresponde a la tasa de traslape ($T=1$ corresponde a un panel completo, $T=0.5$ a un semi-panel con traslape del 50\% y el caso extremo $T=0$ a una encuesta en donde no hay traslape) y $R$ se define como la correlación entre las dos oleadas ($R=0$ implica que no hay correlación entre los dos momentos, $R=-1$ implica una máxima correlación negativa entre los dos momentos y $R=1$ implica una correlación positiva máxima entre los dos momentos). 

Por ejemplo, en una encuesta de fuerza laboral inteMERdiada por alguna intervención gubernamental, puede ser de interés la evaluación del efecto de esa política de asistencia laboral entre hombres y mujeres en dos periodos de tiempo. 

### Tamaño de muestra para el contraste de hipótesis en la diferencia de proporciones   

Suponga que el investigador desea realizar el contraste de una hipótesis de interés. En particular, suponga que hay dos grupos de interés en la población finita y que la hipótesis está inducida por la diferencia de las proporciones en las dos poblaciones. El investigador considera que la diferencia es significativa para el fenómeno en cuestión si es mayor que un valor $D$ definido de antemano y conocido como el *tamaño del efecto* que el investigador desea detectar.

Nótese que la significación estadística, inducida por un valor-p, no siempre tiene la misma connotación de significación científica o económica, que puede presentarse en fenómenos raros, para los cuales no necesariamente se gozaría de significación estadística. Por lo tanto el sistema de hipótesis que se quiere contrastar es el siguiente:

$$
H_o: P_1-P_2=0 \ \ \ \ \ vs.  \ \ \ \ \ H_a: P_1 -P_2 =D > 0 
$$

Nótese que, acudiendo a la distribución normal de los estimadores de las proporciones, y suponiendo independencia en el muestreo de los subgrupos, la regla de decisión en este caso induce el rechazo de la hipótesis nula cuando 

$$
\dfrac{\hat{P}_1-\hat{P}_2}{\sqrt{Var(\hat{P}_1-\hat{P}_2)}} > z_{1-\alpha}
$$

Si las características del estudio implican que el diseño de muestreo es complejo con un $DEFF > 1$, entonces esta regla de decisión rechaza la hipótesis nula si

$$
\dfrac{\hat{P}_1-\hat{P}_2}{\sqrt{\frac{DEFF}{n}\left(1-\frac{n}{N}\right)(P_1Q_1+P_2Q_2)}} > z_{1-\alpha}
$$

En este caso, es necesario controlar la probabilidad de cometer el error tipo-2 (aceptar una hipótesis nula, dado que ésta es falsa). A esta probabilidad se le conoce como *potencia* y, suponiendo que nuestro interés está en detectar un tamaño del efecto $P_1 -P_2 =D$, la potencia está dada por

\begin{align*}
\beta &\leq Pr\left(\dfrac{\hat{P}_1-\hat{P}_2}{\sqrt{\frac{DEFF}{n}\left(1-\frac{n}{N}\right)(P_1Q_1+P_2Q_2)}} > z_{1-\alpha} \left. | \right. P_1 -P_2 =D \right)\\
&= Pr\left(\dfrac{(\hat{P}_1-\hat{P}_2)-D}{\sqrt{\frac{DEFF}{n}\left(1-\frac{n}{N}\right)(P_1Q_1+P_2Q_2)}} > z_{1-\alpha} - \dfrac{D}{\sqrt{\frac{DEFF}{n}\left(1-\frac{n}{N}\right)(P_1Q_1+P_2Q_2)}} | P_1 -P_2 =D
\right)\\
&= 1-\Phi\left(z_{1-\alpha} - \dfrac{D}{\sqrt{\frac{DEFF}{n}\left(1-\frac{n}{N}\right)(P_1Q_1+P_2Q_2)}} \right)
\end{align*}

Por lo anterior, 
$$
1-\beta \geq \Phi\left(z_{1-\alpha} - \dfrac{D}{\sqrt{\frac{DEFF}{n}\left(1-\frac{n}{N}\right)(P_1Q_1+P_2Q_2)}} \right)
$$

Entonces, dado que la función $\Phi()$ es creciente, se tiene que 

$$
z_{1-\beta} \geq z_{1-\alpha} - \dfrac{D}{\sqrt{\frac{DEFF}{n}\left(1-\frac{n}{N}\right)(P_1Q_1+P_2Q_2)}} 
$$

En consecuencia, al despejar $n$, se tiene que la muestra en cada subgrupo debe mayor que:

$$
n \geq \dfrac{DEFF(P_1Q_1+P_2Q_2)}{\dfrac{D^2}{(z_{1-\alpha}+z_{\beta})^2}+\dfrac{DEFF(P_1Q_1+P_2Q_2)}{N}}
$$


## Algunas relaciones de interés para proporciones

Cuando se trata de estadísticas de la fuerza laboral, una variable clave para el diseño de una encuesta de hogares que mida la dinámica del mercado de trabajo es el estado de los individuos en la fuerza laboral. Para los gobiernos, es de interés proporcionar un conjunto de indicadores destinados a medir y rastrear la ocupación de los ciudadanos del país (o región). Por ejemplo, se puede obtener estimaciones de la tasa de desempleo actual (medida mensual o trimestralmente); asimismo, también son de interés la variación neta entre dos períodos y los flujos brutos entre categorías de empleo entre períodos.

Es posible mencionar tres tipos de planificación en las encuestas de hogares desde las cuales es posible abordar adecuadamente las características particulares de los estudios de fuerza laboral. La primera es a través de las encuestas repetidas,donde se realizan mediciones similares en diferentes puntos del tiempo a diferentes personas cada vez. La segunda son las encuestas de panel, donde se realizan mediciones en diferentes puntos en el tiempo a las mismas personas cada vez. La tercera son las encuestas rotativas, donde se incluyen elementos y se siguen en la muestra durante un período específico, y a medida que salen de la muestra, se agregan nuevos elementos.

Una regla general común para calcular el tamaño de la muestra afirma que como la variable de diseño es dicotómica (dependiendo del estado de empleo), la varianza de ese tipo de variables encuentra su máximo cuando la probabilidad de éxito es 0.5. Sin embargo, si las políticas públicas en un país se centran en lograr que la tasa de desempleo sea baja a través de algunas intervenciones gubernamentales que afectan (positivamente) a la fuerza laboral, y si esas estrategias son efectivas, entonces la probabilidad de éxito de la variable de diseño cambia y puede afectar el tamaño de la muestra de las encuestas de hogares.

En esta sección  documento, centramos nuestra atención en el tamaño de la muestra inducido por el control del margen de error; en donde a medida que la proporción disminuye, el tamaño de la muestra aumenta sustancialmente. Sin embargo, al controlar el margen de error, debido a que la función de varianza detrás de este enfoque es simétrica alrededor de 0.5, se puede encontrar que el mismo tamaño de muestra necesario para cumplir con los requisitos de calidad para cualquier proporción $(P_d)$ es el mismo que el requerido para satisfacer los requisitos de calidad para su complemento aditivo $(1 - P_d)$.

A continuación se proporciona varios ejemplos que tipifican algunos escenarios que se pueden encontrar en la práctica. Los cálculos se pueden reproducir empleando el software estadístico `R` [@R2020], mediante el uso de la biblioteca `samplesize4surveys` [@ss4s], utilizando específicamente las funciones `ss4p` y `ss4dp`

### Estimación de proporciones 

1. Primer escenario: si la tasa de desempleo es baja, digamos ${P}=0.05$ y el margen de error se fija en $ME = 0.0025$, entonces el intervalo de confianza esperado sería $IC=0.05\pm0.0025=(0.0475,0.0525)$. En este caso el tamaño de muestra requerido es de alrededor de 55169.

2. Segundoescenario: si la tasa de desempleo es alta, digamos  ${P}=0.2$, y el margen de error de error se fija en $ME = 0.01$, entonces el intervalo de confianza sería $IC=0.2\pm0.01=(0.19,0.21)$, y el tamaño de muestra requerido es 12144.

Nótese que ambos escenarios dan lugar al mismo margen de error relativo (MER), definido como $MER=\frac{ME}{{P}}$. En efecto, para el primero, tenemos $MER=(0.0025/0.05)\times 100\%=5\%$, y para el segundo, tenemos  $MER=(0.01/0.2)\times 100\%=5\%$. Por lo tanto, incluso para el mismo margen de error relativo, el tamaño de la muestra debe ser mayor si el fenómeno que nos interesa tiene una baja incidencia en la población finita. De hecho, es posible definir una función de información para saber si el tamaño de su muestra es suficiente para cumplir con los requisitos de calidad para una proporción determinada. Esto es útil porque no se sabe exactamente qué valor tomará la proporción. Además, si la encuesta de hogares intenta estimar otras proporciones (como en una encuesta multipropósito), se encontrará rápidamente si su tamaño de muestra actual es adecuado para todo el estudio.

3. Tercer escenario: si el tamaño de la muestra se define como $n = 10000$, y la proporción es $P=0.2$, entonces el coeficiente de variación será de 2,8% y el margen de error será del 1.1%. Es posible notar que todas las proporciones estimadas tendrán un margen de error inferior al 1.4%.

4. Cuarto escenario: si el tamaño de la muestra se define como $n = 40000$, y la proporción se centra en $P=0.05$, entonces el coeficiente de variación será del 3% y el margen de error será de 0.2%. Es posible notar que todas las proporciones estimadas tendrán un margen de error inferior al 0.7%.

Teniendo en cuenta que, para una proporción $P$ dada, el tamaño de muestra requerido para lograr un margen de error particular es el mismo que para su complemento aditivo $1-P$, como es de esperar, si un tamaño de muestra alcanza los requisitos para una proporción establecida, también alcanzará los requisitos de calidad para cualquier proporción superior.

Sin embargo, para una proporción $P$, el tamaño muestral requerido para lograr un coeficiente de variación particular no es el mismo que para su complemento aditivo $1-P$. Luego, para una proporción baja, se puede encontrar que con un tamaño de muestra dado el coeficiente de variación será mayor que para su complemento aditivo. Sobre la base de los resultados encontrados en esta sección, y bajo un $MER$ fijo (5% en todos los  casos), encontramos que al intentar estimar proporciones (como la tasa de desempleo):

* Si la proporción es baja, anticipamos un gran tamaño de muestra.
* Si la proporción es alta, esperamos un tamaño de muestra pequeño.

### Estimación de cambios netos 

Ahora dirigimos nuestra atención a los cambios netos en la tasa de desempleo durante dos períodos, $\Delta= |P_{1}-P_{2}|$. Este tipo de parámetro se puede estimar utilizando una encuesta repetida, rotativa o de panel.  Sin embargo, como se evidenció en las anteriores secciones, hay una reducción en el tamaño de la muestra si se intentan estimar los cambios netos desde una encuesta rotativa o de panel. Como no estamos  estimando una proporción, sino un cambio neto,tenemos que considerar qué valores son adecuados para el establecer el margen de error absoluto.  

5. Quinto escenario: si no esperamos cambios significativos entre ambos períodos, y las tasas de desempleo son altas, por ejemplo $\Delta \approx |0.22-0.20|=0.02$, y el margen de error se fija en $ME = 0.001$, entonces el intervalo de confianza sería $IC=0.02 \pm 0.001=(0.019,0.021)$, y el tamaño de muestra requerido estaría alrededor de 96224.

6. Sextoescenario: si no esperamos cambios significativos entre períodos, y las tasas de desempleo son bajas, por ejemplo $\Delta \approx |0.05-0.03| =0.02$, y el margen de error se fija en $ME = 0.001$, entonces el intervalo de confianza sería $IC=0.02\pm0.001=(0.019,0.021)$, y el tamaño de muestra requerido debería ser de 59536.

7. Séptimo escenario: si esperamos cambios significativos entre períodos, y las tasas de desempleo difierenpor ejemplo $\Delta \approx|0.05-0.20|=0.15$ y el margen de error se fija en $ME = 0.0075$, entonces el intervalo de confianza sería $IC=0.15\pm0.0075=(0.1425,0.1575)$, y el tamaño de muestra requerido estaría alrededor de 22083.


Nótese qeu los escenarios quinto, sexto y séptimo dan como resultado el mismo $MER$, definido como
$MER=\frac{ME}{\mathrm{\Delta}}$. En efecto, para el séptimo escenario tenemos $MER=$(0.0075/0.15)%=5%, y para el quinto y sexto, tenemos  $MER=$(0.001/0.02)%=5%. Por lo tanto, incluso para el mismo valor del cambio neto, el tamaño de la muestra no será el mismo y variará dependiendo de la configuración de las proporciones. Por supuesto, hay que esperar cambios más drásticos si varía la porción del traslape y la correlación entre períodos. 

Además, se debe tener en cuenta que es posible encontrar diferentes configuraciones de proporciones en ambos periodos que induzcan el mismo valor en el cambio neto.	Contrariamente a lo que se esperaría, si un tamaño de muestra alcanza los requisitos de calidad para un parámetro $\Delta$, no necesariamente cumplirá con los requisitos de calidad para el mismo valor nominal del cambio neto bajo una configuración diferente en las proporciones involucradas.

Para cumplir con los requisitos de calidad, bajo el mismo $MER$, se necesitará un mayor tamaño de muestra si no se esperan cambios significativos en las tasas de desempleo entre los períodos involucrados. Si el cambio neto sigue siendo el mismo para ambos períodos, para cumplir con los requisitos de calidad, bajo el mismo $MER$, se necesitará un mayor tamaño de muestra si el fenómeno del desempleo es alto. Ahora, al intentar estimar los cambios netos de proporciones (como el cambio anual o mensual en las tasas de desempleo), encontramos que:

* Si las tasas son significativamente diferentes, esperamos un tamaño de muestra pequeño.
* Si las tasas son similares y las proporciones son bajas, requerimos un tamaño de muestra moderado.
* Si las tasas son similares, y las proporciones son grandes, esperamos un gran tamaño de muestra.

## Algunas consideraciones adicionales

Cuando la encuesta se ha planeado para que tenga representatividad para algún conjunto de estratos, es necesario replicar estas mismas expresiones en cada uno de los subgrupos de interés. Por otro lado, las anteriores aproximaciones al cálculo de tamaño de muestra son insuficientes ante la realidad de la ausencia de respuesta y las desactualizaciones de los marcos de muestreo. En esta sección se profundizará en estos tópicos. 

### Asignación del tamaño de muestra en los estratos de muestreo   

Como se aclaró anteriormente, todas las encuestas de hogares en América Latina tienen un componente explícito de estratificación, y por ende una pregunta que surge inmediatamente es: ¿después de determinar el tamaño de muestra general, como asignarlo apropiadamente en todos los estratos de muestreo? En general, se supone que el tamaño de la muestra general es $n$ y que hay $H$ estratos fijos; por ende, se quiere determinar los tamaños de muestra $n_h$ para cada estrato $(h = 1, \ldots, H)$, de tal manera que se garantice la ganancia de precisión de la estrategia de muestreo. 

Existen varios tipos de asignación que pueden estudiarse para determinar la más apropiada, en términos de eficiencia; a continuación se presenta una lista no exhaustiva de ellas:

1. Asignación proporcional: en donde se selecciona una proporción de elementos en cada estrato siguiendo la estructura poblacional. @Lohr_2019 afirma que este tipo de asignación se utiliza cuando es deseable que la muestra se pueda ver como una versión miniatura de la población. @Gutierrez_2016 señala que si se define la *fracción de muestreo* como $f_h=n_h/N_h$ en el estrato $h$, entonces al utilizar la asignación proporcional la fracción de muestreo será la misma para todos los estratos, tal que $f_h=f$. En este caso la probabilidad de inclusión de cualquier elemento en la población $\pi_k=f_h=f$ es constante y fija. De esta manera, cada unidad en la muestra representará el mismo número de elementos en la población, independientemente del estrato al que pertenezca. Bajo la asignación proporcional, el tamaño de muestra en cada estrato está dado por
$$
n_h=f \times N_h
$$

1. Asignación de Neyman: en donde se selecciona una muestra de elementos en cada estrato de tal forma que se maximice la eficiencia estadística de la estrategia de muestreo. la estructura poblacional. @Groves_Fowler_Couper_Lepkowski_Singer_Tourangeau_2009 mencionan que, bajo este método, se producen las menores varianzas para la media muestral comparado con otras técnicas de asignación de tamaño de muestra. Bajo la asignación de Neyman, el tamaño de muestra que minimiza la varianza de la estrategia de muestreo está dado por
$$
n_h=n\dfrac{N_hS_{yU_h}}{\sum_{h=1}^HN_hS_{yU_h}}
$$
donde $S_{yU_h}=\sqrt{S_{yU_h}^2}$ es la raíz de la varianza de la característica de interés en cada estrato. @Gutierrez_2016 afirma que, con respecto a la asignación de Neyman, es recomendable redondear el tamaño de muestra en cada estrato al entero más próximo. 

1. Asignación de Kish: al usar la asignación proporcional en los estratos pequeños, la muestra puede resultar muy pequeña, generando problemas de eficiencia y pérdida de precisión. Por otro lado, utilizar una asignación unifoMER (selección del mismo número de elementos en cada estrato $n_h = c$) tendrá como consecuencia una variación sustancial en las fracciones de muestreo entre los estratos y, por ende, una fracción de muestreo muy grande del estrato más pequeño. Un punto inteMERdio entre la asignación proporcional y la asignación unifoMER es la asignación propuesta por Kish, la cual toma la siguiente expresión:

$$
n_h=n\frac{\sqrt{\frac{1}{H^2}+I\ W_h^2}}{\sum_{h=1}^{H}\sqrt{\frac{1}{H^2}+I\ W_h^2}}
$$

En donde $W_h=N_h/N$, e $I \geq 0$ es el índice de asignación de Kish, que denota la importancia relativa entre las estimaciones nacionales y las de cada estrato. A medida que este índice se hace más pequeño, menor importancia se le dará a las estimaciones nacionales. La asignación de Kish proporciona un balance entre la asignación unifoMER y la proporcional. Cuando $I=0$, se reduce a la asignación unifoMER, mientras que si $I \rightarrow \infty$ tiende a un enfoque de asignación proporcional. Usualmente se utiliza $I = 1$ para garantizar que la precisión de las características de interés en lo nacional y en los estratos sea aproximadamente la misma. 


### Ajustes de subcobertura   

Debido a las características propias de las encuestas de hogares, siempre se presentará un fenómeno que puede ser descrito como una realidad: *existirá ausencia de respuesta en las encuestas de hogares*. En estos términos, los institutos nacionales de estadística deben tomar medidas preventivas al momento de adjudicar los tamaños de muestra en cada estrato, puesto que contar con un tamaño efectivo de muestra mucho menor al planeado inicialmente puede conllevar problemas de sesgo y de precisión en las estimaciones de las cifras nacionales o regionales, con las cuales se aborda la política económica y de desarrollo de los países de la región. 

En encuestas de hogares cuyo diseño es longitudinal, no solamente se debe abordar el problema de la ausencia de respuesta al momento de la aplicación de la encuesta, sino que debe ser visto de manera integral y más general debido a que un hogar que pertenezca a un panel puede decidir no participar más después de un par de visitas. Es así como la atrición se convierte en un problema que enmarca la ausencia de respuesta como un fenómeno al cual se debe prestar atención para evitar problemas de sesgo y baja confiabilidad. 

@Kalton_2009 advierte que el diseño de la encuesta debe tener en cuenta el ajuste de submuestras; por ejemplo, para estimar el cambio de la condición de pobreza o indigencia en los hogares es necesario realizar un ajuste al tamaño de muestra inicial para que al final de la aplicación de la encuesta el tamaño de muestra efectivo cumpla con los requerimientos de precisión de la inferencia estadística. Los INE pueden estimar, con base en su basta experiencia en la realización de encuestas, la probabilidad de que una persona (o jefe de hogar) responda al instrumento. Si esta probabilidad es denotada como $\phi=Pr(k \in s_r)$, en donde $s_r$ denota el subconjunto de respondientes efectivos, entonces los tamaños de muestra de individuos y hogares serán ajustados al dividirlos por $\phi$.
$$n_{final} = \frac{n_{inicial}}{\phi}$$

Por ejemplo, si esta probabilidad fue estimada en $\phi = 0.8$, entonces todos los tamaños de muestra calculados en los pasos anteriores deberán ser ajustados como $n_{final} = \frac{n_{inicial}}{0.8} = 1.25\times n_{inicial}$.  Por último, si la información auxiliar lo permite, este ajuste debería realizarse de manera diferenciada en cada uno de los estratos. Por ejemplo, si se conoce que este fenómeno de ausencia de respuesta tiene una mayor incidencia en lo rural que en lo urbano, entonces este ajuste debería tenerse en cuenta de forma diferenciada. 

### Sustituciones y reemplazos   

Una práctica común en los operativos de campo de las encuestas de hogares en Latinoamérica es sustituir las UPM y viviendas para las cuales no se ha obtenido respuesta. Por ejemplo, se consideraría el reemplazo de las UPM cuando no se puede acceder al sitio geográfico por diferentes razones; por ejemplo, problemas de orden público o seguridad, algún cambio importante en la infraestructura de la zona, o porque no se tiene el consentimiento informado de las autoridades de la comunidad. En este caso, si no se puede acceder a la UPM, no se puede tampoco acceder a ninguno de los hogares que la integran. Los esquemas de sustituciones y reemplazos en las encuestas de hogares utiliza, por lo general, la metodología de *estratificación implícita* que permite seleccionar de manera automática a los reemplazos adecuados de acuerdo a la conformación de subgrupos poblacionales similares. 

La estratificación implícita es usada cuando la encuesta está enfocada en un tema particular y, para su ejecución exitosa, requiere el uso del muestreo sistemático con probabilidades desiguales en la selección de las UPM, es decir en la definición del diseño de muestreo de la primera etapa. Según @United_Nations_2008[pág. 46], en la mayoría de países la secuencia podría empezar con el estrato urbano, desagregado por departamento, a su vez desagregado por municipio; el estrato rural, de forma similar, es desagregado por departamento, a su vez desagregado por comuna o vereda. Observe que la selección sistemática de UPM está condicionada a la medida de tamaño utilizada en la primera etapa, es decir el número de viviendas que la componen. De esta forma, la estratificación implícita consiste en que, para cada estrato explícito (urbano, rural, regiones, etc.) se crea una lista ordenada de UPM. Esta lista estará ordenada por los estratos implícitos definidas en la planeación de la encuesta (departamento, municipio) y dentro de cada subgrupo se ordenan las UPM en orden descendente (o ascendente). De esta forma, esta metodología constituye un método objetivo de selección de reemplazos, puesto que si no se puede acceder a la UPM seleccionada originalmente, su reemplazo será la inmediatamente anterior (o posterior) en la lista estratificada implícitamente. Este procedimiento seleccionará como reemplazo a la UPM ubicada en el mismo municipio, dentro del mismo departamento, en la misma zona y con un número similar de viviendas, respetando el principio de representatividad. De otra forma, si no se considera un procedimiento similar a la estratificación implícita, los reemplazos de las UPM podrían ser seleccionados aleatoriamente en otro departamento y con un número de viviendas mucho más grande o mucho más pequeño, añadiendo sesgo a la selección inicial. 

Aunque la estratificación implícita permite acotar el sesgo generado por la ausencia de respuesta de las UPM, @Vehovar_1999[págs. 348 - 349] advierte que se debe tener precaución en cuanto a los usos de esta práctica puesto que también puede conllevar sesgos importantes en las estimaciones de interés. Lo anterior se desprende del hecho de que los individuos ubicados en zonas donde sí es posible acceder diferirán significativamente de aquellos individuos ubicados en las zonas de difícil acceso; es evidente que se trata de dos realidades diferentes. Por esta razón es útil que, después de haber valorado los posibles sesgos, si se ha tomado la determinación de realizar las sustituciones sobre las UPM de difícil acceso, se realice un seguimiento exhaustivo en cada levantamiento que permita clasificar el esquema de recolección de información primaria y se valore su impacto en la precisión de los estimadores resultantes. 

