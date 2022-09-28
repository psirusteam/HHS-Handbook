# Construcción de los factores de expansión

En todas las bases de datos de las encuestas de hogares se encuentra una columna que contiene los pesos de muestreo o factores de expansión. Con esta columna se realizan todos los análisis requeridos en la encuesta, desde estimar medias, razones, tamaños y proporciones hasta el ajuste de modelos lineales y no lineales. La razón principal por la cual se usan los factores de expansión es para producir estimaciones que reflejen de manera precisa el comportamiento de la población objetivo. El uso correcto de los factores de expansión garantiza que la estimación sea insesgada y consistente, que el error de muestreo sea pequeño, condicionado al diseño muestral y al tamaño de la muestra; además de corregir las deficiencias de cobertura del marco de muestreo.

La naturaleza de los factores de expansión es intuitiva y se da en el marco del principio de representatividad que gobierna la inferencia de las encuestas de hogares y cualquier otra operación estadística basada en la selección de una muestra. De esta forma, el factor de expansión de una unidad muestral representa el número de veces que se representa a sí misma y a otras unidades similares a ella misma. En general, bajo condiciones de regularidad, el factor de expansión será siempre positivo y mayor que la unidad. Además, la suma de los factores de expansión sobre la base de datos deberá ser aproximarse al tamaño de la población sobre la cual se desea realizar la inferencia. 

Por ejemplo, un hogar en una encuesta con un factor de expansión de 500 se representa a sí mismo y a otros 499 hogares más. La definición teórica del factor de expansión, inducida por el inverso multiplicativo de la probabilidad de inclusión de un hogar en la muestra, hace que la inferencia sea insesgada y confiable. Sin embargo, debido a que la probabilidad de inclusión es un número real contenido en el intervalo $(0, 1]$, entonces su inverso multiplicativo también será un número real mayor o igual que uno. Asimismo, si en el país hay alrededor de cuatro millones de hogares, se espera que la suma de los factores de expansión sobre la muestra de hogares esté alrededor de esta cifra. 

Los procesos de inferencia estadística establecidos en cualquier encuesta de hogares descansan sobre el principio de representatividad que afirma que es posible seleccionar una muestra y representar con bastante precisión y exactitud la realidad de la población de interés. A su vez, las propiedades estadísticas de la inferencia en encuestas de hogares descansan sobre las probabilidades de inclusión generadas por el diseño de muestreo que se implementó en la encuesta. En general el peso de muestreo $d_k$ asociado a un individuo $k$ en la muestra $s$ es función de la probabilidad de inclusión del individuo, así:

$$
d_k = \frac{1}{Pr(k\in s)}
$$

Como se mencionó anteriormente, para conservar la estabilidad en los pesos de muestreo, es posible definir diseños de muestreo auto-ponderados, en donde las unidades finales de muestreo tengan las misma probabilidad de inclusión, sin importar el tamaño de la unidad primaria de muestreo que la contiene. Este tipo de diseños es útil porque induce mayor control sobre las estimaciones finales. Además, @Valliant_Dever_2017 afirman que los pesos de muestreo se utilizan con el fin de incorporar las probabilidades de selección de las unidades en la muestra, ajustar en casos en los que no se pueda determinar si algunas unidades en la muestra son miembros de la población de interés, minimizar el sesgo causado por la ausencia de respuesta cuando algunas unidades no responden habiendo sido incluidas en la muestra, incorporar información auxiliar externa para reducir los errores muestrales de las estimaciones y compensar cuando la muestra no cubre correctamente a la población de interés. 

Es de notar que la conformación de los pesos de muestreo se transforma en un reto metodológico para el investigador, puesto que debe ajustarse a la realidad de la región en donde las poblaciones de los municipios se expanden cada vez más en el sector urbano y los marcos de muestreo de las áreas geográficas se desactualizan con rapidez. Varias soluciones a este problema han sido planteadas [@Gambino_Silva_2009] y todas ellas requieren de esfuerzos económicos, logísticos y técnicos. Por ende, los equipos de los INE (a todo nivel) deben ser flexibles y adecuarse a esta realidad cambiante de la movilidad de las poblaciones, sobre todo en las áreas urbanas. 

En condiciones ideales el marco de muestreo debería coincidir plenamente con la población finita. Sin embargo, en general, no es posible contar con una lista de todos los elementos de la población y, en el contexto de las encuestas a hogares, no existe una lista que enumere todos los hogares de un país de manera actualizada, por lo que la práctica estándar es construir el marco de muestreo en varias etapas, seleccionando una muestra de áreas geográficas, realizando un empadronamiento exhaustivo de todos los hogares en las áreas seleccionadas y luego seleccionando hogares. Este esquema de muestreo hace que el marco de muestreo de las encuestas a hogares presente imperfecciones. 

Para hacerle frente a las imperfeccciones del marco, @Valliant_Dever_2017 recomienda el uso de los códigos de disposición estandarizados por la *American Association for Public Opinion Research* (AAPOR) recomienda tratar la ausencia de respuesta de manera diferenciada y clasificar a cada unidad en la muestra en algunas de las siguientes categorías:

1. ER (*unidades elegibles que fueron respondientes efectivos*): casos elegibles para los cuales se ha recolectado una cantidad suficiente de información.
2. ENR (*unidades eligibles no respondientes*): casos elegibles para los cuales no se recolectó ningún dato o la información fue parcialmente recolectada. 
3. IN (*unidades no elegibles*): casos de miembros no elegibles que no hacen parte de la población de interés. 
4. UNK (*unidades con elegibilidad desconocida*): casos en donde no se puede conocer si la unidad es elegible o no.

Para construir los factores de expansión de una encuesta se recomienda seguir en este orden los siguientes procesos:

1. Creación de los pesos básicos.
1. Ajuste por elegibilidad desconocida.
1. Descarte de las unidades no elegibles.
1. Ajuste por ausencia de respuesta.
1. Calibración por proyecciones poblacionales y variables auxiliares.
1. Recorte y redondeo de los factores finales (*opcional*). 

## Creación de los pesos básicos

Este primer paso ya ha sido explicado de forma detallada en el capítulo dedicado a la selección de la muestra. Observe que, asociado a cada esquema particular de muestreo, existe una única función que vincula a cada elemento con una probabilidad de inclusión en la muestra. De esta forma:

$$\pi_k = Pr (k \in s)$$

Por lo tanto, el primer paso en la reponderación de los pesos de muestreo, es justamente la creación de los pesos básicos $d_{1k}$ que se definen como el inverso multiplicativo de la probabilidad de inclusión

$$d_{1k} = \frac{1}{\pi_k}  \ \ \ \ \ \ \ \ \forall \ k\in s$$

Estos pesos son creados incluso para aquellas unidades que serán excluidas de la muestra porque son no elegibles o porque no proveyeron ninguna información y luego serán modificados convenientemente. La siguiente figura muestra la distribución típica de los pesos originales en una encuesta de hogares. Se recomienda calcular las probabilidades de inclusión (si el muestreo es sin reemplazo) o selección (si el muestreo es con reeemplazo) a medida que avance el muestreo en sus etapas y, de esta forma, siempre confirmar la consistencia de los pesos en cada etapa y de los pesos finales. 

A través de las modificaciones posteriores sobre este peso de muestreo, la distribución de los ponderadores irá sufriendo algunos cambios. Si la distribución original de los pesos básicos difiere estructuralmente con la distribución final de los ponderadores, resultante de todos los ajustes debidos a las imperfecciones del marco, entonces las propiedades estadísticas de insesgamiento, consistencia y precisión podrían desvanecerse. Lo anterior implica que el nivel de desactualización del marco de muestreo tiene implicaciones directas en la calidad de la inferencia. Por tanto, si el marco de muestreo es muy imperfecto, los ponderadores finales no inducirán una inferencia precisa. 


## Ajuste por elegibilidad desconocida

El segundo paso consiste en redistribuir el peso de las unidades cuyo estado de elegibilidad es desconocido. Por ejemplo, si la encuesta está enfocada en la población mayor de 15 años y hay personas que no proveen ninguna información acerca de su edad, entonces es necesario distribuir estos pesos. Esta situación también se puede presentar a nivel de hogar cuando no puede ser contactado porque nadie nunca atendió el llamado del encuestador (*nadie en casa*). Se acostumbra a redistribuir los pesos de las unidades con elegibilidad desconocida (UNK) entre las unidades que sí disponen de su estatus de elegibilidad (ER, ENR, IN). 

