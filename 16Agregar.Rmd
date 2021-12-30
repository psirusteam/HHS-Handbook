# (PART) Procesamiento derivado en las encuestas de hogares {-}

# Agregación de encuestas

Para producir indicadores sociales de forma agregada (anual, semestral o
trimestral), es común recurrir a la agregación de las bases de datos
provenientes de las encuestas de hogares, cuya periodicidad puede suele
ser mensual o trimestral. En esta sección se exploran algunas
estrategias de estimación ligadas al tratamiento de los pesos inducidos
por el diseño de muestreo complejo y al tratamiento de las unidades que
se repiten en algún periodo debido al carácter rotativo de la medición.

Uno de los primeros acercamientos al problema de la estimación conjunta
de indicadores sociales utilizando varios periodos de recolección se
presenta en @Gurney_Daly_1965, en donde se examina cómo mejorar el
estimador puntual por medio de la correlación natural que se tiene con
periodos anteriores, siguiendo un enfoque inferencial basado en modelos
estocásticos. En este orden de ideas, @Lent_Miller_Duff_1999 definen una
aproximación a un estimador para las distintas clasificaciones de la
fuerza de trabajo que está basado en la optimización de los coeficientes
de un estimador compuesto. 

Por su parte, @Fuller_1990 provee una
discusión acerca de los sesgos que se pueden generar en el análisis de
encuestas repetidas debido a errores de medición y revisa detalladamente
algunos modelos estimados con mínimos cuadrados. Además, @Bell_2001
examina varios acercamientos al problema de estimar indicadores
sociales, específicamente relacionados con la fuerza de trabajo,
provenientes de encuestas de hogares que tienen definido un esquema de
rotación y traslape entre distintos periodos de tiempo.

Asimismo, @Steel_McLaren_2008 revisaron las principales dificultades al
momento de diseñar y analizar encuestas repetidas. Teniendo en cuenta
los patrones de rotación en la estimación de los indicadores de nivel y
de cambio, examinan su efecto en la estrategia de estimación de las
varianzas de los estimadores de interés. Luego, @Lewis_2017 definieron
algunos procedimientos que se deben seguir al momento de combinar dos o
más conjuntos de datos con el propósito de implementar eficientemente
pruebas de significación estadística sobre indicadores de cambio en el
tiempo, además de incrementar el tamaño de muestra para realizar
inferencias de subgrupos poblacionales que están insuficientemente
representados en una sola medición.

## Esquemas de acumulación de muestras

Antes de entrar en los detalles técnicos involucrados en este tipo de
procedimientos, tomemos una situación ejemplificante específica para
ilustrar la problemática que se quiere abordad. Para esto, suponga que
un INE en América Latina ha previsto una
nueva forma de análisis de su encuesta de empleo. Con el fin de tener
representatividad a un nivel más desagregado (provincial, por ejemplo),
y para poder realizar una estimación más precisa, ha decidido realizar
una agregación anual de todos los levantamientos de su encuesta de
empleo. Por ejemplo, suponga que en los meses de marzo, junio,
septiembre y diciembre se planean levantamientos trimestrales y que este
esquema considera una representatividad nacional, en el área urbana y
rural, aunque no lo hacía con la representatividad provincial, ni de las
ciudades principales del país. Con la metodología de agregación de
muestras podría ser posible asegurar la representatividad en las
provincias desagregadas por área (urbano o rural).

Los procesos de acumulación de muestras son realizados con frecuencia en
las encuestas continuas con publicación trimestral. Por ejemplo, se
puede planear levantamientos mensuales y acumular tres meses para
realizar la publicación trimestral de la cifra de desempleo. De hecho,
algunos países han decidido publicar cifras mensuales del desempleo
teniendo en cuenta la acumulación de los últimos tres levantamientos, lo
que es conocido cono trimestres móviles. Teniendo en cuenta el diseño
rotativo que muchas encuestas implementan en América Latina, una de las
bondades de estos esquemas de agregación de muestras en los trimestres
móviles es que el panel original se mantiene y además, por diseño, la
misma vivienda no es entrevistada dos veces en el trimestre móvil. En
este tipo de diseños, inclusive es posible que, al final de cada año en
diciembre, se contemple la publicación de un gran agregado anual que
contemple la agregación de los doce meses anteriores. En este escenario
sí existen viviendas que han sido entrevistadas dos o más veces y este
porcentaje, dependiendo del diseño rotativo, puede no ser bajo. Por
ejemplo, en un panel 2(2)2, el diseño rotativo induce un traslape
natural del 50% entre trimestres.

