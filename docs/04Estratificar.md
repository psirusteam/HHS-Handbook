
# Metodologías de estratificación

Para aumentar la eficiencia de la inferencia en las encuestas de hogares, es de particular interés que el marco de muestreo permita clasificar a las UPM de acuerdo con su nivel socio-económico con el fin de poder realizar selecciones independientes en cada categoría de la clasificación. De esta forma se garantiza la homogeneidad entre grupos y se disminuye la incertidumbre de la estimación. Este proceso se conoce con el nombre de estratificación. 

En la literatura especializada, es posible encontrar varias metodologías que clasifican a cada una de las UPM del marco y a la vez disminuyen la varianza de los estimadores de muestreo. Este capítulo se realiza un resumen no exhaustivo de las principales técnicas utilizadas por los INE de la región, se proponen algoritmos para encontrar la mejor estratificación basada en los datos de los censos y se ilustran los procedimientos computacionales necesarios para implementar esta metodología. Si los estratos están conformados por unidades homogéneas que, a su vez, crean categorías heterogéneas entre sí, entonces se dice que el proceso de estratificación es eficiente y el error de muestreo se verá reducido significativamente.

Luego de definir las UPM en el marco de muestreo es necesario realizar una agrupación de estas de acuerdo con sus características sociodemográficas agregadas con el fin de obtener una partición que conforme grupos homogéneos, que induzcan una mayor precisión en la ejecución de las estrategias de muestreo que se propongan dentro de la planificación de las encuestas de hogares que realizan los INE. Es importante señalar que se debe estudiar una multitud de escenarios de estratificación y para encontrar una óptima clasificación de las unidades primarias de muestreo, puesto que esta partición será utilizada en todas las encuestas de hogares que utilicen este marco de muestreo en el periodo intercensal. 

En síntesis, los procesos que intervienen en la estratificación del marco de muestreo son los siguientes:

1.	Ejecución de múltiples escenarios de estratificación de las UPM utilizando información agregada del censo^[Aunque también es posible añadir información geoespacial, catastral o de cualquier índole si se tiene una cobertura completa a nivel de las UPM.]. 
2.	Para cada método señalado anteriormente realizar particiones de 3, 4, o 5 grupos en las áreas rural y urbana de forma independiente. 
3.	A raíz de las pruebas y los escenarios ejecutados, evaluar su efectividad mediante una única medida de calidad, definida como el DEFF generalizado y escoger el mejor escenario en términos de la metodología y del número de particiones.

Este capítulo presenta las diferentes variables utilizadas en el proceso de estratificación; establece la forma de agregación de las variables a nivel de las UPM para mantener una estructura uniforme que permita sacar un mejor provecho a la discriminación entre sus estructuras y por ende una mejor clasificación en los estratos; resume de forma no exhaustiva algunas de las metodologías usadas para la estratificación de marcos de muestreo (teniendo en consideración dos enfoques: univariados sobre medidas de resumen, y multivariados sobre toda la matriz de estratificación); presenta los criterios de evaluación de los métodos de estratificación y los hallazgos en el caso guatemalteco; y muestra un pequeño resumen de los resultados finales de la estratificación del marco de muestreo y expone algunas consideraciones y recomendaciones en el corto plazo. 

## Dimensiones estructurales en el marco de muestreo

El proceso de definición de un diseño de muestreo para las encuestas nacionales que necesita un país para responder a sus necesidades de información con miras en la elaboración de sus políticas públicas involucra varios procesos que hacen uso de los censos nacionales de población y el uso de una cartografía detallada del territorio nacional. 

Como se indicó en el capítulo anterior, un aspecto fundamental para el diseño y desarrollo de encuestas de hogares involucra la definición de las UPM, definidas como unidades cartográficas que dividen el territorio nacional y permiten llevar a cabo los procesos de levantamiento de información y de trabajo de campo de la manera más idónea posible, y que además se construyen con el fin de facilitar la obtención de estimaciones precisas y confiables de los indicadores y parámetros de interés que requieren los tomadores de decisiones y expertos en políticas públicas.

Dependiendo de la planificación de las diferentes encuestas, las UPM pueden dar lugar a unidades secundarias de muestreo o permitir la selección directa de las unidades de análisis como las viviendas, los hogares y/o las personas. Independientemente de las unidades de muestreo y las jerarquías que se definan para llevar a cabo la implementación del diseño de muestreo para las encuestas, es fundamental llevar a cabo un proceso de estratificación de las UPM en grupos que sean en lo posible lo más homogéneos en cuanto a sus características socioeconómicas y de bienestar y que definan una partición del territorio nacional [@Gutierrez_2016].