Por consiguiente, si no es posible determinar la elegibilidad de algunas unidades que aparecen en el marco de muestreo, se tendrá una muestra $s$ que contendrá el subconjunto de las unidades *elegibles respondientes* $(s_{ER})$, el subconjunto de las unidades *elegibles no respondientes* $(s_{ENR})$, el subconjunto de las unidades *no elegibles* $(s_{IN})$ y el subconjunto de las unidades con *elegibilidad desconocidad* $(s_{UKN})$. En este último caso, la elegibilidad de estas unidades se mantiene desconocida, a no ser que de manera arbitraria sean clasificadas como ENR (elegibles no respondientes), o se tenga información auxiliar en el marco de muestreo que permita imputar su estado de elegibilidad. 

Se recomienda formar $B$ $(b = 1,  \ldots, B)$ categorías^[@Valliant_Dever_2017 recomienda formar categorías con al menos 50 casos.] basadas en la información del marco de muestreo. Estas categorías pueden ser estratos o cruces de subpoblaciones. Siendo $s_b$ la muestra de unidades en la categoría $b$ (que incluye a ER, ENR, IN y UNK), se define el factor de ajuste por elegibilidad como:

$$
a_b = \frac{\sum_{s_b}d_{1k}}{\sum_{s_b \cap (s_{ER} \cup s_{ENR} \cup s_{IN})}d_{1k}}
$$
Para la categoría $b$, los pesos ajustados por elegibilidad desconocida para aquellas unidades cuya elegibilidad sí pudo ser establecida (independientemente de su estado de respuesta) estarán dados por la siguiente expresión:

$$
d_{2k} = a_b * d_{1k}  \ \ \ \ \ \ \ \ \forall \ k\in s_b \cap (s_{ER} \cup s_{ENR} \cup s_{IN})
$$


## Descarte de las unidades no elegibles

En esta etapa, tanto las viviendas con elegibilidad desconocida (UNK) como las viviendas que han cambiado su estado de ocupación y ahora no contienen ningún hogar particular (IN) se retirarán de la población objetivo. Por ende, la base de datos sobre la cual se prosigue el proceso ahora presentará una reducción en el número de unidades. Este tercer paso consiste en ajustar el peso de la etapa anterior de la siguiente manera:

$$
d_{3k} = 
\begin{cases}
0, \ \ \ \ \ \text{si la unidad $k \in (s_{UNK} \cup s_{IN})$ }\\
d_{2k},\ \ \ \text{si la unidad $k \in (s_{ER} \cup s_{ENR})$.}
\end{cases}
$$

## Ajuste por ausencia de respuesta

En este paso los pesos de los respondientes efectivos (ER) se ajustan para tener en cuenta a los que no respondieron (ENR). Al final del proceso, los pesos de los ER se incrementan para compensar el hecho de que algunas unidades elegibles no proveyeron información. Para el manejo efectivo de la ausencia de respuesta se consideran las siguientes variables aleatorias:

$$
I_k=
\begin{cases}
1,  &\text{si $k \in (s_{ER} \cup s_{ENR})$}\\
0,  &\text{en otro caso.}
\end{cases}
$$


$$
D_k=
\begin{cases}
1,  &\text{si $k \in s_{ER}$}\\
0,  &\text{si $k \in s_{ENR}$.}
\end{cases}
$$

Al suponer que la distribución de las respuestas puede ser estimada, entonces la probabilidad de respuesta (*propensity score*) está dada por

$$
Pr[ k\in s_{ER}|k\in (s_{ER} \cup s_{ENR})]=Pr[D_k = 1|I_k = 1]=\phi_k
$$

Si el patrón de ausencia de respuesta es completamente aleatorio (en donde la no respuesta no sigue ningún patrón específico) o aleatorio (en donde el patrón de la no respuesta puede ser explicado por un conjunto de covariables $\mathbf{z}$), entonces 

$$
\phi_k = f(\mathbf{z}_k, \boldsymbol{\beta})   \ \ \ \ \ \ \ \ \forall \ k \in (s_{ER} \cup s_{ENR})
$$

De esta forma, si fuese plausible tener acceso a las covariables $\mathbf{z}$ para los individuos elegibles en la muestra, entonces se podría estimar el patrón de ausencia de respuesta mediante la siguiente relación funcional:

$$
\hat{\phi}_k = f(\mathbf{z}_k, \hat{\boldsymbol{\beta}})   \ \ \ \ \ \ \ \ \forall \ k \in (s_{ER} \cup s_{ENR})
$$

Por otro lado, si el patrón de ausencia de respuesta es no aleatorio (en donde la misma estructura de la ausencia de respuesta es explicada por la variable de interés; por ejemplo cuando en una encuesta de mercado laboral son los desempleados quienes no responden), entonces 

$$
\phi_k = f(\mathbf{y}_k, \beta)   \ \ \ \ \ \ \ \ \forall \ k \in (s_{ER} \cup s_{ENR})
$$ 

En este caso, como no es posible tener acceso a la variables de interés para todos los individuos en la muestra de unidades elegibles (precisamente porque no todos respondieron), entonces no es posible estimar el patrón de ausencia de respuesta y por ende habrán problemas de sesgo. Por otra parte, @Kim_Riddles_2012 muestran que es posible utilizar un modelo basado de estimación de las probabilidades de respuesta (*propensity score*). De esta forma, teniendo en cuenta que la probabilidad de que un individuo conteste es $\phi_k = Pr(k \in s_{ER})$, al suponer que existe acceso al vector de información auxiliar $\mathbf{z}_k$ conocido para todo $k\in (s_{ER} \cup s_{ENR})$ es posible estimarla, por ejemplo, por medio de un modelo de regresión logística; esto es, 

$$
\hat{\phi}_k = \frac{\exp\{\mathbf{z}_k'\hat{\boldsymbol{\beta}}\}}{1 + \exp\{\mathbf{z}_k'\hat{\boldsymbol{\beta}}\}}   \ \ \ \ \ \ \ \ \forall \ k \in (s_{ER} \cup s_{ENR})
$$

donde $\hat{\mathbf{\beta}}$ es el vector de coeficientes estimado de la regresión logística. Por tanto, si la ausencia de respuesta no depende de la variable de interés, es posible definir el siguiente estimador insesgado

$$
\hat{t}_y=\sum_{k\in s_{ER}}d_{4k}y_k
$$

En donde

$$
d_{4k} = \frac{d_{3k}}{\hat{\phi_k}}  \ \ \ \ \ \ \ \ \forall \ k  \in s_{ER}
$$

Es posible aumentar la eficiencia del estimador si se crean categorías homogéneas de individuos que tengan la misma probabilidad de responder. En este caso, los valores de las covariables pueden ser usados para crear estas categorías. Por consiguiente, siempre es necesario obtener un conjunto de covariables que esté disponible para respondientes y no respondientes a la vez. 

Por ejemplo, considere un escenario simplificado en donde es posible identificar que la probabilidad de responder está relacionada únicamente con las variables edad (5 categorías) y sexo (2 categorías). En este caso, sería posible formar $Q=10$ $(q = 1, \ldots, Q)$ categorías de acuerdo al cruce de estas variables para obtener una estimación de la probabilidad de respuesta en cada clasificación y ajustar el peso de muestreo. De esta manera, siendo $s_{q}$ la muestra seleccionada en la categoría $q$, la probabilidad de respuesta en esta categoría se estimaría como:

$$
\phi_{q} = \frac{\sum_{s_{ER}\cap s_q}d_{3k}}{\sum_{s_{q}}d_{3k}}
$$

El nuevo peso ajustado por la ausencia de respuesta estará dado por:

$$
d_{4k} = \frac{d_{3k}}{\phi_{q}} 
= d_{3k}\frac{\sum_{s_q}d_{3k}}{\sum_{s_{ER}\cap s_q}d_{3k}}
$$