@Korn_Graubard_1999 [capítulos 7 y 8] proveen un recuento exhaustivo
sobre las opciones de ponderación y otros temas a considerar cuando se
combinan datos a lo largo del tiempo en encuestas complejas. En el caso
de la agregación de muestras se resalta que todas las viviendas que han
sido entrevistadas en más de una ocasión deben pertenecer a la misma UPM
por diseño. Es muy importante que la identificación de las UPM y de los
estratos de muestreo se realice de manera inequívoca y se debe
asegurar que los siguientes principios se cumplan a cabalidad:

1.  Cuando se combinan dos o más oleadas del mismo panel es importante
    asegurarse que las UPM sean emparejadas correctamente, de tal forma
    que el software las reconozca como iguales.
2.  Cuando se combinan dos o más muestras independientes es importante
    asegurarse que las UPM estén codificada de tal forma que el software
    las reconozca como distintas.

Cuando se trata de estimar las varianzas de este tipo de estimadores,
los cálculos analíticos se tornan mucho más complicados.
@Train_Cahoon_Makens_1978 muestran lo complicado que puede ser calcular
las variaciones de los promedios de las estimaciones de múltiples
períodos de tiempo en una encuesta repetida y cómo estos cálculos
dependen en gran manera del patrón de traslape definido en el diseño de
la encuesta. Para las encuestas de población activa, a menudo se utiliza
un enfoque computacional basado en métodos de remuestreo, como
*Jackknife*, *Bootstrap* o *BRR*. Nótese que el uso apropiado de tales
métodos, también dependerá del origen de la encuesta y de sus objetivos.
Por ejemplo, los insumos de aplicación de los métodos serían unos si la
encuesta está orientada a medir el desempleo, y serían otros si la encuesta
está diseñada para estimar los cambios brutos entre dos periodos de
tiempo.


## Factores de expansión y estimadores de muestreo

Si el investigador está interesado en estimar la tasa de
desempleo anual sobre una encuesta rotativa, que se lleva a durante los cuatro trimestres del año, es posible usar los cuatro conjuntos de datos y unir los trimestres para estimar la tasa de desempleo anual. Una solución
inicial a este problema consiste en agregar las cuatro bases de datos y
dividir los pesos de muestreo de cada periodo por un factor de cuatro.
El anterior procedimiento induce estimadores puntuales aproximadamente
insesgados, aunque las estimaciones de los errores estándar se tornan un
poco más complicadas, puesto que se debe concatenar exhaustivamente las
UPM (o incluso crear unidades de varianza).

Por supuesto, las encuestas que utilizan diseños rotativos, en donde un
hogar es entrevistado en varias ocasiones, deben adjuntar dos clases de
pesos de muestreo: los transversales y los agregados. Los pesos
transversales, discutidos en las secciones anteriores, son aquellos
inducidos por el diseño de muestreo de la encuesta en cada aplicación y
que permiten obtener estimaciones de los parámetros de interés de forma
periódica (mensual, trimestral o semestral). De esta forma, por ejemplo
en una encuesta de fuerza de trabajo, los datos transversales se usarán
para producir estimaciones periódicas de la participación en la fuerza
de trabajo, o de la tasa de pobreza, o de la tasa de desempleo, etc. Por ejemplo, la estimación de la tasa de desempleo usa
un estimador de razón, definido de la siguiente forma

$$\hat\theta=\frac{\sum_s d_ky_k}{\sum_s d_kz_k}$$

En donde, para la persona $k$-ésima, $d_k$ representa su peso de
muestreo, $y_k$ representa su estado de ocupación (específicamente,
$y_k=1$ si la persona está desempleada) y $z_k$ es su estado en la
fuerza de trabajo (específicamente, $z_k=1$ si la persona pertenece a la
población económicamente activa). Esta estrategia de estimación asume que cada persona
se representa a sí misma y a otras más en la población. Nótese que los
pesos transversales asignados estarán determinados por la probabilidad
de selección de las UPM, la probabilidad de selección del hogar dentro
de la UPM, el ajuste por ausencia de respuesta en ese mismo mes, ajustes
por elegibilidad, calibración, entre otros. Por tales razones, aunadas a
la incorporación de la nueva muestra en un diseño rotativo, además de la
ausencia de respuesta y también por los cambios en el tamaño de la
población de interés, el peso de un individuo puede cambiar de un
periodo a otro. De esta forma, si $d_k^{t-1}$ y $d_k^{t}$ representan el
peso de muestreo del individuo $k$ en los periodos $t-1$ y $t$,
respectivamente, es casi seguro que

$$d_k^{t-1} \neq d_k^t$$