Estos grupos se denominan en la literatura estadística como estratos y su unión debe cubrir todo el territorio nacional. Como estos grupos determinan una partición, dos estratos cualesquiera deben ser mutuamente excluyentes. Los INE utilizan las particiones geográficas y cartográficas generadas en el levantamiento del censo con el fin de seleccionar muestras de hogares, mediante la ejecución de diseños de muestreo probabilísticos, estratificados y en varias etapas. En particular, para aumentar la eficiencia de la inferencia en las encuestas de hogares, es de particular interés que el marco de muestreo permita clasificar a las UPM de acuerdo con su estructura socioeconómica, con el fin de poder realizar selecciones independientes en cada categoría de la clasificación. 

De esta forma se garantiza la homogeneidad entre estratos y se disminuye la incertidumbre de la estimación. Este proceso se conoce con el nombre de estratificación y es un proceso fundamental para minimizar los errores de muestreo que se obtienen al ejecutar encuestas probabilísticas. En el caso particular de los países latinoamericanos, este proceso se lleva a cabo haciendo uso de la información censal a nivel de personas, hogares y viviendas, en diferentes constructos o dimensiones asociadas a la calidad de vida y bienestar (demografía, características de la vivienda, tenencia de enseres y servicios públicos entre otros). Las variables que se definan sobre estos constructos son agregadas partiendo de variables binarias que toman el un valor de uno, si el fenómeno en cuestión está asociado de forma positiva a mejores condiciones socioeconómicas. Por ejemplo: 

* El acceso del hogar a una conexión de internet es una variable de interés en la estratificación puesto que discrimina entre los hogares con mejores condiciones de bienestar. En este caso, la variables se define como uno (1) si el hogar dispone del servicio de internet y cero (0) si el hogar no dispone de dicho servicio.
* La materialidad de los pisos, paredes y techos también es una variable importante en la estratificación de las UPM. Mejores materiales se asocian a una mayor capacidad económica y mejores condiciones habitacionales. Esta variables de definirá como uno (1) si la vivienda no tiene materiales precarios y cero (0) en otro caso.

El proceso anterior se realiza basado en referentes internacionales de calidad de vida y en un análisis exploratorio de datos de las diferentes variables candidatas a participar en el proceso de estratificación. En primer lugar, es necesario tomar en consideración que la estratificación que se pretende realizar debe ser llevada a nivel de las UPM. Esto implica que una vez que las UPM estén categorizadas en algún estrato, todos sus componentes también estarán clasificados en la misma categoría; por consiguiente, las personas, los hogares y las viviendas de la UPM pertenecerán al estrato en el cual la UPM fue clasificada^[Cabe resaltar que, tomando en cuenta la información recolectada en el censo, es posible también clasificar a las personas o a los hogares en una primera instancia y después agregarlos hasta llegar al nivel de la UPM; sin embargo, en la práctica este proceso puede resultar un poco más complejo y no son claras sus ventajas.].

Con la información del censo se deben seleccionar y definir las variables que estén relacionadas directamente con los fenómenos que se estudiarán en las diferentes encuestas de hogares a lo largo del periodo intercensal. Una vez construidas las UPM, se calculan los agregados de las variables seleccionadas en las dimensiones observadas desde los censos, que por lo general son las siguientes:

- *Demografía y estructura de la población*: sexo, edad, parentesco, origen extranjero, pertenencia a grupos indígenas, número de hijos, número de dependientes, etc.
- *Educación*: analfabetismo, asistencia escolar, años de estudios, grado de escolaridad, etc.
- *Mercado de trabajo*: población en edad de trabajar, pertenencia a la fuerza de trabajo por sexo, condición de ocupación por sexo, rama de actividad, etc.
- *Características de la vivienda*: tipo de vivienda, materiales de construcción, hacinamiento, equipamiento, etc.
- *Acceso a servicios básicos*: fuente de agua, alcantarillado, acceso a salud, acceso a seguridad social, etc.
- *NBI o pobreza multidimensional*: viviendas con hacinamiento crítico, servicios inadecuados, alta dependencia económica, niños en edad escolar que no asisten a la escuela, aseguramiento en salud, entre otras.