En un escenario más complejo, si las probabilidades de respuesta fueron estimadas con un modelo de *propensity score* y, teniendo en cuenta que las predicciones de estas probabilidades varían entre cero y uno, es posible crear clases de individuos (respondientes y no respondientes) con probabilidades similares. En este caso, se asumiría que las unidades dentro de una misma clase tendrán la misma configuración  de covariables, o al menos, una probabilidad de respuesta estimada similar $\hat\phi_k$. Así, dentro de cada clase, las unidades serían tratadas como si hubiesen sido aleatorizadas al tratamiento (responder) o al control (no responder).

Por lo tanto, el objetivo de este proceso es asegurar que cualquier diferencia en las covariables pueda ser ajustada. Teniendo en cuenta que, si el modelo es adecuado, la estimación $\hat\phi_k$ resumiría los efectos de las covariables en la respuesta del individuo, entonces una vez hayan sido creadas las clases es posible realizar el ajuste mediante alguna medida de localización en cada clase y, de esta forma, todos los individuos de una misma clase se ajustarían de la misma manera. Asumiendo que se pueden crear $C$ clases y que $s_c$ es la muestra de $n_c$ unidades elegibles en la clase $c$ $(c=1, 2, \ldots, C)$, entonces es posible utilizar alguna de las siguiente medidas [@Valliant_Dever_2017]: 

1. Promedio no ponderado:
$$\hat{\phi}_c = \frac{\sum_{k \in s_c}\hat{\phi}_k}{n_c}$$
1. Promedio ponderado:
$$\hat{\phi}_c = \frac{\sum_{k \in s_c}d_{3k}\hat{\phi}_k}{n_c}$$
1. Mediana no ponderada:
$$\hat{\phi}_c = mediana[\hat{\phi}_k]  \ \ \ \ \ \ \ \ \forall \ k  \in s_c$$