Es necesario crear un nuevo conjunto de factores de expansión (pesos
agregados) que soporten la inferencia agregada. Por un lado, nótese que cada factor de expansión en las encuestas mensuales se
define como la cantidad de hogares que el hogar seleccionado representa
en ese periodo de referencia. Por tanto, para mantener esta consistencia
es posible inicializar la construcción de los factores de expansión agregados realizando una modificación proporcional a los pesos originales de los levantamientos mensuales. Por ejemplo, si se quisieran agregar tres meses, para formar una base de datos trimestral, sería necesario definir un factor de expansión trimestral $d_{k}^+$ que tenga en cuenta la siguiente relación:

$$
\hat{t}_y = \sum_{s1 \cup s2 \cup s3} d_{k}^+ y_k
\propto \sum_{s_1} d_{1k} y_k + \sum_{s_2} d_{2k} y_k + \sum_{s_3} d_{3k} y_k
$$

En donde $d_{ik}$ es el factor de expansión del mes $i$-ésimo $(i = 1,2,3)$. En particular, para la esta agregación trimestral, el factor de expansión mensual de
cada individuo y hogar debe ser multiplicado por el siguiente
ponderador:

$$
a_i = \frac{\sum_{k\in s_i}d_{ik}}{\sum_{i=1}^{3}\sum_{k\in s_i}d_{ik}}; \ \ \ \ \ \ i= 1, 2 ,3.
$$

En donde $s_i$ representa la muestra de respondientes efectivos en el mes $i$-ésimo. De esta forma, los pesos inciciales agregados estarían dados por la siguiente expresión:

$$
d_{ik}^+ = a_i \times d_{ik} ; \ \ \ \ \ \ k\in s_i
$$


De la misma manera, para una agregación anual, el factor de expansión
debe ser modificado de manera proporcional a los pesos originales de los
levantamientos mensuales (o trimestrales) teniendo en cuenta la
siguiente relación

$$
\hat{t}_y = \sum_{s_1 \cup ... \cup s_{12}} d_{k}^+ y_k
\propto 
\sum_{s_1} d_{1k} y_k + \sum_{s_2} d_{2k} y_k + \cdots + \sum_{s_{12}} d_{12k} y_k
$$

Por lo tanto, en la agregación anual el factor de expansión de cada
individuo y hogar debe ser multiplicado por el siguiente ponderador:

$$
b_i = \frac{\sum_{k\in s_i}d_{ik}}{\sum_{i=1}^{12}\sum_{k\in s_i}d_{ik}} ; \ \ \ \ \ \ i= 1, \ldots, 12.
$$

Por consiguiente, los pesos iniciales agregados estarían dados por la siguiente expresión:

$$
d_{ik}^+ = b_i \times d_{ik} ; \ \ \ \ \ \ k\in s_i
$$

La nueva estructura de los factores de expansión debe garantizar que la
suma de los pesos en las bases agregadas esté acorde con la población a
la cual se quiere representar. En términos matemáticos, se debe siempre
verificar que las siguientes relaciones se mantengan en las bases
agregadas:

$$
\sum_{k\in s^3} d_{ik}^+ = \sum_{i=1}^{3}\sum_{s_i} a_i d_{ik} \approx N
$$

En donde $s^3=s1 \cup s2 \cup s3$ corresponde a la muestra agregada de los tres primeros meses. De la misma manera, en el caso de la agregación anual, también conviene verificar la misma relación; esto es:

$$
\sum_{k\in s^{12}} d_{ik}^+ = \sum_{i=1}^{12}\sum_{s_i} b_i d_{ik} \approx N
$$

En donde $s^{12}=s_1 \cup ... \cup s_{12}$ corresponde a la muestra agregada anual. Además de las verificaciones sobre los tamaños nacionales, también es recomendable
realizar este mismo proceso en dominios más específicos para verificar
que la ponderación es correcta; por ejemplo, en las principales ciudades
del país, en las áreas rural/urbano, en las provincias, en los grupos de sexo, grupos de edad, entre otros. Una vez que se ha llevado a cabo el proceso de cómputo de
los nuevos pesos agregados en la bases de datos (trimestrales o
anuales) es necesario que se realice nuevamente un proceso de
calibración sobre las variables involucradas en la calibración mensual de los factores de expansión. 

Ante la ausencia de proyecciones poblacionales trimestrales o anuales, es posible escoger el mes intermedio o el
promedio de los meses que intervienen en la agregación. Se espera que este ajuste final de los pesos
sea minúsculo y no afecte la estructura de la distribución de los pesos
mensuales puesto que se trata de calibrar unos pesos que originalmente
fueron calibrados en las publicaciones mensuales. Por otro lado, debido
a que este último paso se realiza con propósitos de mantener la
consistencia con las publicaciones, es posible que la calibración se vea
reducida al considerar menos restricciones sobre los totales auxiliares
más relevantes.