La caracterización de estas dimensiones lleva a clasificar a las UPM en el marco. Por ejemplo, en la dimensión demográfica, es común que las UPM con mayor número de personas que se identifican como indígenas o pertenecientes a alguna etnia se relacionen con menores niveles de calidad de vida. De la misma manera, con los recientes fenómenos migratorios, las UPM que agrupan a extranjeros latinoamericanos están relacionadas con menores condiciones de bienestar. Asimismo, las UPM con una mayor porcentaje de niños en la primera infancia y con madres cabeza de familia generalmente se asocian a dificultades en su calidad de vida.

De la misma manera a nivel de educación, las UPM con mayores tasas de analfabetismo (que por lo general están en las áreas rurales), y con niños que no asisten a la escuela se asocian a menores condiciones de bienestar; mientras que las UPM que tienen un mayor porcentaje de población con estudios de educación superior (que por lo general se encuentran en las áreas urbanas de las ciudades grandes) se asocian con mayores condiciones de bienestar. 

En la dimensión ocupacional, las UPM rurales concentran una alta proporción de población ocupada que no necesariamente muestra mejores condiciones de vida. Por otra parte, las UPM que tienen una mayor incidencia de población desocupada y/o mayor proporción de personas dependientes (personas de 0 a 15 años o mayores de 65 años) pueden relacionarse con peores condiciones de vida.
 
Con respecto a las características de la vivienda, está bien documentado que las UPM con alto porcentaje de viviendas cuyos materiales de construcción de paredes, techos y pisos es precario se asocian con menores condiciones de bienestar y por lo general se presentan con mayor incidencia en las áreas rurales y en las áreas marginales de las zonas urbanas. De la misma manera las UPM que concentran viviendas con hacinamiento (si el número de personas del hogar sobre el número de cuartos es menor a tres) o con acceso inadecuado a las fuentes de agua potable, o con servicios sanitarios y de eliminación de aguas grises deficientes están asociadas a un menor bienestar socioeconómico.

## Información a nivel de UPM

En primer lugar, es necesario tomar en consideración que la estratificación que se pretende realizar es a nivel de las UPM. Esto implica que una vez que la UPM esté categorizada en algún estrato, todos sus componentes también estarán clasificados en la misma categoría; por consiguiente las personas y los hogares de la UPM pertenecerán al estrato en el cual la UPM fue clasificado. Cabe resaltar que,  tomando en consideración la información recolectada en el censo, es posible también clasificar a las personas o a los hogares en una primera instancia y después agregarlos hasta llegar al nivel de la UPM; sin embargo, en la práctica este proceso puede resultar un poco más complejo y no son claras sus ventajas. Por lo anteriormente mencionado, este documento estará enfocado en la clasificación de las UPM a partir de una matriz de información a nivel de esta misma agregación.

Debido a que las UPM tienen, en estricto rigor, tamaños diferentes, la escala y el nivel en el que se midan los indicadores puede afectar los procesos de clasificación. Luego, si la matriz de información con la cual se realiza la estratificación se construye con base en el número de personas (con determinadas características) dentro de la UPM, al no tener en cuenta el tamaño de esta, es muy probable que las metodologías de estratificación no logren agrupar de forma homogénea a las UPM. Por ejemplo, asuma que hay dos UPM con tamaño 100 y 300 hogares, que agrupan a 200 y 400 personas en la fuerza de trabajo, y además suponga que una de las variables de la matriz de información se define como el número de personas ocupadas. A su vez, asuma que la primera UPM pertenece a un sector acaudalado y la segunda UPM pertenece a un sector marginal. Es posible que el número de personas ocupadas en ambas UPM sea de 150 y que por esta razón queden erróneamente clasificadas en el mismo grupo. Por ende, definir la matriz de información en términos relativos (porcentaje de ocurrencia de cada variable) es una mejor alternativa para que el agrupamiento esté controlado por el tamaño de la UPM y supeditado únicamente a cambios estructurales en los constructos de medición del censo.