1. Tasa de repuesta no ponderada:
$$\hat{\phi}_c = \frac{\#(s_{ER}\cap s_c)}{n_c}$$
1. Tasa estimada de repuesta:
$$\hat{\phi}_c = \frac{\sum_{s_c \cap s_{ER}}d_{3k}}{\sum_{s_c}d_{3k}}$$


Nótese que, si todas las unidades dentro de una clase tienen la misma probabilidad de responder, entonces la tasa de repuesta no ponderada es la mejor opción. Además, si dentro de las clases las unidades tienen una probabilidad de responder muy disímil, entonces el promedio no ponderado (o ponderado) del PS puede usarse. De la misma manera, la tasa estimada de repuesta puede ser ineficiente si los pesos de muestreo varían demasiado, pero la probabilidad de respuesta es similar en cada clase. Por último, la mediana se considera si la distribución de la probabilidad de respuesta es sesgada. 


## Calibración de los factores de expansión

Después de conformar el sistema de ponderación de pesos de muestreo en la encuesta, es posible calibrar estos pesos con la información auxiliar disponible para cada país, a nivel nacional, por estratos de interés, e incluso por variable continuas sobre las que se tenga interés. @Sarndal_Lundstrom_2006 afirman que cuando los estudios por muestreo están afectados por la ausencia de respuesta, es deseable que la estructura inferencial que sustenta la encuesta induzca estimadores con sesgo pequeño o nulo y con errores estándares pequeños. A su vez, durante décadas los INE han optado por preferir los sistemas de pesos que sean capaces de reproducir la información auxiliar disponible^[Por ejemplo, el número de hogares o habitantes en el país.] y que sean eficiente al momento de estimar cualquier característica de interés en un estudio multipropósito.

De ahora en adelante, y con el fin de simplificar la notación estadística, se denotará indistintamente a la muestra de elegibles respondientes como $s$. Como se vio en los capítulos anteriores, debido a la construcción teórica de los estimadores de calibración, los pesos calibrados responden a la siguiente restricción

$$
\sum_{k\in s}w_k\mathbf{x}_k = \mathbf{t_X}
$$

El ejemplo más básico se tiene cuando se desea que los pesos de muestreo reproduzcan con exactitud el tamaño de las regiones $N_h$ de un país, y/o el tamaño del país $N$. Es así como, utilizar la metodología de calibración [@Deville_Sarndal_1992] hace que se cumpla la siguiente ecuación de calibración sobre los nuevos pesos calibrados $w_k$ para todos lo estratos explícitos

$$
\sum_{s_h} w_k = N_h
$$

@Gutierrez_2016 menciona que esta coherencia entre las cifras oficiales y las que la encuesta puede producir hace que sea preferible el uso de los estimadores de calibración. Las anteriores características son satisfechas al usar el enfoque de calibración que induce una estructura inferencial robusta en presencia de información disponible puesto que reduce tanto el error de muestreo como el error debido a la ausencia de respuesta. Una vez que se ha ejecutado el proceso de calibración, se crean nuevos pesos que, en general, pueden ser escritos como 

$$
w_k = g_k * d_{4k}  \ \ \ \ \ \ \ \ \forall \ k \in s
$$

En donde los valores $g_k$ son dependientes de la muestra seleccionada $s$ y de la función de optimización escogida para realizar el proceso de calibración. En general no tienen una forma cerrada, aunque dependiendo de la estructura en la información auxiliar pueden tomar valores particulares. Por ejemplo, bajo la distancia Ji-cuadrado, el estimador de calibración tomará la siguiente forma dada por:

$$
\hat{t}_{y, cal} 
= \sum_{k\in s} w_k y_k 
= \hat{t}_{y, \pi} + ( \mathbf{t_x} - \hat{\mathbf{t}}_{\mathbf{x}, \pi}) \hat{\mathbf{B}_s}
$$

En donde $\hat{\mathbf{B}}_s$ es un vector de coeficiente de regresión dependiente de la muestra $s$ y de constantes $q_k$ cuya forma funcional se presenta a continuación. 

$$
\hat{\mathbf{B}}_s = \left(\sum_s w_k q_k \mathbf{x}_k\mathbf{x}_k'\right)^{-1}\sum_s w_k q_k \mathbf{x}_k y_k
$$

En este caso particular, los ponderadores $g_k$ se pueden escribir como sigue:

$$
g_k = 1 + ( \mathbf{t_x} - \hat{\mathbf{t}}_{\mathbf{x}, \pi}) \left(\sum_s w_k q_k \mathbf{x}_k\mathbf{x}_k'\right)^{-1}\sum_s w_k q_k \mathbf{x}_k
$$


Nótese que los estimadores de calibración son *aproximadamente insesgados*, pero la magnitud del sesgo está dada por la siguiente expresión:

$$
Bias(\hat{t}_{y, cal}) = E\left[ \sum_{k \in s} (w_k - d_k) y_k \right]
$$

Si los nuevos pesos calibrados son cercanos a los pesos originales en todas las posibles muestras, entonces el sesgo será insignificante. Ahora, si el tamaño de muestra es insuficiente no conviene utilizar este tipo de estimadores. Además, se sugiere que el coeficiente de variación del estimador de Horvitz-Thompson para las covariables (inducidas por todos los cruces y celdas considerados) sea menor del 10% para asegurar que el sesgo de los estimadores de calibración sea despreciable.

Por otro lado, cuando se tienen múltiples variables discretas es posible que el cruce de categorías contenga muy pocas unidades para las cuales se deben ajustar los pesos originales. Esto puede inducir sesgo en algunos subgrupos. Si aún así se decide optar por mantener estas múltiples restricciones de calibración, será necesario hacer un chequeo empírico del ajuste que cada modelo pueda tener con todas las variables de la encuesta.

### Medidas de calidad en la calibración   

@Silva_2004 presenta algunas consideraciones al respecto del sesgo que puede generarse al usar esta metodología en las encuestas de hogares y aborda algunos criterios para evaluar la calidad de la calibración. Estas medidas se pueden considerar como protección en contra del sesgo generado por tener demasiadas restricciones. Además, se resalta la importancia de que las variables utilizadas para la calibración sean estimadas de manera precisa por los estimadores clásicos de muestreo. Por ejemplo, si el número de personas en una región es utilizada como una variable de calibración (utilizando como total auxiliar las proyecciones demográficas), entonces el coeficiente de variación del estimador de Horvitz-Thompson sobre esta variable debería ser menor, por ejemplo, al 10%. 

La teoría afirma que entre más variables de calibración se tengan menor será la varianza asociada a las estimaciones (no así el sesgo). Sin embargo, existen problemas computacionales cuando las restricciones que se deben satisfacer son demasiadas. Una primera opción es verificar que no se tengan variables que puedan tener codependencia lineal con otras. Al descartar estas variables es posible conservar una varianza pequeña puesto que se descartan combinaciones lineales de otras variables. Se recomienda hacer un análisis de cuántas variables se deben utilizar en la calibración para optimizar el error cuadrático medio de los estimadores finales en las encuestas de hogares. 

En una primera instancia, no sería adecuado utilizar demasiadas restricciones de calibración para satisfacer las proyecciones demográficas de muchas variables. Es fácil equivocarse en esta definición. Por ejemplo, si la encuesta es representativa a nivel de departamento (10 niveles), sexo (2 niveles) y edad (4 niveles), entonces podría ser contraproducente utilizar $10 \times 2 \times 4 = 80$ restricciones de calibración y se debería empezar por analizar una estrategia más parsimoniosa con $10 + 2 + 4 = 16$ restricciones de calibración. Nótese que a medida que las desagregaciones sean más profundas, el nivel de error en las proyecciones poblacionales será más grande. Ademas, entre más restricciones haya, más sesgo y varianza se introduce a la estimación. La idea general del proceso es encontrar un número de restricciones parsimonioso que permita tener estimaciones aproximadamente insesgadas con una varianza menor a la generada con los factores de expansión originales.

Por otro lado, si los pesos de calibración resultan ser menores que uno su interpretación puede tornarse difícil (aunque no reviste un problema teórico). El usuario común entiende al factor de expansión como un factor de representatividad: *es la cantidad de veces que una persona se representa a sí misma y a algunas otras más en la población*. Por ende, los pesos negativos o menores que uno no resisten esta interpretación intuitiva y natural. Además, los pesos negativos pueden conllevar a estimaciones negativas para algunos dominios en donde el tamaño de muestra es pequeño, lo cual resulta ser problemático en un contexto en donde todas las variables de estudio son no negativas. 

Para garantizar que los pesos se ubiquen en un intervalo determinado, se debe minimizar una distancia que a su vez debe inducir pesos restringidos a este intervalo y que respete las ecuaciones de calibración. Es posible que no se tenga una solución exacta para todas las restricciones de calibración e incluso que el algoritmo de calibración no converja. 

Con base en lo anterior, es necesario analizar los pesos $g_k$ en perspectiva en cada dominio, estrato y postestrato de interés. Una buena idea puede ser identificar aquellos $g_k$ que resulten potencialmente grandes o influyentes. Se recomienda postestratificar la muestra, y aplicar la calibración a aquellas unidades en los que los $g_k$ sean estables y usar los pesos originales en el restante conjunto. 

Es posible lograr que los pesos de calibración estén restringidos a un espacio predefinido por el usuario, mediante límites $(L, U)$ sobre los $g_k$. De esta forma, si $w_k \geq 1$ implica $g_k \geq 1$ y por tanto $L=1$. Se acostumbra a tomar $U > Q_3 + 1.5 * (Q_3 - Q_1)$ en donde $Q_3$ y $Q_1$ están dados en términos de la distribución de $g_k$ y corresponden al tercer y primer cuartil, respectivamente.

Si el mecanismo que genera la ausencia de respuesta no es aleatorio (MAR, *missing at random*) o completamente aleatorio (MCAR, *missing completely at random*), es posible que los ponderadores de calibración induzcan sesgo en las estimaciones finales. En general, cuando hay ausencia de respuesta es más probable que aparezcan pesos de calibración negativos y que los pesos de calibración no convergieran a los pesos originales. Además, la varianza de los estimadores de calibración no convergerá a los resultados usuales de los estimadores de regresión. 

Asumiendo que existen $P$ variables de información auxiliar en las ecuaciones de calibración, @Silva_2004 presenta algunas medidas que permiten decidir cuáles escenarios de calibración son los mejores. Asumiendo que $\hat{t}_{x_p, cal}$ es el estimador de calibración para la $p$-ésima variable de información auxiliar cuyo total poblacional es $t_{x_p}$, se define el *error relativo promedio* sobre las variables auxiliares
$$
M1= \frac{1}{P} \sum_{p=1}^P \frac{|\hat{t}_{x_p, cal} - t_{x_p}|}{t_{x_p}}
$$

Se esperaría que $M1$ fuese nulo, si es que la distancia utilizada en la optimización de la calibración es la Ji-cuadrado. Sin embargo, como esta distancia puede arrojar valores negativos para los pesos de muestre, entonces es preferible utilizar otro tipo de distancias que pueden no converger a los totales auxiliares exactamente. En este caso, es preferible escoger aquella distancia que menores valores arroje sobre $M1$, sujeto a que los pesos tenga una interpretación adecuada. 

Por otro lado, siendo $\hat{t}_{x, \pi}$ el estimador HT de la $p$-ésima variable de información auxiliar, se define el *coeficiente de variación relativo promedio* de la siguiente manera
$$
M2= \frac{1}{P} \sum_{p=1}^P \frac{\sqrt{Var(\hat{t}_{x,\pi})}}{t_x} 
$$

Esta medida tiene como intención que el investigador utilice variables de información auxiliar que estén bien representadas en la encuesta. De la misma manera, se define la *proporción de ponderadores extremos* menores a un límite inferior $(L)$ predefinido , o mayores a un límite superior definido $(U)$ predefinido. Estas medidas están respectivamente dadas por

$$
M3 = \frac{1}{n} \sum_{k \in s}I(g_k<L)
$$
$$
M4= \frac{1}{n} \sum_{k \in s}I(g_k>U)
$$

Como los pesos de calibración están definidos como la multiplicación de los pesos ajustados $d_{k}$ con un ponderador $g_k$, no sería deseable que hubiese ponderadores extremos, muy alejados de la unidad; puesto que sería indicio de que existe un alejamiento severo entre los pesos inducidos por el diseño y los nuevos pesos de calibración. Teniendo en cuenta que el insesgamiento está garantizado al utilizar los pesos $d_k$, entonces una proporción de valores $g_k$ muy alejados sería una señal de alarma y podría indicar sesgo. 

Siendo $\sigma(g)$ la desviación estandar muestral de los ponderadores $g_k$ y $\bar{g}$ su promedio muestral, otra medida de interés es el *coeficiente de variación de los ponderadores*, la cual está supeditada a la siguiente expresión

$$
M5= \frac{\sigma(g)}{\bar{g}}
$$
Una dispersión muy alta de los ponderadores sería indeseable, puesto que indicaría que hay valores influyentes que alejarían a los pesos calibrados de los pesos muestrales. Asimismo, se define la *distancia Ji-cuadrado* entre los pesos de calibración y los pesos originales, dada por:

$$
M6 = \frac{1}{n}\sum_{k \in s} \frac{(w_k - d_k)^2}{d_k}
= \frac{1}{n}\sum_{k \in s} d_k(g_k - 1)^2
$$

Si la calibración fue exitosa, esta medida debe ser pequeña, indicando una cercanía de los pesos calibrados a los pesos originales, que señalaría que el insesgamiento se mantiene. Por otro lado, la *eficiencia* de los estimadores de calibración puede ser calculada con base en la siguiente expresión

$$
M7 = \frac{1}{P}\sum_{p=1}^P \frac{Var(\hat{t}_{x_p, cal})}{Var(\hat{t}_{x_p, \pi})} 
$$

Nótese que esta medida es similar al efecto de diseño generalizado, utilizado para evaluar la eficiencia de los escenarios de estratificación. Siguiendo el mismo raciocinio, se quiere que esta medida sea pequeña y siempre menor a uno, indicando que la inferencia estadística al utilizar los pesos calibrados es mayor, que con el estimador HT. Por último, como se indicó en los capítulos anteriores, el *efecto de diseño* debido a la ponderación desigual $DEFF^w$ se define como
$$
M8 = 1+cv^2(w_k)
$$

En este caso, es deseable que esta medida sea muy cercana a uno, indicando que la dispersión de los pesos finales está controlada. 


### Calibración integrada para hogares y personas   

Una de las preguntas recurrentes en la calibración de encuestas de hogares es el nivel al cual se debería realizar este ajuste. En principio, es posible realizar la calibración al nivel de las personas, o al nivel de los hogares. Cada una de estas opciones trae algunas ventajas y consideraciones que se deben tener en cuenta. 

* Calibrar al nivel de los hogares implica que el hogar tendrá unos nuevos pesos que cumplen con las restricciones de calibración, y esos pesos los heredará a las personas que habitan el hogar. De esta forma todas las personas pertenecientes a un mismo hogar tendrán el mismo peso de muestreo, sin importar sus diferencias en composición demográfica. Por ejemplo, hombres, mujeres, menores y mayores de 15 años tendrán el mismo peso de muestreo. Esta propiedad es atractiva puesto que emula el diseño de muestreo que se definió en la fase de planeación. Sin embargo, realizar la calibración a nivel de los hogares hace que dentro de las unidades primarias de muestreo (UPM) los hogares no tengan un peso homogéneo, lo que se distancia de las propiedades del diseño sistemático simple que se usa para la selección de los hogares dentro de las UPM.

* Por otro lado, calibrar a nivel de personas implica que los pesos de muestreo de los hogares también pueden verse alterados, y que los pesos finales de muestreo de las personas sean diferentes dentro de los hogares. De esta forma, de acuerdo a las características de las personas se tendrá un peso diferente. Por ejemplo, es posible que hombres, mujeres, menores y mayores de 15 años **no** tengan el mismo peso de muestreo. Por consiguiente cuando se calibra por personas y se utiliza un filtro sobre esa base de personas para crear una base de hogares, las características observadas de los jefes de hogares influenciarían los pesos de muestreo resultantes.  

Dado que la calibración puede inducir factores de expansión diferentes para los miembros de un mismo hogar, es necesario analizar a qué nivel se realiza este procedimiento (persona, hogar). En principio, y debido al diseño de la encuesta, los pesos de muestreo originales son idénticos para todos los miembros de un mismo hogar. Sin embargo, cuando la post-estratificación trata de ajustar los totales de las restricciones de calibración, y debido a que la población no está equitativamente distribuida, entonces de igual manera se presenta un reajuste en los factores de calibración. Podría ser conveniente revisar la metodología de *raking* y su impacto en los pesos de calibración dentro de los hogares.

Por ejemplo, si la calibración se realiza a nivel de personas y se calibra sobre la población en edad de trabajar, esto traerá como consecuencia que los factores de expansión sean diferentes para los miembros de un mismo hogar, puesto que la metodología buscará ajustar los totales de las personas en edad de trabajar y las personas que no están en la fuerza de trabajo de manera independiente. Por esta razón en la mayoría de hogares, en donde hay personas que son parte de la fuerza de trabajo y personas que no lo son, los pesos de muestreo no serán equivalentes. 

En general, la mayoría de encuestas de hogares en la región tienen una naturaleza multipropósito, generando estimaciones de indicadores a nivel de persona (tasa de participación, tasa de desocupación, etc.), y al mismo tiempo, indicadores a nivel de hogar (pobreza monetaria, necesidades básicas insatisfechas y pobreza multidimensional). En este documento se enfatiza la recomendación de disponer de factores de expansión coherentes entre las diferentes unidades de análisis. 

Por ejemplo, una práctica común que pone en tela de juicio las propiedades estadísticas del estimador, es generar factores de expansión a nivel de persona y endilgarle el factor de expansión del jefe de hogar al mismo hogar [@Alexander_1987]. Esta es una escogencia arbitraria si es que los factores de expansión se han generado mediante una calibración que tenga en cuenta las características de las personas, como por ejemplo edad o sexo. Este acercamiento deliberado no permite sopesar las propiedades estadísticas del estimador resultante y por ende sus resultados no pueden ser interpretados confiablemente, mucho menos comparados. 

Una escogencia más parsimoniosa puede ser optar por un enfoque tipo *integrated household weighting*. Nótese que, como lo expone @Heldal_1992, al realizar una calibración a nivel de personas, ya no será posible agregar a las personas de un mismo hogar para obtener un único peso del hogar, pues las características de las personas del hogar serán, en general, diferentes y sus respectivos factores de expansión también lo serán. Por tanto, definiendo a $w_{k|i}$ como el factor de expansión de la persona $k$ que pertenece al hogar $i$, y a $w_{II,i}$ como el factor de expansión del hogar $i$, es necesario que el sistema de pesos satisfaga la siguiente restricción:

$$
w_{k|i}=w_{II,i}\ \text{para toda persona $k$ en el hogar $i$}.
$$

De esta forma, sería posible obtener pesos consistentes con las restricciones de calibración a nivel de persona y que, al mismo tiempo, permitiera la integración con los hogares al cambiar de unidad de observación. En la literatura se han descrito varios métodos para lograr esta estandarización. A continuación se profundiza en algunos de ellos. 

#### Enfoque de Estevao & Sarndal 

En principio, se debe notar que es posible realizar el proceso de calibración de factores de expansión sobre la base de datos de las personas o sobre la base de datos de los hogares. De estos dos escenarios calibrar sobre la base de personas parecería ser la opción más rápida puesto que, en la mayoría de los casos, las cifras que se utilizan para calibrar están al nivel de los individuos. Por ejemplo, pensando en una encuesta de fuerza laboral, es evidente que las variables más importantes de la encuesta se encuentran al nivel de las personas y que la calibración de los factores de expansión se debería realizar desde la base de datos de personas. 

Ahora, suponga una situación en la cual se desea calibrar por sexo. En este caso, se debería tener acceso a las proyecciones demográficas por sexo para el periodo de referencia de la encuesta y se procedería a calibrar los factores de expansión, utilizando un enfoque de post-estratificación. En este escenario, las ecuaciones de calibración estarían dadas por la siguiente expresión:

$$
\left ( \sum_{k \in s} w_k x_{1k}, \sum_{k \in s} w_k x_{2i} \right )=(t_{x1}, t_{x2})
$$

En donde la suma se hace sobre las personas en la muestra $s$; además, $x_{k1}$ toma el valor de uno, si el individuo $k$ es mujer, y cero en otro caso. Por supuesto, $x_{k2} = 1 - x_{k1}$, $t_{x1}$ es la proyección demográfica del total de mujeres y $t_{x2}$ es la proyección demográfica del total de hombres. En este caso, las covariables de la calibración son variables dicotómicas. Nótese que las ecuaciones de calibración están al nivel de la muestra $s$ que induce una base de datos de personas. Como el muestreo ha sido en varias etapas, una posibilidad que surge al momento de calibrar los factores de expansión es utilizar la muestra de hogares $s_{II}$ que induce una base de datos con información de los hogares y calibrar usando un enfoque de calibración general con covariables continuas. De esta forma las ecuaciones de calibración estarían dadas por la siguiente expresión:

$$
\left ( \sum_{i \in s_{II}} w_{II,i} z_{1i}, \sum_{i \in s_{II}} w_{II,i} z_{2i}\right )=(t_{z1}, t_{z2})
$$

En donde la suma ahora se realiza al nivel de la muestra de hogares $s_{II}$. Nótese que $z_{1i}=\sum_{k \in s_i} x_{k1}$ se refiere al número de hombres en el hogar $i$; $z_{2i}=\sum_{k \in s_i} x_{k2}$ es el número de mujeres en el hogar $i$; y los totales de calibración $t_{z1} = t_{x1}$ y $t_{z2} = t_{x2}$ siguen siendo el número de hombres y mujeres en la población, respectivamente, por lo que coinciden plenamente. 

Al respecto, nótese que calibrar con el primer escenario reproduce los totales auxiliares sobre la base de personas, mientras que calibrar sobre el segundo escenario reproduce los totales sobre la base de hogares. Sin embargo, teniendo en cuenta los principios del muestreo en varias etapas y notando que en un hogar, la probabilidad de inclusión de las personas es de uno (inclusión forzosa), entonces generar factores de expansión para las personas en el segundo escenario es muy sencillo puesto que:

$$
w_{k|i}= \frac{w_{II,i}}{Pr(k \in U_i | i \in sI)} = \frac{w_{II,i}}{1} = w_{II,i}
$$

Es decir que, bajo este escenario de calibración, todas las personas dentro del hogar comparten los mismos pesos de muestreo y además estos pesos son iguales al peso del hogar. @Estevao_Sarndal_2006[sec. 5] recrean la calibración conjunta para hogares y personas. En resumen, luego de que se ha calibrado la base de hogares, se construyen los pesos a nivel de persona recurriendo a la siguiente expresión:

$$
w_k = d_{k|i}w_{II,i} \quad \forall k \in s_i
$$

Como todos los individuos pertenecientes a un hogar son seleccionados para que respondan la encuesta de hogares, se tiene que $d_{k|i} = 1$, por definición. Por lo tanto, el peso del individuo (en la base de datos de la muestra de personas) será idéntico al peso calibrado del hogar; es decir $w_k = w_{II,i} \quad \forall k \in S_i$. Además, dado que el muestreo es de conglomerados en la última etapa y todos los individuos del hogar son seleccionados, entonces el peso de muestreo del hogar será el promedio de los pesos individuales.

#### Enfoque de Lemaitre & Dufour 

Un segundo enfoque, condensado en @Lemaitre_Dufour_1987, afirma que se deben crear nuevas variables de calibración a nivel de persona, definidas como el promedio de las variables originales en el hogar. Por ende, se definen las siguientes cantidades:

$$
z_{ik}=\sum_{i \in s_{II}} x_{ik}\ \ y\ \ \ {\bar{z}}_{ik}=\frac{z_{ik}}{N_i}
$$

En donde $z_{ik}$ es la agregación a nivel de hogar de las covariables originales de calibración a nivel de persona y $N_i$ es el tamaño del $i$-ésimo hogar. Al ejecutar el algoritmo de calibración utilizando las variables $z$, en vez de las variables $x$, se reproducen las ecuaciones de calibración a satisfacción y, dado que todos los individuos comparten las mismas covariables en la calibración, sus pesos serán idénticos para todos aquellos compartiendo un mismo hogar. Nótese que esta calibración se realiza con la base de datos a nivel de personas.

En la literatura estadística se ha estudiado este enfoque integrado. Es así como @Neethling_Galpin_2006 concluyeron que, para ambos enfoques, las estimaciones resultantes redujeron el sesgo, aumentaron la precisión y proporcionaron un único conjunto de ponderaciones para los datos de las encuestas estudiadas. Además, si se opta por el segundo enfoque, en el cual el tamaño de la base de datos sería igual al número de personas entrevistadas, se tendría el suficiente margen para actualizar las restricciones de calibración con el fin de ejercer un mayor control sobre los tamaños de los subgrupos de interés. 


### Calibración sobre razones, medias y proporciones   

@Gutierrez_Zhang_Rodriguez_2016 afirman que, además de utilizar ponderadores calibrados a tamaños o totales, también es posible imponer restricciones de calibración sobre razones, que a su vez son una generalización de medias y proporciones. Por ejemplo, considere $Q$ subgrupos de interés (dominios, estratos o post-estratos). Si las razones para dichos subgrupos fuesen conocidas, podemos encontrar pesos $w_k$ que satisfagan la siguiente restricción:

$$
\hat{\textbf{R}}_{cal} = (\hat{R}_{1,cal},...,\hat{R}_{Q,cal})'= (R_1,...,R_Q)'= \textbf{R}
$$

donde $\hat{R}_{q,cal} = \frac{\sum_{k \in s}w_ky_{qk}}{\sum_{k \in s}w_kx_{qk}}$. De esta forma, es posible imponer la siguiente restricción en las ecuaciones de calibración

$$
\hat{\textbf{R}}_{cal} = \textbf{R}_U.
$$

Es decir, para $q = 1,..., Q$, se define la siguiente variable de información auxiliar

\begin{equation*}
z_{qk} = 
\begin{cases} 
y_{qk} - R_qx_{qk} \ \ \ &\text{si} \ k \in s_q \\ 
0 &\text{en otro caso}
\end{cases}
\end{equation*}

En donde 
$$
t_{z_q} = \sum_{k \in U}z_{qk} = \sum_{k \in U}y_{qk} - R_qx_{qk} = 0
$$

Como caso particular, si las medias de los subgrupos son conocidas, la restricción queda como
$$
\bar{\textbf{y}}_{cal} = (\bar{y}_{1,cal},...,\bar{y}_{Q,cal})' = (\bar{y}_{1},...,\bar{y}_{Q})' = \bar{\textbf{y}}
$$

Así, la restricción para las ecuaciones de calibración, $\bar{\textbf{y}}_{cal} = \bar{\textbf{y}}$, para cada $q = 1,...,Q$, se define a partir de la siguiente variable de calibración:

\begin{equation*}
z_{qk} = 
\begin{cases} 
y_{qk} - \bar{y}_{q} \ \ \ &\text{si} \ k \in s_q \\ 
0 &\text{en otro caso}
\end{cases}
\end{equation*}


### Calibración con valores perdidos y totales estimados 

Existen algunas condiciones que deben mantenerse al momento de utilizar los estimadores de calibración en las encuestas de hogares. Una de estas condiciones es que la información de las covariables de calibración esté completa en la base de datos de la encuestas. Por ejemplo, asuma que un país está interesado en evaluar la posibilidad de actualizar las covariables de calibración en su encuesta continua de fuerza de trabajo. En efecto, con el advenimiento de nuevos flujos de migración internacional en la región, es posible considerar que la nacionalidad del respondiente esté directamente relacionada con su condición de actividad. Por lo tanto, incluir esta variable en el sistema de calibración podría ser atractivo para reducir los sesgos generados por la ausencia de respuesta (o problemas de cobertura del marco de muestreo) de los extranjeros en la encuesta. 
 
Al momento de actualizar el sistema de calibración es necesario tener en cuenta que las nuevas covariables deben tener información completa en la base de datos de la encuesta. Siguiendo con el ejemplo planteado, si la nacionalidad de los respondientes tiene observaciones incompletas, entonces habrían serias dificultades para considerarla en el nuevo sistema. En particular, habría que sopesar las siguientes consideraciones:

- Los estimadores de calibración no están basados en modelos estadísticos. A pesar de que estos estimadores se conocen como *asistidos por modelos* (porque se basan en información auxiliar externa a la encuesta), siguen adheridos al marco inferencial *basado en el diseño de muestreo*, donde se supone que los valores observados a nivel de unidad para las variables de la encuesta son valores verdaderos, no aleatorios y fijos. 

- Desde un punto de vista matemático, la calibración es un problema de optimización con restricciones sobre los totales auxiliares disponibles, que estaría erróneamente definido si faltaran valores de las covariables de calibración para algunas unidades.

- Los INE suelen utilizar como covariables de calibración *variables estructurales*, es decir variables cuyos valores muestrales se observan con alta calidad (es decir, no hay valores perdidos y son fiables), o pueden reconstruirse de forma confiable y precisa a partir de fuentes externas (por ejemplo, registros estadísticos, archivos censales, encuestas pasadas). 
 
Uno de los objetivos de actualizar el sistema de calibración (incluyendo la varaible nacionalidad en nuestro ejemplo) es, no solo tener consistencia con las cifras de migración oficiales, sino también usarla para tratar la ausencia de respuesta de unidad. En este caso, se calibra la muestra efectiva; es decir, el subconjunto donde las variables auxiliares se observan completamente. Si suponemos que la información de la covariable no está completa en las bases de datos de la encuesta, el investigador tendría dos opciones posibles: 
 
1.	Descartar la nacionalidad como variable auxiliar en la calibración. 
2.	Imputar o rellenar los valores faltantes de la variable nacionalidad antes de la calibración.
 
Nótese que la imputación asumirá implícita o explícitamente algún tipo de modelo, lo que hará que los estimadores de calibración finales ya no estén completamente *basados en el diseño de muestreo*, y se pierda todo el andamiaje inferencial en la encuesta, incluyendo su comparabilidad en el tiempo. Además, no se lograría una protección definitiva contra el sesgo inducido por la ausencia de respuesta de unidad después de la calibración. Es más, si el modelo de imputación no queda correctamente especificado, el error podría ser aún más grande. 

Sin embargo, si las unidades de la muestra pudieran vincularse sin error a un registro estadístico completo, actualizado y de alta calidad en el que se dispone de la nacionalidad, entonces se podría rellenar los valores perdidos en la base de datos para esta covariable y la inferencia seguiría siendo robusta y fiel al paradigma básico de las encuestas de hogares.
 
En resumen, la recomendación al respecto es que se realicen todos los esfuerzos en la consecución de las covariables de calibración para los respondientes en la etapa de recolección de información primaria. Si esto no fuese posible, apoyarse en registros estadísticos para conseguir la nacionalidad del respondiente, sería una solución igualmente plausible. De la misma forma debiesen evitarse la adopción de modelos de imputación en las covariables de calibración. 

Por otro lado, la calibración con totales de control estimados es cada vez más utilizada. si bien es cierto que el procedimiento de calibración exige que los totales de control sean conocidos de antemano, también es cierto que los censos no tienen la posibilidad de realizarse más frecuentemente. Por ende, las estructuras poblacionales y demográficas observadas en los censos pueden desactualizarse rápidamente. Una vez más considérese el caso de la nacionalidad. Ante una explosión migratoria en un país en el periodo intercensal, las proyecciones censales para la variable nacionalidad podrían quedar obsoletas rápidamente y sería necesario utilizar estimaciones de otras operaciones estadísticas para poder calibrar con totales estimados de control actualizados. 

Un ejemplo de la situación anterior se da en los Estados Unidos con la *American Community Survey*, encuesta que provee estimaciones actualizadas y oportunas con información anual detallada acerca del ingreso, educación, empleo, cobertura en salud, costos del hogar y condiciones para los residentes del país. Esta encuesta complementa los datos poblacionales recolectados por el censo, que se realiza cada diez años. 

Por lo tanto, es posible que una encuesta mediana o pequeña, cuya muestra se denota como $s_A$ se apoye en totales de control estimados por una encuesta más grande, cuya muestra se denota con $s_B$. Este caso se conoce con el nombre de *calibración con totales de control estimados* [@Dever2008] y los estimadores derivados con esta técnica serán denotados con un asterisco. En este caso, los estimadores de calibración buscarían nuevos ponderadores $w_k^*$ que satisfcieran la siguiente restricción:


$$
\sum_{k\in s_A}w_k^*\mathbf{x}_k =  \sum_{j\in s_B}w_j\mathbf{x}_j = \hat{\mathbf{t}}_{\mathbf{x}, cal}
$$

Por tanto, el estimador de un total con las observaciones de la muestra pequeña tendría la siguiente forma funcional:

$$
\hat{t}_{y, cal}^* 
= \sum_{k\in s_A} w_k^* y_k 
= \hat{t}_{y, \pi} + ( \hat{\mathbf{t}}_{\mathbf{x}, cal} - \hat{\mathbf{t}}_{\mathbf{x}, \pi}) \hat{\mathbf{B}_{s_A}}
$$
En donde 

$$
\hat{\mathbf{B}}_{s_A} = \left(\sum_{s_A} w_k q_k \mathbf{x}_k\mathbf{x}_k'\right)^{-1}\sum_{s_A} w_k q_k \mathbf{x}_k y_k
$$

Sin embargo, @Dever_Valliant_2016 muestran que, al utilizar la metodología de calibración con totales de control estimados, existe sesgo para los estimadores de razón, definidos así:

$$
\hat{R}^*_{y, cal} = \frac{\hat{t}_{y, cal}^*}{\hat{t}_{z, cal}^*}
$$

En donde $\hat{t}_{y, cal}^*$ y $\hat{t}_{z, cal}^*$ denotan dos estimadores de calibración con totales de control estimados. Nótese que esta es la misma forma que tomaría cualquier promedio estimado 

$$
\bar y ^{*}_{cal} = \frac{\hat{t}_{y, cal}^{*}}{\hat{N}^{*}_{cal}}
$$

En este caso, el denominador de $\hat{R}^{*}_{cal}$ sería $\hat{t}_{z,cal}^{*} = \hat N^{*}_{cal}$. @Dever_Valliant_2016 presentan la siguiente expresión para el sesgo de un promedio $\bar y ^{*}_{cal}$:

$$
Bias(\bar y ^{*}_{cal})
\approx
\frac{1}{E(\hat N^{*}_{cal})} 
\left[ Bias(\hat{t}_{y,cal}^{*}) - \bar{y} \ Bias(\hat{N}^{*}_{cal})\right]
$$

Con $Bias(\hat{t}_{cal}^{*})$ y $Bias(\hat{N}^{*}_{cal})$, los sesgos de los estimadores de calibración con totales de control estimados del total poblacional $(t_y)$ y del tamaño poblacional $(N)$, respectivamente. El sesgo de estos estimadores puede llegar a ser despreciable si el mecanismo que genera la ausencia de respuesta es aleatorio o completamente aleatorio (ver capítulo 12), y si se incluye una columna de unos en la matriz de las variables de calibración, lo cual mostraría que no hay errores de cobertura. 

Asimismo, la estructura de varianza de estos estimadores es bastante compleja como lo presentan @Dever_Valliant_2016. Sin emabrgo, es posible utilizar métodos de estimación de varianza basados en réplicas como los propuestos por @Opsomer_Erciulescu_2022.



## Recorte y redondeo

### Recorte de pesos extremos 

Un inconveniente que se genera debido a la multitud de ajustes en los factores  de expansión es que, si bien el estimador resultante tendrá un sesgo cercano a cero, la distribución de los pesos puede mostrar datos extremos, sobre todo a la derecha de la distribución (valores muy grandes), que hacen que la varianza del estimador crezca y que, por ende, la precisión de la inferencia decrezca. Para hacerle frente a este problema, es posible considerar un procedimiento de *trimming* o recorte de pesos, siguiendo las recomendaciones de @Valliant_Dever_Kreuter_2018[, sec. 14.4], que puede ser resumido en los siguientes pasos:
	
1. Recortar cualquier peso mayor a un umbral prestablecido en la distribución de pesos ajustados. Por lo general este umbral se fija alrededor de 3.5 veces la mediana de los pesos. Por tanto, 
$$
U=3.5\times mediana(\mathbf{w_{k}})
$$
1. Cualquier peso con magnitud superior a $U$ se trunca de la siguiente manera
$$
w_k^\ast=\left\{\begin{matrix}U,\ \ \ \ \ \ \ si\ w_{k}\geq U\\
w_{k},\ \ \ \ \ \ \ en\ otro\ caso.\\\end{matrix}\right.
$$
1. Determinar la cantidad neta perdida debido al recorte de pesos extremos, siguiendo la siguiente expresión:
$$
K=\sum_{s_r}(w_k^\ast - w_{k})
$$
1. Distribuir $K$ equitativamente entre las unidades que no fueron recortadas.
1. Iterar hasta que todos los nuevos pesos calibrados estén por debajo del umbral $U$.

Al final del proceso se debe asegurar que los datos extremos en los factores de expansión han sido correctamente manejados y que la distribución general de los pesos no sufrió cambios estructurales en los subgrupos poblacionales de interés. 


### El problema del redondeo de los factores de expansión 

Cuando el factor de expansión no es entero, entonces su interpretación se torna compleja desde el punto de vista práctico, aunque teóricamente no tenga ninguna repercusión negativa. Sin embargo, este inconveniente puede hacer que, en la práctica, las oficinas nacionales de estadística y los usuarios de las bases de datos de encuestas de hogares tomen la decisión (bienintencionada pero errada) de redondear estas cantidades al entero más cercano. Esta práctica es perjudicial porque le añade sesgo a la inferencia y causará problemas de sobre o sub estimación en algunos dominios de estudio. @Sartore_Toppin_Young_Spiegelman_2019 plantean que el redondeo de los factores de expansión puede ser problemático puesto que las estimaciones ponderadas pueden crecer o decrecer enormemente. 

Los siguientes ejemplos prácticos muestran de forma directa las repercusiones perjudiciales que conlleva esta práctica y que son consecuencia directa del sesgo de redondeo: 

- En encuestas de establecimientos redondear el factor de expansión en las unidades que tienen flujos de ventas grandes trae problemas de sesgo en este dominio de estudio.

- En encuestas agropecuarias, si una unidad productiva produce un cuarto de la producción nacional, el redondeo de su factor de expansión es nefasto.

- En encuestas de hogares, en donde los diseños de muestreo son generalmente auto-ponderados (en donde todas las viviendas comparten el mismo factor de expansión) dentro de los estratos, redondear el factor de expansión implica sesgar por completo todo el estrato. 

Suponiendo que una muestra probabilística $s=(I_1,\ldots,I_k,\ldots,I_N)'$ fue seleccionada de una población finita $U$ mediante un diseño de muestreo que induce probabilidades de inclusión $\pi_k= E(I_k)$ para todos los individuos $k \in U$ (en donde $I_k$ toma el valor uno si fue seleccionado o cero en otro caso) entonces desde el punto de vista teórico los estimadores de muestreo $\hat t_y = \sum_s d_k \ y_k$ son insesgados cuando el factor de expansión $d_k$ es idéntico al inverso de la probabilidad de inclusión, puesto que

$$
E(\hat t_y)
= E \left( \sum_s \frac{y_k}{\pi_k} \right)
= E \left(\sum_U I_k \frac{y_k}{\pi_k} \right)
= \sum_U E(I_k)  \frac{y_k}{\pi_k}
= \sum_U \pi_k \frac{y_k}{\pi_k} = t_y
$$

De las anteriores relaciones es evidente que, cuando el factor de expansión se redondea de forma determinística, entonces $E(\hat t_y) \neq t_y$. Para evadir el sesgo de redondeo, es necesario emplear un método aleatorio que induzca insesgamiento en los estimadores de muestreo. En general, este problema puede ser abordado desde una perspectiva probabilística. De hecho, si en primera instancia se utiliza como redondeo la parte entera (el entero máximo que sea menor o igual) del factor de expansión, entonces bastará con añadir aleatoriamente una unidad a algunos factores de expansión para asegurar que la suma de los factores redondeados sea idéntica a la original. Con esta simple idea se le devuelve la propiedad del insesgamiento a los estimadores de muestreo.l procedimiento se describe a continuación: 

1. Para $k \in s$, definir 
$$\phi_k = d_k - \lfloor d_k \rfloor$$
2. Seleccionar una submuestra $s_a=(c_1,\ldots,c_k,\ldots,c_n)'$ de $s$ con probabilidades de inclusión $\phi_k$, para $k\in s$. Note que $c_k$ tomará el valor de uno, si el elemneto $k$ está en la submuestra y de cero, si no fue seleccionado en la submuestra.

3. Si $c_k = 0$, entonces $\tilde d_k = \lfloor d_k \rfloor$; en otro caso, si $c_k = 1$, entonces $\tilde d_k = \lfloor d_k \rfloor + 1$.

En primera instancia, nótese que la submuestra $s_a$ no necesariamente será de tamaño fijo, puesto que $\sum_s\phi_k$ no será entera en todos los casos; por ende, es posible utilizar un algoritmo de muestreo Poisson [@Gutierrez_2016, sección 4.1] para seleccionar esta submuestra. Sin embargo, si esta suma es entera, es posible utilizar un algoritmo de muestreo más eficiente que induzca una submuestra de tamaño fijo como por ejemplo el método de Brewer [@Tille2006]. Por otro lado, la esperanza de estos factores redondeados condicionados a la submuestra $s_a$ es igual a los factores de expansión originales, tal y como se muestra a continuación

$$
E(\tilde d_k | s_a) 
= \lfloor d_k \rfloor + E(c_k|s_a) 
= \lfloor d_k \rfloor + \phi_k
= d_k
$$

Por lo anterior, es importante notar que el uso de este método aleatorio de redondeo siempre induce insesgamiento en los estimadores de muestreo, puesto que

$$
E \left( \sum_s \tilde d_k y_k \right) 
= E \left[ E \left( \sum_s \tilde d_k y_k  | s_a\right)  \right] 
= E \left( \sum_s E(\tilde d_k | s_a) y_k \right) 
= E \left( \sum_s d_k y_k \right) = t_y
$$

Por último, cuando los factores de expansión de la encuesta están calibrados se presenta un problema de optimización un poco más complejo, puesto que al utilizar el redondeo aleatorio, los factores de expansión perderán la propiedad de calibración. @Sartore_Toppin_Young_Spiegelman_2019 y @Tille han presentado diferentes soluciones a este problema, siendo la última mucho más fácil de implementar en el software estadístico `R`. Bajo esta perspectiva, la calibración de los factores de expansión crea nuevos pesos denominados $w_k$ que conservan la siguiente propiedad para un conjunto de totales auxiliares $\mathbf{t_x}$ disponibles para toda la población

$$
\sum_s w_k \mathbf{x}_k =  \mathbf{t_x}
$$

El siguiente algoritmo hace uso del muestreo balanceado [@Tille_2006, capítulo 8], el cual representa una forma de calibración desde el diseño de muestreo y es una solución óptima para seleccionar la submuestra $s_a$ y por ende preservar la consistencia de los pesos calibrados con los totales auxiliares.

1. Para $k \in s$, definir $\phi_k = w_k - \lfloor w_k \rfloor$ y 
$$
\tilde{\mathbf{x}}_k = \phi_k \ \mathbf{x}_k
$$

2. Seleccionar una submuestra balanceada $s_a=(c_1,\ldots,c_k,\ldots,c_n)'$ de $s$ con probabilidades de inclusión $\phi_k$, tal que 
$$
\sum_{k \in s_a} \frac{\tilde{\mathbf{x}}_k}{\phi_k} 
\cong
\sum_{k \in s} \tilde{\mathbf{x}}_k
$$

3. Si $c_k = 0$, entonces $\tilde w_k = \lfloor w_k \rfloor$; en otro caso, si $w_k = 1$, entonces $\tilde w_k = \lfloor w_k \rfloor + 1$.

Es importante recalcar que la restricción en la submuestra balanceada implica que los pesos redondeados cumplan la siguiente relación

$$
\sum_s c_k \ \mathbf{x}_k 
\cong \sum_U \mathbf{x}_k 
- \sum_U \lfloor w_k \rfloor \ \mathbf{x}_k 
$$

Lo cual conlleva inmediatamente a que los nuevos pesos, además de estar redondeados, también estén calibrados; es decir
$$
\sum_s \tilde w_k \mathbf{x}_k \cong  \mathbf{t_x}
$$

Nótese que el redondeo aleatorio depende de la selección de la submuestra $s_a$ para completar los restos de la parte entera. En esta selección intervienen diferentes algoritmos de muestreo que se pueden aplicar fácilmente utilizando la librería `sampling` [@Matei]. Por ejemplo, suponga una muestra de tamaño $n= 200$ que fue seleccionada de una población de tamaño $N=9200$ con factores de expansión desiguales que no están calibrados. Asuma que el vector de probabilidades de inclusión en la muestra toman la siguiente forma

$$
\boldsymbol{\pi}_s = (\underbrace{15/500}_{50 \ veces},
\ldots,
\underbrace{15/800}_{80 \ veces}, 
\ldots,
\underbrace{15/700}_{70 \ veces})'
$$

Por lo tanto, el vector de pesos de muestreo estará definido de la siguiente manera:

$$
\mathbf{d}_s = (\underbrace{33.33333}_{50 \ veces},
\ldots,
\underbrace{53.33333}_{80 \ veces}, 
\ldots,
\underbrace{46.66667}_{70 \ veces})'
$$

De la misma manera, el vector de excesos $\phi_k = d_k - \lfloor d_k \rfloor$ estará dado por la siguiente expresión:

$$
\boldsymbol{\phi}_s = (\underbrace{0.33333}_{130 \ veces},
\ldots,
\underbrace{0.66667}_{70 \ veces})'
$$

Luego del cálculo de $\phi_k$, se selecciona la submuestra $s_a$. En particular, en este caso se utiliza el algoritmo de Brewer [@Gutierrez_2016], puesto que $\sum_s\phi_k = 90$ y es entero. Al final del proceso de redondeo aleatorio la suma de los nuevos factores coincidirá con la suma de los factores originales. Por último, si en una segunda instancia, se considera que los pesos están calibrados mediante sendas covariables de calibración, entonces es posible utilizar el método del cubo, para que la submuestra esté balanceada y los pesos redondeados sigan las restricciones de calibración bajo una tolerancia predefinida. 