Se recalca que las agregaciones deberían contemplar a todas las
viviendas que fueron partícipes de la muestra mensuales en el trimestre
móvil. De la misma forma, las agregaciones anuales deben contemplar las
viviendas que han sido seleccionadas más de una vez (debido al esquema
de rotación del panel) y por ende todas sus mediciones deben aparecer en
la base de datos tantas veces como fueron visitadas. 

Para ilustrar el procedimiento, considere una encuesta de hogares continua que mes a mes recolecta información. Suponga que esta encuesta sigue un esquema rotativos trimestral 2(2)2, y que las muestras mensuales son independientes. Es decir que la rotación de los paneles se planeó de manera trimestral y, a su vez, esta muestra es repartida de forma balanceada e independiente en los tres meses que conforman el trimeste. En este caso, las agregaciones trimestrales no deberían
contemplar ninguna vivienda con mediciones repetidas si es que el
esquema de panel no las contempla. Nótese que es necesario realizar el
correspondiente ajuste a los pesos de muestreo sin diferenciar si la
vivienda apareció una vez o fue medida en más de una ocasión.

En el escenario de ejemplo, en la estimación del error de muestreo para
las agregaciones trimestrales se debe considerar que el muestreo es
independiente en los tres meses que componen el trimestre móvil y por
ende la posibilidad de tener viviendas repetidas es casi nula. Nótese
que el estimador para un total en la agregación trimestral tomará la
siguiente forma de sumas mensuales parciales:

$$
\hat{t}_y 
= \sum_{s1} d_{1k}^+ y_k + \sum_{s2} d_{2k}^+ y_k + \sum_{s3} d_{3k}^+ y_k
= \hat{t}_{y}^1 + \hat{t}_{y}^2 + \hat{t}_{y}^3
$$

En donde $d_{ik}^+ = a_i \times d_{ik}$. En este caso, la varianza del estimador está dada por

$$
Var(\hat{t}_y)
= Var(\hat{t}_{y}^1) + Var(\hat{t}_{y}^2) + Var(\hat{t}_{y}^3)
$$

Sin embargo, en la estimación del error de muestreo para las
agregaciones anuales se debe considerar que el muestreo no es
independiente en los doce meses. En este caso, el estimador de interés
sigue tomando la forma de sumas parciales mensuales:

$$
\hat{t}_y 
= \sum_{i=1}^{12}\sum_{s_i} d_{ik}^+ y_k 
= \sum_{i=1}^{12} \hat{t}_{y}^i
$$

En donde $d_{ik}^+ = b_i \times d_{ik}$. A diferencia de la agregación trimestral, la varianza de este
estimador está supeditada a las covarianzas que se puedan crear al
visitar las mismas UPM debido al esquema rotativo. Es decir:

$$
Var(\hat{t}_y) 
= \sum_{i=1}^{12} Var(\hat{t}_{y}^i)
+ 2 \sum_{i,j=1}^{12} \sum_{j < i} Cov(\hat{t}_{y}^i, \hat{t}_{y}^j)
$$

## Agregación de encuestas con diferentes tamaños de muestra

En algunos casos, el tamaño de las encuestas puede variar significativamente entre dos meses consecutivos. La pandemia por COVID-19 mostró cómo esta clase de eventos adversos puede afectar gravemente el tamaño de muestra de los levantamientos regulares. Por ejemplo, considere el siguiente esquema trimestral:

| Panel / Mes | M1 | M2 | M3 |
|:-----------:|:-----:|:-------:|:-----:|
|    Panel    |   P1   |    P2   |   P3   |
|  Viviendas  | 5000  |  4500   | 2500  |
|    Panel    |   P4  |    P5    |   P6   |
|  Viviendas  | 5500  |  5100   | 3000  |


En este caso, habiendo evaluado, analizado y ejecutado exhaustivamente los ajustes al factor de expansión, el principio detrás de esta agregación trimestral es intuitivo y simple: *cada elemento dentro de la base de datos agregada se
representa a sí mismo y a una porción de los habitantes del país en
diferentes periodos de tiempo*. Teniendo en cuenta lo anterior, es
necesario notar que en el primer mes los paneles que se utilizan para
producir las cifras oficiales son únicamente el P1 y el P4. De la misma
manera, en el segundo mes se utilizan únicamente el panel P2 y el P5. Suponga también que las cifras oficiales en estos dos primeros meses son representativas de más desagregaciones que las del tercer, en donde participan los paneles P3 y P6, pero con un decremento sustancial en la muestra. 

Como se puede notar, esta tabla contiene varios elementos que hay que
tratar con precisión. En particular, el hecho de que la encuesta tenga
levantamientos mensuales en todos los dominios de interés, no
implica que mensualmente se tiene el mismo nivel de representatividad que en el trimestre. De hecho, como se mencionó anteriormente, dada la baja incidencia de entrevistas en el último mes, es muy factible que no exista el mismo nivel de representatividad comparado con los dos primeros meses. Las anteriores características implican que el tratamiento de
los factores de expansión iniciales debe hacerse de forma diferencial.