Por último, una vez que se ha definido el conjunto de variables que entrarán en la matriz de información, es necesario verificar que todos los indicadores de esta matriz apunten hacia el mismo horizonte del constructo censal. Es decir, que **todos** los indicadores estén expresados en términos de acceso al bienestar de cada uno de los constructos. Además, es necesario realizar un proceso de refinamiento sobre esta matriz para eliminar aquellas variables que puedan estar altamente correlacionadas con el resto de las variables o que puedan expresarse como combinación lineal de otras variables. De esta manera, se evitan los problemas de multicolinealidad y se asegura una estratificación parsimoniosa. Al final se debe contar con una matriz de información $\mathbf{X}$ compuesta por $P$ variables, y $n_I$ filas; en donde cada fila de la matriz de información representará la observación de las UPM a novel censal para cada una de las $P$ variables. 

La teoría estadística ha definido que la mejor estratificación es aquella que minimice los errores de muestreo de los estimadores, expresados en forma de varianzas o errores estándar. Además, una particularidad de los procesos de estratificación es que las varianzas de estos estimadores dependen a su vez de la variación de los microdatos a nivel poblacional, que se han observado en el censo. Sin embargo, lo que podría resultar ser una estratificación óptima para una variable tal vez sea, al mismo tiempo, una estratificación pésima para otras variables. Más aun, sabiendo que no todas las variables de interés que se observarán en las encuestas durante el periodo intercensal han sido medidas y observadas en el censo, se debe estudiar muy bien, por medio del estudio de numerosos escenarios, qué estratificación utilizar. 

Hay un entendimiento tácito en todos los países de la región, repaldado en mayor o menor grado por evidencia empírica, de que la mayoría de los fenómenos sociales que se observan en las encuestas de hogares están supeditados a la distribución de la población en las UPM. Por ejemplo, si lo que se quiere medir es la informalidad en el mercado de trabajo, seguramente nos encontraremos con que este fenómeno está mucho más presente en aquellas UPM marginales, en donde también estarán presenten otros fenómenos como menos años de educación, menores tasas de acceso a la salud, menores ingresos y gastos, mayores tasas de embarazo adolescente, entre otros. De esta forma es necesario analizar las relaciones e incidencias de cada variable incluida. Por ejemplo:

* Analizar si la proporción de techos y paredes adecuadas se encuentra altamente correlacionada con la proporción de pisos adecuados. 
* Tener en cuenta si la proporción de extranjeros es muy poco frecuente y sólo aparecen en algunas UPM muy específicas; en ese caso se recomendaría excluir esta variable dada su falta de discriminación. 
* Analizar si la proporción de hogares con computadora y lavadora se correlacionan muy bien con la tenencia de internet y refrigerador, por lo cual estas variables no se considerarían en la matriz de estratificación. 
* Evaluar si la tenencia de estufa y radio presentan indicadores muy altos a lo largo de las UPM y no incorporan capacidad de discriminación en el proceso de estratificación.

Este análisis exhausitvo de las características poblacionales indica que existe una alta correlación entre la UPM que se habita y la incidencia de fenómenos sociales y económicos. Por lo tanto, los ejercicios de estratificación que se deben estudiar tendrán una alta consistencia interna, de tal manera que al escoger la mejor estratificación se garantiza que los INE dispondrán de una clasificación óptima en el periodo intercensal para todas las encuestas de hogares que se ejecuten.

En general, hay dos grandes escenarios que deben ser revisados al momento de proponer una estratificación: univariados (sobre una medida de resumen de la matriz de información) y multivariados (sobre todas las variables de la matriz de información). Para cualquiera de estas, se recalca que el objetivo es encontrar la mejor partición que asegure que la varianza de los estimadores de muestreo sea mínima. A continuación, se presentan algunas técnicas que se pueden considerar y que además están disponibles en el software estadístico `R` mediante las librerías `stratification` [@Baillargeon_Rivest_2011] y `SamplingStrata` [@Barcaroli_2014]. En ambos casos existe documentación disponible acerca de cómo utilizar las funciones de estratificación.

## Metodologías univariadas sobre medidas de resumen

Es bien sabido que la mejor estratificación para una variable de interés es aquella que nace de su propia variación. Durante muchos años, se desarrollaron técnicas de estratificación sobre una sola variable de interés que dejaban de lado el carácter multipropósito de cualquier encuesta de hogares. Por esta razón, se sugiere partir de la matriz de información y resumir la variación y las correlaciones entre variables mediante alguna técnica multivariada de reducción de datos, como componentes principales, análisis factorial, o modelos no lineales. Como la matriz de información está en escala de porcentajes, es posible que la variabilidad recogida por la medida de resumen sea alta. 