@Heeringa_West_Berglund_2017 afirman que para evitar el sesgo inducido
por tamaños de muestra pequeños, como el que evidentemente se tiene en
el tercer mes del ejemplo, es posible ajustar los pesos de
muestreo. En particular, cuando los levantamientos tienen este tipo de diferenciación en los tamaños de muestra, se sugiere utilizar la siguiente
expresión para normalizar los pesos de muestreo:

$$
d_{kth}^{+}=\delta_{th} \times d_{kth}
$$

En donde $d_{kth}$ hace referencia al peso de muestreo del individuo $k$
del estrato $h$ en el mes $t$ $(t=1, 2, 3)$ y $\delta_{th}$ es un factor
de ajuste, dependiente del tamaño de muestra, que representa el
porcentaje de individuos observados en el mes $t$ para el estrato $h$.
Este factor, propuesto por @Kish_1999 [p. 131] en el contexto de
acumulación de muestras, está dado por la siguiente expresión

$$
\delta_{th} = \frac{n_{th}}{\sum_{t = 1} ^3 n_{th}}
$$

En general, $h$ podría ser el estrato de muestreo, o de manera más
amplia el dominio de representatividad. Utilizando esta metodología los factores trimestrales tendrían las
siguientes tres propiedades bastante favorables en un sistema de
ponderación agregado.

1.  Definen una combinación lineal convexa.
2.  Mantienen la consistencia con los tamaños por estrato o dominio.
3.  Su aporte es proporcional al tamaño de muestra mensual.
4.  Se pueden expresar como un promedio equivalente a través de los estratos o dominios.

La primera propiedad se tiene puesto que
$\delta_{th} > 0 \ \forall t, \forall h$ y además
$\sum_{t=1}^3 \delta_{th} = 1$. La segunda propiedad se verifica dado
que, asumiendo que $s_{h}$ es la muestra del estrato $h$ a través de
todos los meses, entonces

$$
\sum_{t=1}^3\sum_{k\in s_{h}} d_{kth}^{+}
=\sum_{t=1}^3\sum_{k\in s_h}\delta_{th}\ d_{kth}
=\sum_{t=1}^3\delta_{th}\sum_{k\in s_{th}}\ d_{kth} 
=\sum_{t=1}^3\delta_{th}\hat{N}_h^t 
\cong \sum_{t=1}^3\delta_{th}\hat{N}_h = \hat{N}_h
$$

La tercera propiedad se verifica puesto que la suma de los factores de
expansión trimestrales restringida a un mes y un dominio particular está
ponderada por el factor de ajuste $\delta$, como se demuestra a
continuación:

$$
\sum_{k\in s_{th}} d_{kth}^{+}=\sum_{k\in s_{th}}\delta_{th}\ d_{kth}
=\delta_{th}\sum_{k\in s_{th}}\ d_{kth} 
=\delta_{th}\hat{N}_h^t
$$

La última propiedad se puede comprobar en la encuesta, verificando que el aporte de los factores trimestrales sea proporcional al tamaño de muestra en cada dominio y en cada mes. Por último, la media de los factores de expansión es casi invariante con
respecto a los meses, restringidos a un dominio específico. En efecto,
note que:

$$
\frac{\sum_{k\in s_{th}} d_{kth}^{+}}{n_{h}}
=\frac{\sum_{k\in s_{th}} \delta_{th} d_{kth}}{n_{h}}
=\frac{\sum_{k\in s_{th}} d_{kth}}{\sum_h n_h}
=\frac{\hat{N}_{th}}{\sum_h n_h}
\cong \frac{\hat{N}_{h}}{\sum_h n_h}
$$

Este comportamiento se observaría en la agregación, verificando que, sin importar el mes, la media de los factores trimestrales sea similar para cada dominio de interés. Las anteriores cuatro propiedades hacen que se cree un mejor sistema de
ponderación agregado puesto que cada individuo en un dominio de interés
tendrá un mismo factor trimestral similar, lo que le dará fuerza al mes
que mayor tamaño de muestra tenga. Por lo anterior, para las cinco
ciudades principales, es de esperar que la agregación induzca
estimadores que colinden con los valores promedio entre los estimadores
puntuales de los tres meses considerados.

La agregación anual consistiría en la extensión de esta metodología
considerando un periodo más extenso de doce meses. En particular, se sugiere utilizar la siguiente expresión para normalizar los pesos de muestreo:

$$
d_{kth}^{+}=\delta_{th}* d_{kth}
$$

En donde $d_{kth}$ hace referencia al peso de muestreo del individuo $k$
del estrato $h$ en el mes $t$ $(t=1, \ldots, 12)$ y $\delta_{th}$
representa el porcentaje de individuos observados en el mes $t$ para
el estrato $h$, dado por

$$
\delta_{th} = \frac{n_{th}}{\sum_{t = 1} ^{12} n_{th}}
$$


## Efecto del tipo de encuesta en la eficiencia de los indicadores

Lograr una estimación adecuada del error de muestreo en las
comparaciones de múltiples periodos de tiempo, ya sea con la agregación
de datos o no, debe ser una de las principales tareas del investigador.
Además, dependiendo del parámetro, la naturaleza del error de muestreo
cambia así como el tamaño de muestra requerido para satisfacer las
necesidades de precisión de las estimaciones. A continuación se ilustra con diferentes tipos de parámetros.

#### Cambios netos {-}

Considere el cambio neto de la media de la variable de
interés $y$ en dos periodos de tiempo ($t_2$ y $t_1$)

$$
\Delta = \bar{y}_2 - \bar{y}_1
$$

Este parámetro de cambio en los dos periodos de tiempo es estimado de
forma aproximadamente insesgada mediante la siguiente expresión:

$$
\hat{\Delta} = 
\hat{\bar{y}}_2 - \hat{\bar{y}}_1
= \frac{\sum_{k\in s_2}\frac{y_{k}}{\pi_k}}{\sum_{k\in s_2}\frac{1}{\pi_k}} - \frac{\sum_{k\in s_1}\frac{y_{k}}{\pi_k}}{\sum_{k\in s_1}\frac{1}{\pi_k}}
$$

En donde $s_2$ y $s_1$ representan las muestras seleccionadas en los
periodos de interés y $\pi_k$ es la probabilidad de inclusión del
elemento $k$. La varianza del estimador de cambio se calcula mediante la
siguiente expresión:

$$
Var(\hat{\Delta}) = Var(\hat{\bar{y}}_2) + Var(\hat{\bar{y}}_1) - 2Cov(\hat{\bar{y}}_2, \hat{\bar{y}}_1)
$$

En general, el último término se puede expresar como

$$
2Cov(\hat{\bar{y}}_2, \hat{\bar{y}}_1) = 
2\sqrt{Var(\hat{\bar{y}}_2)}\sqrt{Var(\hat{\bar{y}}_1)}\sqrt{T_2}\sqrt{T_1}R_{12}
$$

En donde $T_2$ y $T_1$ representan el porcentaje de muestra común que se
traslapa en ambos levantamientos y $R_{12}$ representa la correlación de
la variable de interés $x$ en los periodos observados. Suponiendo que la
variación de la variable de interés es homogénea en ambos periodos $Var(\hat{\bar{y}}_1) = Var(\hat{\bar{y}}_2) = Var(\hat{\bar{y}})$ y que
el traslape es común por diseño $T_2 = T_1 = T$, entonces la expresión de la varianza se
reduce de la siguiente manera:

$$
Var(\hat{\Delta}) = 2Var(\hat{\bar{y}}) - 2{Var(\hat{\bar{y}})}TR_{12}
=2Var(\hat{\bar{y}})(1-TR_{12}) 
$$

@Kish_2004 comenta que la varianza de este indicador cambiará de acuerdo al tipo de
encuesta que se elija. En efecto:

-   Encuesta repetida: en donde $T=0$ y
    $$Var(\hat{\Delta}) = 2Var(\hat{\bar{y}})$$
-   Encuesta de panel, en donde $T=1$, $R_{12} > 0$ y
    $$Var(\hat{\Delta}) = 2Var(\hat{\bar{y}})(1-R_{12})$$
-   Encuesta rotativa: en donde $T\neq 0$, $R_{12} > 0$ y
    $$Var(\hat{\Delta}) = 2Var(\hat{\bar{y}})(1-TR_{12})$$

Además, si se supone que la *correlación es positiva* para la variable de interés en los
dos periodos de tiempo, entonces se tiene la siguiente conclusión:

$$
2Var(\hat{\bar{y}})(1-R_{12}) < 2Var(\hat{\bar{y}})(1-TR_{12}) < 2Var(\hat{\bar{y}})
$$

Es decir que se necesita un tamaño de muestra *menor* para medir los
cambios netos usando un diseño panel que un diseño sin traslape en una encuesta repetida. Un
camino medio es el diseño rotativo.

#### Promedio trimestral {-}

Considere una encuesta continua y mensual en donde se quiere estimar el
promedio trimestral de la variable de interés $x$ en tres periodos de
tiempo ($t_3$, $t_2$ y $t_1$)

$$
\Theta = \frac{\bar{y}_3 + \bar{y}_2 + \bar{y}_1}{3}
$$