Por ejemplo, si se utiliza la técnica de componentes principales, entonces se tomaría como medida de resumen el primer componente, que resulta ser función del vector propio asociado al mayor valor propio de la matriz de covarianzas asociada a la matriz de información. Por otro lado, si se utilizara un análisis factorial confirmatorio, la medida de resumen podría ser el eje principal con la carga factorial más alta. La interpretación de estas medidas de resumen es una parte importante en la aplicación de las técnicas de estratificación. Nótese que la matriz de información está construida por cinco constructos censales (*demografía y estructura de la población*, *educación*, *mercado de trabajo*, *características de la vivienda* y *acceso a servicios básicos*) que deberían ser resumidos en una medida de bienestar de la UPM, que a su vez debe tener sentido en cuanto a la relación (o contribución) de las variables al componente o factor. En adelante, se utilizará la siguiente notación para referirse a la medida de resumen como función de todas las variables incorporadas en la matriz de información:

$$
y = f(x_1,\ldots, x_P)
$$

Nótese que se esperaría que esta variable de resumen, al estar definida como una medida de bienestar sobre las UPM, tuviera un comportamiento sesgado, tal como se puede observar en la siguiente figura.

<div class="figure">
<img src="04Estratificar_files/figure-html/unnamed-chunk-1-1.svg" alt="*Histograma de la medida de resumen (y) sobre las UPM*" width="672" />
<p class="caption">(\#fig:unnamed-chunk-1)*Histograma de la medida de resumen (y) sobre las UPM*</p>
</div>

Por ende, si esta característica es altamente sesgada, es recomendable crear un estrato de inclusión forzosa con estas unidades. Esta práctica asegura que el error de muestreo para este estrato sea nulo.

### Partición en cuantiles (Q) {-}

Este método divide la población de UPM en grupos creados a partir de la división en intervalos regulares de la distribución de la medida de resumen. Los cuantiles más usados son los cuartiles (que dividen la población en cuatro grupos), los quintiles (que dividen la población en cinco grupos) y  los deciles (que dividen la población en 10 grupos); sin embargo, con los propósitos de estratificación, también es útil considerar la partición en terciles (que dividen la población en tres grupos).

### Método de raíz de frecuencia acumulada (DH) {-}

@Dalenius_Hodges_1959 propusieron esta técnica de estratificación basada en la acumulación de la raíz cuadrada de las frecuencias acumuladas de la medida de resumen sobre las UPM. Esta técnica es exacta y no requiere de algún procedimiento iterativo. La idea principal de esta técnica es encontrar grupos que minimicen la siguiente función:

$$
D = \sum_{h=1}^H W_h \sqrt{S^2_{y_{h}}}
$$

En donde $W_h = N_h/N$ ($h = 1, \ldots, H$) es el tamaño relativo del estrato $h$ y $S^2_{y_{h}}$ es la varianza de la medida de resumen en el estrato $h$. 

### Estratificación óptima (LH) {-}

@Lavallee_Hidiroglou_1988 propusieron por primera vez la construcción de una estratificación óptima para poblaciones de encuestas reales, basada en la minimización de una expresión ligada al tamaño de muestra. Más adelante @Kozak_2004 definió un algoritmo iterativo mediante arranques aleatorios para optimizar el proceso de minimización. 

### Estratificación geométrica (GH) {-}

@Gunning_Horgan_2004 desarrollaron este método con el objetivo de que los coeficientes de variación de la medida de resumen tiendan a ser iguales dentro de los estratos y, de esta forma, encontraron que los límites que definían estos grupos estaban conformados en progresión geométrica. 

## Metodologías multivariadas sobre la matriz de información

Partiendo de la matriz de información $\mathbf{X}$ a nivel de las UPM, es posible considerar algunos procedimientos que no necesitan de la reducción a una sola dimensión, sino que admiten tantas dimensiones como indicadores definidos en las columnas de la matriz $\mathbf{X}$. Teniendo en cuenta que en el periodo intercensal se realizarán encuestas que miden variables que están fuertemente ligadas a las observadas en el censo, entonces encontrar una estratificación que sea óptima para todo el conjunto de variables de la matriz de información asegurará una partición óptima para todas las encuestas realizadas en el periodo intercensal. Las siguientes metodologías permiten minimizar conjuntamente la varianza de los $P$ estimadores de muestreo en un diseño estratificado.

### K-medias de Jarque (KmJ) {-}

@Jarque_1981 propone utilizar una versión modificada del algoritmo de K-medias [@Macqueen_1967], cuya objetivo es la minimización de la siguiente función de distancia:

$$
\sum_{h=1}^H \sum_{k\in U_h}(\mathbf x_k - \bar {\mathbf x}_h)'\boldsymbol \Lambda^{-1}(\mathbf x_k - \bar {\mathbf x}_h)
$$

En donde $\mathbf x_j$ corresponde a la medición de las $P$ variables de la matriz de información en la $k$-ésima UPM, $\bar {\mathbf x}_h$ es el vector de medias de la matriz de información en el estrato $h$ y $\boldsymbol \Lambda$ es una matriz diagonal de tamaño $P \times P$ cuyas entradas se definen como la varianza de las $P$ variables de la matriz $\mathbf X$, es decir $\boldsymbol \Lambda [p,p]=S^2_{x_p}$. Esta modificación tiene como objetivo minimizar la relación entre la varianza de un estimador de muestreo estratificado con asignación proporcional y la de un muestreo aleatorio simple. Como se puede ver en el anexo, cuando $\boldsymbol \Lambda = \mathbf I$, el algoritmo resultante es idéntico al algoritmo clásico de K-medias.

### Partición genética (BB) {-}

@Ballin_Barcaroli_2013 argumentan que la mejor estratificación es aquella partición del marco de muestreo que asegura el mínimo costo muestral que satisfaga algunas restricciones de precisión; o, que maximice la precisión de los indicadores de interés bajo las restricciones. Haciendo uso de algoritmos genéticos evolutivos, esta la estratificación multivariada del marco de muestreo parte de la consideración de estratificaciones univariadas independientes (una para cada variable de la matriz de información) y de la definición del producto cartesiano resultante de todas estas particiones (estratos atómicos). Este universo de posibles estratificaciones evoluciona, sujeto a las restricciones de precisión sobre cada variable de la matriz de información, hasta converger en el número de estratos definidos de antemano $H$.

## Evaluación y escogencia de la mejor estratificación

En la evaluación de los escenarios de estratificación entran las técnicas univariadas y multivariadas. Al final, el resultado de aplicar una u otra técnica es simplemente una clasificación de las UPM. Por lo tanto, cada una de las posibles estratificaciones debe ser evaluada con base en la reducción de la varianza para todos los indicadores considerados en la matriz de clasificación. La medida clásica con la que se juzgan las bondades de una estrategia de muestreo es el efecto de diseño (DEFF). Por lo tanto, la evaluación de la estratificación debe estar supeditada también a esta medida, que para la variable $p = 1, \ldots, P$, está dada por:

$$
DEFF_p = \frac{Var_{ST}(\bar x _p)}{Var_{SI}(\bar x _p)} \ \ \ \ \ \ \ \ \ p = 1, \ldots, P.
$$

En donde, $Var_{ST}(\bar x _p)$ y $Var_{SI}(\bar x _p)$ denotan la varianza del diseño estratificado y la varianza de un muestreo aleatorio simple para la media poblacional (porcentaje) de la $p$-ésima variable de la matriz de información. Por otro lado, @Gutierrez_2016[página 184] demuestra que, cuando la asignación es proporcional, esta relación se puede escribir de la siguiente manera:

$$
DEFF_p = \frac{ \sum_{h=1}^H W_h S^2_{x_{hp}} }{S^2_{x_p}} \ \ \ \ \ \ \ \ \ p = 1, \ldots, P.
$$

En donde, para cada estrato $h = 1, \ldots, H$, se tiene que $S^2_{x_p}$ es la varianza de la variable $x_p$ en la población y $S^2_{x_{hp}}$ es la varianza de la variable $x_p$ supeditada al estrato $h$. Nótese que una ventaja de expresar el efecto de diseño como en la ecuación anterior es que no dependerá del tamaño de muestra. Una vez definido el criterio de evaluación de la estratificación sobre una variable $x_p$, es necesario definir un criterio de estratificación multivariante que contemple cada una de las $P$ variables. Siguiendo las ideas de @Jarque_1981, se propone la siguiente medida de calidad, definida como el *efecto de diseño generalizado* ($G(S)$) sobre todas las variables de la matriz de información:

$$
G(S) = \sum_{p=1}^P DEFF_p = \sum_{p=1}^P \frac{1}{S^2_{x_p}}\sum_{h=1}^H W_h S^2_{x_{hp}}
$$

Ante una estratificación pertinente, se esperaría que $Var_{ST}(\bar x _p) < Var_{SI}(\bar x _p)$, por lo tanto $0 < DEFF_p < 1$, lo que conlleva a que $0 < F(S) < P$. Luego, se debería escoger el escenario para el cual $F(S)$ fuera mínimo. Nótese que, para cada uno de los escenarios en estudio, es necesario fijar el número de estratos; en general se propende porque el número de grupos esté entre tres y cinco. Esta escogencia del número de grupos debe ser discutida al interior del INE con los equipos que determinan la rotación de las UPM en cada periodo de levantamiento de las encuestas de hogares. Escoger un número alto de estratos reducirá la varianza, pero a su vez puede tener repercusiones negativas en la logística de rotación del diseño de muestreo de las encuestas, haciendo que se agoten rápidamente las UPM dentro de los estratos geográficos y socioeconómicos. Por lo anterior, se recomienda restringir los escenarios de evaluación a la consideración de $H=3$ y $H=4$ estratos.

El siguiente cuadro ejemplifica la evaluación de estas técnicas para dos escenarios de estratificación (tres y cuatro estratos) en una matriz de información que contiene 8 variables. De la tabla se puede deducir varias conclusiones interesantes. Por ejemplo, para el primer indicador, la mejor estratificación es DH con cuatro estratos; para el segundo indicador, la mejor estratificación es BB con cuatro estratos; mientras que para el último indicador, la mejor estratificación es LH con cuatro estratos. Como se puede notar, para cada indicador existirá un método que induzca una mayor eficiencia, pero que para otros indicadores puede ser deficiente. Esto claramente muestra que la estratificación con respecto a un solo indicador puede ser un procedimiento inadecuado. Por lo tanto, basados en este ejemplo, el mejor método sería DH con cuatro estratos puesto que induce una mayor eficiencia conjunta al reducir el efecto de diseño generalizado.

\footnotesize  
  |  DEFF | Q (H=3) | DH (H=3) | LH (H=3) | GH (H=3) | KmJ (H=3) | BB (H=3) | Q (H=4) | DH (H=4) | LH (H=4) | GH (H=4) | KmJ (H=4) | BB (H=4) |
|---------:|--------:|----------:|---------:|---------:|----------:|---------:|--------:|----------:|---------:|---------:|----------:|---------:|
| $\bar x_1$ |    0.87 |      0.85 |     0.81 |     0.82 |         1 |     0.88 |     0.8 |      0.70 |     0.76 |     0.72 |      0.71 |     0.77 |
| $\bar x_2$ |    0.89 |      0.82 |     0.95 |     0.97 |      0.94 |     0.88 |    0.79 |      0.74 |     0.75 |     0.77 |      0.75 |     0.71 |
| $\bar x_3$ |    0.87 |      0.97 |     0.83 |     0.96 |      0.89 |     0.95 |    0.74 |      0.75 |     0.79 |      0.7 |      0.79 |     0.71 |
| $\bar x_4$ |    0.92 |      0.89 |     0.81 |     0.94 |      0.96 |        1 |    0.77 |      0.73 |     0.73 |      0.7 |      0.71 |     0.74 |
| $\bar x_5$ |    0.85 |      0.83 |     0.96 |     0.96 |      0.83 |     0.81 |     0.8 |      0.73 |      0.8 |     0.78 |       0.8 |     0.79 |
| $\bar x_6$ |    0.87 |      0.88 |      0.9 |     0.88 |      0.86 |     0.81 |     0.8 |      0.72 |     0.76 |      0.7 |      0.74 |     0.73 |
| $\bar x_7$ |    0.87 |      0.95 |     0.99 |     0.83 |      0.86 |     0.84 |    0.75 |       0.7 |     0.77 |     0.72 |      0.77 |     0.77 |
| $\bar x_8$ |    0.93 |      0.82 |     0.91 |     0.99 |      0.93 |     0.88 |    0.77 |      0.74 |     0.72 |     0.78 |      0.76 |     0.75 |
|     G(S) |    7.07 |      7.01 |     7.16 |     7.35 |      7.27 |     7.05 |    6.22 |      5.81 |     6.08 |     5.87 |      6.03 |     5.97 |
Table: *Efectos de diseño $DEFF_p$ y efecto de diseño generalizado $G(S)$ considerando tres ($H=3$) y cuatro ($H=4$) estratos para ocho variables.*

\normalsize  

Para tener comparabilidad y consistencia, los algoritmos de estratificación se deberían aplicar sobre cada una de las UPM en las áreas urbanas, pero independientemente de las UPM rurales. La escogencia del número de estratos debe ser discutida al interior de los INE y así determinar si escoger un número alto de estratos reduce la varianza significativamente, o si puede tener repercusiones negativas en la logística de rotación y desgaste de las UPM, haciendo que se agoten rápidamente dentro del cruce de los estratos geográficos y socioeconómicos. Es recomendable restringir los escenarios de evaluación a la consideración de H=3 o H=4 estratos. Este último componente es importante puesto que los diseños de muestreo deberían considerar un tamaño de muestra mínimo de dos UPM por estrato para poder estimar la varianza del estimador [@Gutierrez_2016].

El efecto diseño no es el único aspecto por evaluar para la elección del procedimiento de estratificación. Es necesario verificar la estabilidad del método con respecto a los otros procedimientos de estratificación. Por ejemplo, la siguiente tabla muestra la matriz de coincidencias entre las diferentes clasificaciones de los estratos.

| Técnica   | Jarque | K-means | DAL  | GEO  | LH-S | LH-K | Percentil |
|:-----------:|:--------:|:---------:|:------:|:------:|:------:|:------:|:-----------:|
| **Jarque**    | 1      | 0,64    | 0,92 | 0,84 | 0,89 | 0,89 | 0,82      |
| **K-means**   | 0,64   | 1       | 0,68 | 0,62 | 0,71 | 0,71 | 0,74      |
| **DAL**       | 0,92   | 0,68    | 1    | 0,82 | 0,96 | 0,96 | 0,90      |
| **GEO**       | 0,84   | 0,62    | 0,82 | 1    | 0,78 | 0,78 | 0,73      |
| **LH-S**      | 0,89   | 0,71    | 0,96 | 0,78 | 1    | 1,00 | 0,93      |
| **LH-K**      | 0,89   | 0,71    | 0,96 | 0,78 | 1,00 | 1    | 0,93      |
| **Percentil** | 0,82   | 0,74    | 0,90 | 0,73 | 0,93 | 0,93 | 1         |

Por último, suponiendo que se decidió la creación de tres estratos se encuentran numerado en orden ascendente que indica el nivel de bienestar socioeconómico, también se debe evaluar la coherencia de la distribución de las diferentes variables agregadas a nivel de UPM en los estratos. Por ejemplo, la proporción de personas mayores de 15 años alfabetizadas debería tener mayor incidencia en los estratos más altos, y este patrón también se debería observar para diferentes indicadores como la proporción de hogares con internet, la proporción de tenencia de refrigerador, la proporción de tenencia de televisión por cable, la proporción de tenencia de automovil, la proporción de hogares con saneamiento adecuado, la proporción de hogares con pisos adecuados, la proporción de personas con educación superior, entre otras. La figura \@ref(fig:estrata) muestra el comportamiento esperado en los estratos de muestreo para algunas variables de interés. De esta forma, el estrato uno debería presentar condiciones económicas más adversas, el estrato dos debería tener mejores condiciones, siendo el tercer estrato el que agrupa a las UPM con menores dificultades socioeconómicas. En el área rural debiesen aparecer una menor proporción de UPM en el estrato 3, dadas las condiciones menos favorables. 


<div class="figure">
<img src="Pics/Estratificar.png" alt="Comportamiento esperado en los estratos de muestreo para algunas variables de interés." width="800px" />
<p class="caption">(\#fig:estrata)Comportamiento esperado en los estratos de muestreo para algunas variables de interés.</p>
</div>


Si la contribución de algunas unidades al total poblacional es no significativa, y además esas unidades son de difícil acceso, es común que en algunos países de la región se opte por redefinir el universo y crear un estrato de exclusión forzosa. En este estrato no se realiza ninguna encuesta y las respectivas estimaciones no tendrán en cuenta a esta población excluida. Por último, como algunos procedimientos de clasificación se basan en la generación de números aleatorios, se recomienda documentar los códigos computacionales que se utilizaron para que los resultados puedan ser replicados, por lo que debe fijar una semilla aleatoria al comienzo del código computacional.