Un estimador del promedio trimestral que es aproximadamente insesgado está dado mediante la siguiente expresión:

$$
\hat{\Theta} = \frac{1}{3} \left( \hat{\bar{y}}_3 + \hat{\bar{y}}_2 + \hat{\bar{y}}_1 \right)
= \frac{1}{3}\left( \frac{\sum_{k\in s_3}\frac{y_{k}}{\pi_k}}{\sum_{k\in s_3}\frac{1}{\pi_k}} + \frac{\sum_{k\in s_2}\frac{y_{k}}{\pi_k}}{\sum_{k\in s_2}\frac{1}{\pi_k}} + \frac{\sum_{k\in s_1}\frac{y_{k}}{\pi_k}}{\sum_{k\in s_1}\frac{1}{\pi_k}} \right)
$$

En donde $s_3$, $s_2$ y $s_1$ representan las muestras seleccionadas en
los periodos de interés y $\pi_k$ es la probabilidad de inclusión del
elemento $k$. La varianza del estimador del promedio trimestral se
calcula mediante la siguiente expresión:

$$
\begin{split}
Var(\hat{\Theta}) & = \frac{1}{9}[Var(\hat{\bar{y}}_3) + Var(\hat{\bar{y}}_2) + Var(\hat{\bar{y}}_2) + \\ 
&2Cov(\hat{\bar{y}}_3, \hat{\bar{y}}_2)) + 2Cov(\hat{\bar{y}}_3, \hat{\bar{y}}_1)) + 2Cov(\hat{\bar{y}}_2, \hat{\bar{y}}_1)]
\end{split}
$$

Suponiendo que la variación de la variable de interés es homogénea en
los tres periodos y que el traslape es común por diseño y que los errores
de muestreo son débilmente estacionarios (media y correlación constante) entre dos y tres meses,
entonces la expresión de la varianza se reduce de la siguiente manera:

$$
Var(\hat{\Theta}) = \frac{1}{9} Var(\hat{\bar{y}})[3 + 6TR]
$$

En donde $R=R_{12}=R_{23}=R_{13}$ es la correlación constante de la variable de interés en dos y tres
meses (asumida homogénea). Nótese que la varianza de este indicador
cambiará de acuerdo al tipo de encuesta que se elija:

-   Encuesta repetida: en donde $T=0$ y
    $$Var(\hat{\Theta}) = \frac{1}{3} Var(\hat{\bar{y}})$$
-   Encuesta de panel, en donde $T=1$, $R > 0$ y
    $$Var(\hat{\Theta}) = \frac{1}{9} Var(\hat{\bar{y}}) [3+6R]$$
-   Encuesta rotativa: en donde $T\neq 0$, $R > 0$ y
    $$Var(\hat{\Theta}) = \frac{1}{9} Var(\hat{\bar{y}}) [3+6TR]$$

De esta forma, si se supone que la *correlación es positiva* para la
variable en los tres periodos de tiempo, entonces se tiene la siguiente
conclusión:

$$
\frac{1}{9} Var(\hat{\bar{y}}) [3+6R] > \frac{1}{9} Var(\hat{\bar{y}}) [3+6TR] > \frac{1}{3} Var(\hat{\bar{y}})
$$

Es decir que se necesita un tamaño de muestra *mayor* para estimar un
promedio trimestral usando un diseño panel que un diseño sin traslape. De la misma forma, un camino intermedio es el diseño de panel rotativo.


## Pruebas de hipótesis sobre indicadores agregados

Para decidir si un cambio en la dinámica de los parámetros de interés es
significativo entre dos periodos de tiempo es necesario llevar a cabo
una prueba de hipótesis. Por ejemplo, tomando en cuenta la dinámica del
mercado de trabajo, es posible realizar comparaciones entre dos
trimestres seguidos o entre dos años consecutivos para conocer, por
ejemplo, si hay un cambio significativo e importante en la reducción de
la desocupación (entre grupos y en distintos periodos del tiempo).

Para realizar comparaciones entre grupos de un mismo corte transversal
(por ejemplo comparar la situación laboral de hombres y mujeres en un
mes específico) es necesario tener en cuenta que el muestreo de la
primera etapa es de UPM y que el tamaño de muestra de hombres y mujeres
es aleatorio. Para realizar comparaciones nacionales o regionales en dos
periodos de tiempo (por ejemplo comparar la situación laboral de un país
entre dos trimestres) es necesario tener en cuenta que el muestreo puede
no ser independiente entre trimestres ni entre años, siendo este el caso
de las encuestas que contemplan diseños de panel rotativo. Considere el
siguiente sistema de hipótesis:

$$
H_0: \theta_2 - \theta_1 = 0 \ \ \ \ vs. \ \ \ \ H_1: \theta_2 - \theta_1 \neq 0
$$

Para llevar a cabo la prueba de hipótesis trabajamos con el siguiente
estimador de diferencias:

$$
\hat{\Delta} = \hat{\theta}_2 - \hat{\theta}_1
$$

La varianza asociada a este estimador está dada por

$$
Var(\hat{\Delta}) 
= Var(\hat{\theta}_2) + Var(\hat{\theta}_1) - 2 Cov(\hat{\theta}_1, \hat{\theta}_2) 
$$

Y por último, el término de covarianza se puede escribir como

$$
Cov(\hat{\theta}_1, \hat{\theta}_2) = \sqrt{Var(\hat{\theta}_1)}\sqrt{Var(\hat{\theta}_2)}\sqrt{T_1}\sqrt{T_2}R_{12}
$$

Existen muchos escenarios de comparación que son de interés cuando se
analizan datos de una encuesta de empleo. Estas comparaciones se hacen
más complejas cuando se incluye en el análisis el diseño de panel de la
encuesta. Sin embargo, cuando se cumple el siguiente principio no habrá
lugar a confusión

> *A no ser que los dos estimadores puntuales estén compuestos de
> observaciones provenientes de un conjunto disyunto de UPM, el término
> de covarianza no será nulo.*

En general, no es posible generalizar la estructura de varianza en una
base de datos agregada, pero tomando como punto de partida los ejemplos
expuestos en el capítulo de tamaño de muestra, se pueden identificar tres escenarios de interés. En primer lugar, al suponer que existe independencia en el muestreo de dos meses consecutivos. En este caso, $T_1 = T_2 = 0$, luego, el término de la covarianza se anularía. En segundo lugar, en un diseño de panel 2(2)2, si se quiere comparar estimadores nacionales entre trimestres consecutivos o entre el mismo mes de dos años consecutivos, entonces $T_1 = T_2 \approx 0.5$ y $R_{12} \neq 0$. En este caso, el término de covarianza sería igual a: $Cov(\hat{\theta}_1, \hat{\theta}_2) = \frac{1}{2}\sqrt{Var(\hat{\theta}_1)}\sqrt{Var(\hat{\theta}_2)}R_{12}$. Por último, si se quiere comparar estimadores entre subgrupos en un mismo mes, se pueden distinguir dos casos de interés: 

* Si no existe independencia en el muestreo de los subgrupos (por ejemplo hombres y mujeres). Por no ser estratos de muestreo, entonces $T_1 \neq T_2$ y $R_{12} \neq 0$, y el término de covarianza en este caso sería igual a $Cov(\hat{\theta}_1, \hat{\theta}_2) = \sqrt{Var(\hat{\theta}_1)}\sqrt{Var(\hat{\theta}_2)}\sqrt{T_1}\sqrt{T_2}R_{12}$.

* Si existe independencia en el muestreo de los subgrupos (por ejemplo dos ciudades principales o dos regiones). Por ser estratos de muestreo $R_{12} = 0$, y el término de covarianza será nulo.

Una vez se ha concluido la estructura de varianza del estimador de
interés, el siguiente paso es definir el estadístico de prueba para determinar si el parámetro ha cambiado entre grupos o a lo largo del tiempo; el cual toma la siguiente expresión:

$$
t = \frac{\hat{\Delta}}{\sqrt{Var(\hat{\Delta})}}
$$

Este estadístico de prueba sigue una distribución *t-student* con $gl$
grados de libertad, los cuales están dados por la resta entre el número de UPM
seleccionadas menos el número de estratos de muestreo considerados en la agregación. De
esta forma, se tiene que:

$$
gl = \sum_{h=1}^H (n_{Ih} - 1) = \sum_{h=1}^H n_{Ih} - H = \#UPM - \#Estratos
$$

Los grados de libertad permiten tener una inferencia precisa a medida
que crecen. Por ejemplo, considere por ejemplo el percentil 0.975 para
el cual los valores críticos de la distribución varían con respecto a
sus grados de libertad: $t_{0.975, 1}=12.7$, $t_{0.975, 20}=2.08$,
$t_{0.975, 40}=2.02$, $t_{0.975, \infty}=1.96$. Los grados de libertad
son determinantes a la hora de hacer inferencias dentro de
subpoblaciones de interés. En este caso los grados de libertad no se
consideran fijos sino variables. @Korn_Graubard_1999 proponen el
siguiente método de cálculo sobre los grados de libertad en
subpoblaciones:

$$
gl_{subpoblación} = \sum_{h=1}^H v_h(n_{Ih} - 1)
$$

En donde $v_h$ es una variable indicadora que toma el valor uno si el
estrato $h$ contiene uno o mas casos de las subpoblaciones de interés y
toma el valor cero en otro caso.
