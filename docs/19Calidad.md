# Criterios de calidad y difusión

Como se ha establecido a lo largo de este documento, las encuestas de hogares de la región tienen un diseño complejo, probabilístico, estratificado, multietápico y con probabilidades de inclusión no uniformes. Por ende, las estimaciones elaboradas a partir de estas operaciones estadísticas están sujetas al error muestral, y se requiere evaluar su validez estadística mediante diversos indicadores de calidad que describen su precisión y confiabilidad y que a su vez alertan al usuario cuando la precisión de la estimación no es confiable. Una vez obtenido el indicador de interés (por ejemplo, la proporción de personas en situación de pobreza y de pobreza extrema), se estiman los intervalos de confianza y otros indicadores de calidad con base en la información sobre el diseño muestral complejo, resumida en el factor de expansión, los estratos y las unidades primarias de muestreo (UPM). 

Una gran cantidad de indicadores sociales son estimados a partir de las encuestas de hogares. En esta sección, se plantea la necesidad de generar una metodología de procesamiento de las bases en los INE de la región que le permita a los analistas, investigadores y usuarios de las bases de datos de las encuestas de hogares decidir acerca de la pertinencia de una estimación con base en algunos criterios de calidad que resumen la precisión de las estimaciones. Existen cruces derivados del procesamiento de las bases de datos que no necesariamente deben ser tenidos en cuenta a la hora de tomar decisiones de política pública. La razón por la cual se hace esta afirmación es que simplemente las encuestas no son planeadas con el propósito de ser representativas de todos los posibles procesamientos que se puedan hacer. 

Nótese que la implicación entre precisión y diseño va en una sola dirección: *si la precisión es deficiente significa que esta estimación no fue considerada en el diseño de la encuesta.* Sin embargo, es posible encontrar en muchas ocasiones que a pesar de que una estimación no fue considerada inicialmente por el diseño de la encuesta, esta pueda ser considerada como precisa y confiable. En este documento se definen y establecen algunos criterios que son considerados actualmente por algunas oficinas nacionales de estadística, así como por entidades dedicadas a la investigación social. 


## Medidas de calidad

Los criterios que aparecen en esta sección pueden ser tenidos en cuenta para determinar si una estadística debe ser considerada como precisa y confiable.

### Intervalos de confianza 

En general, la precisión de una estadística se debe estudiar a la luz del intervalo de confianza generado por la medida de probabilidad asociada al diseño de muestreo de la encuesta. Por ejemplo, si el parámetro de interés sobre el cual se busca realizar la inferencia es $\theta$, y se ha definido una subpoblación de interés, entonces un intervalo del 95% de confianza sobre esa subpoblación está dado por la siguiente expresión [@Heeringa_West_Berglund_2010]:

$$
(\hat\theta - t_{0,975, gl} * se(\hat\theta), \ \ \hat\theta + t_{0,975, gl} * se(\hat\theta))
$$

En donde $\hat\theta$ es un estimador por muestreo para el parámetro de interés $\theta$, $t_{0,975, gl}$ es el percentil 0.975 de una distribución *t-student* con $gl$ grados de libertad, que están dados por la resta entre el número de UPM seleccionadas menos el número de estratos de muestreo considerados y $se(\hat\theta)$ es el error estándar de la estimación, definido por la raíz cuadrada de la varianza estimada del estimador; es decir: 
$$
se(\hat\theta) = \sqrt{\widehat{Var}(\hat\theta)}
$$

En el caso particular de las proporciones, los intervalos de confianza deben estar contenidos dentro del intervalo $(0, 1)$. Sin embargo, en algunas ocasiones puede ocurrir que el error estándar de una estimación cercana al 0 o al 1 sea demasiado grande y que el límite inferior, o superior del intervalo de confianza sea menor a cero, o mayor a uno, respectivamente. En este caso, es necesario estimar el intervalo de confianza con una variante que permita considerar estas restricciones. Una solución a este problema es considerar una transformación al estimador. De esta manera, si $\hat{P}$ es una estimación de la proporción, se define la transformación Logit de la proporción.

$$
\hat{L} = \log \left(\dfrac{\hat{P}}{1-\hat{P}} \right) = logit(\hat{P})
$$

Note que la aproximación de Taylor de primer orden para $\hat{L}$ es:

$$
\hat{L} \cong L(P) + \frac{\partial \hat{L}}{\partial \hat{P}}\biggr\rvert_{\hat{P}=P}(\hat{P}-P) = L(P) + \left( \dfrac{1}{P(1-P)}\right)(\hat{P}-P)
$$

Luego la varianza de $\hat{L}$ se puede escribir como: 
$$
Var(\hat{L}) = AVar(\hat{L}) = \dfrac{Var(\hat{P})}{P^2(1-P)^2}
$$

De esta forma, es posible definir un intervalo de $(1-\alpha)100\%$ de confianza para $L$ como
$$
\left(\hat{L} - t_{0,975, gl}\sqrt{Var(\hat{L})}, \ \
\hat{L} + t_{0,975, gl}\sqrt{Var(\hat{L})}
\right) =
(\hat{L}_1, \ \ \hat{L}_2)
$$

Finalmente, se tiene que

$$
\hat{P} = logit^{-1}(\hat L) = \dfrac{\exp (\hat{L})}{1+\exp (\hat{L})}
$$

Por tanto, un intervalo de confianza para $\hat{P}$ está por 
$$
\left(logit(\hat{L}_1), \ \ logit(\hat{L}_2)\right) = 
\left(
\dfrac{\exp (\hat{L}_1)}{1+\exp (\hat{L}_1)}, \ \
\dfrac{\exp (\hat{L}_2)}{1+\exp (\hat{L}_2)}
\right) \subseteq (0, 1)
$$

Nótese que en los casos en los que el intervalo de confianza clásico se sale de los límites naturales de la proporción, es recomendable utilizar este último enfoque. 

### Coeficiente de variación 

Esta medida configura un acercamiento al error de muestreo que permite verificar si la inferencia es válida, su definición es como sigue:

$$
CV(\hat\theta) = \frac{se(\hat\theta)}{\hat\theta} = \frac{\sqrt{\widehat{Var}(\hat\theta)}}{\hat\theta}
$$

Esta medida de precisión de las estimaciones se ha consolidado como un estándar de calidad que ha permeado la práctica de los INE en la publicación de estadísticas oficiales. Su uso es transversal puesto que, por su definición, tiene una naturaleza relativa, liberando al usuario de la unidad de medida inducida por la variable de interés. Además, es posible reformular los intervalos de confianza en términos del coeficiente de variación, de la siguiente manera:

$$
\hat\theta \pm t_{0,975, gl} * se(\hat\theta) = \hat\theta  \left(1 \pm t_{0,975, gl} * CV(\hat\theta)\right)
$$

Como lo afirman @Singh_Westlake_Feder_2004, esta es una medida de fácil interpretación, proporcional a la amplitud del intervalo de confianza, que provee una medida estandarizada y relativa de la precisión alrededor de la estimación puntual, que permite comparar dos estimaciones del mismo indicador en diferentes sub-poblaciones, y además que es utilizada en el diseño y a re-diseño de las encuestas, entre otras cualidades. Por ejemplo, desde el punto de vista teórico, @Sarndal_Swensson_Wretman_2003 expresan que un estadístico puede expresar su opinión de "que un valor del coeficiente de variación del 2% es bueno, considerando las restricciones de la encuesta, mientras que un valor del coeficiente de variación de 9% puede ser considerado inaceptable." De esta forma, muchos institutos nacionales de estadística alrededor del mundo han considerado que las precisiones de las estadísticas resultantes de una encuesta estén supeditadas al comportamiento de su coeficiente de variación. En el contexto de la calidad de las estimaciones provenientes de encuestas de hogares, mucho se ha discutido acerca del uso del coeficiente de variación en la validación de la confiabilidad y precisión de las cifras que provienen de estudios por muestreo. 

Nótese que, cuando se están estimando proporciones, esta medida tiene algunas consideraciones importantes. En primer lugar, fijar un umbral para el coeficiente de variación tiene una interpretación directa sobre la amplitud relativa del intervalo de confianza. Por ejemplo, si la ONE decide fijar como umbral para el coeficiente de variación un 30%, esto implica que la amplitud relativa (AR) del intervalo de confianza se fija de forma automática alrededor de 118%, puesto que:

$$
CV(\hat\theta) = 30\% 
\Rightarrow 
AR = \frac{2*t_{0,975, gl} * se(\hat\theta)}{\hat\theta} \approx 118\%
$$

Por otro lado, como en todo fenómeno dicotómico resumido en un proporción, la varianza y el error estándar de la proporción obtiene su valor máximo en $P=0,5$. Por lo tanto, en este valor es necesario aumentar el tamaño de muestra para asegurar la precisión definida. A partir de $P=0,5$, a derecha e izquierda, los fenómenos son simétricos. Por ejemplo, bajo este paradigma, la precisión de una proporción $P=0,9$, es la misma que la de una proporción $P=0,1$; de la misma manera, la precisión de una proporción $P=0,7$, es la misma que la de una proporción $P=0,3$. Sin embargo, el coeficiente de variación no es una medida simétrica alrededor de $P=0,5$, como sí lo es la varianza y el error estándar y, por su definición, cuando la proporción es pequeña, el coeficiente de variación tiende a ser muy grande, indicando erróneamente que la precisión es baja. 


### Coeficiente de variación logarítmico 

El coeficiente de variación es una medida que define la precisión de un indicador, pero para el caso de las proporciones no constituye una medida simétrica, como sí lo es el error estándar o la varianza. Por ejemplo, suponga que se está estimando una proporción $P$, si la estimación del parámetro de interés es muy cercana a cero, sin importar que tan pequeña sea su varianza, el coeficiente de variación será muy grande y no representará la calidad de la estrategia de muestreo. Sin embargo, el coeficiente de variación del complemento de la proporción $(1-P)$ será muy pequeño y confiable. Esto se traduce en una paradoja, puesto que el mismo fenómeno está siendo medido, pero los coeficiente de variación son contradictorios. Debido a lo anterior, las estimaciones que tienen una magnitud pequeña (muy cercana a cero) son automáticamente castigadas por este indicador, incluso si la variabilidad de la cifra es pequeña.

Algunos autores han propuesto la posibilidad de realizar una transformación logarítmica sobre la proporción y utilizar su coeficiente de variación como una medida robusta del error de muestreo en las proporciones cercanas a cero y a uno, que además sea simétrica al rededor de $P=0,5$, que es donde se maximiza la variabilidad de la proporción [@Barnett_Walker_Chromy_Davis_Emrich_Odom_Packer_2003]. Por ende, si $P\leq 0,5$, se define $\hat L = -\log( \hat P)$. En este caso, la aproximación de Taylor de primer orden es:


$$
\hat{L} \cong L + \frac{\partial \hat{L}}{\partial \hat{P}}\biggr\rvert_{\hat{P}=P} (\hat{P}-P) = L + \left(\frac{-1}{P}\right)(\hat{P}-P)
$$

Luego, la varianza de $\hat{L}$ será $Var(\hat{L})\cong AV(\hat{L}) = \dfrac{Var(\hat{P})}{P^2}$, y por consiguiente el error estándar de la transformación equivaldrá al coeficiente de variación de la proporción, dado por:

$$
SE(\hat{L}) = \sqrt{AVar(\hat{L})} = \dfrac{\sqrt{Var(\hat{P})}}{\hat{P}} = CV(\hat{P}) 
$$

De esta manera, podemos definir una medida de suavizamiento como el coeficiente de variación asociado a la transformación:

$$
CV(\hat{L}) = \dfrac{SE(\hat{L})}{\hat{L}} = \dfrac{CV(\hat{P})}{\hat{L}}
$$

De manera similar, para mantener la simetría, cuando $P>0,5$ se realiza un ajuste definiendo $\hat{L} = -\log(1-\hat{P})$. Por lo tanto, para proporciones centrales, los coeficientes de variación de $\hat{P}$ y $\hat{L}$ serán comparables, puesto que $\hat{L}$ toma valores cercanos a uno cuando $P \in (0,2\ \ ,\ \ 0,8)$, y en este caso el $CV(\hat{L})$ será similar a $CV(\hat{P})$.


![(\#fig:fig1fig)Relación entre el tamaño de muestra y la precisión de un indicador utilizando la transformación Logit.](19Calidad_files/figure-latex/fig1fig-1.pdf) 

La figura \@ref(fig:fig1fig) muestra que, al igual que con el coeficiente de variación original, el tamaño de muestra aumentará a medida que se requiera mayor precisión en la estimación; pero a diferencia del coeficiente de variación original, el tamaño de muestra será idéntico para los fenómenos que induzcan proporciones simétricas. Además, el tamaño de muestra necesario para estimar eficientemente una proporción $P\leq 0.5$ con una precisión mayor a un determinado umbral del coeficiente de variación $CVE$ es:  

$$
n \geq \dfrac{P \ (1-P) \  DEFF}{\frac{P \  (1-P) \ DEFF}{N}+\log^2\ (P) \ P^2 \ CVE^2}
$$

La expresión anterior se obtiene teniendo en cuenta el siguiente desarrollo algebraico. En particular, cuando $P > 0,5$, se desea que el coeficiente de variación logarítmico sea menor a un umbral $\delta$ y, por lo tanto, habiendo definido $S^2 = P\ (1-P) \  DEFF$, se tiene la siguiente implicación.

$$
CV(\hat{L}) \leq \delta 
\Longrightarrow
n \geq \frac{S^2}{\ \delta^2(1-\hat{P})^2\log^2(1-\hat{P}) +\frac{S^2}{N}}
$$

Análogamente, cuando $P \leq 0.5$, se tiene que

$$
CV(\hat{L}) \leq \delta
\Longrightarrow
n \geq \dfrac{S^2}{\frac{S^2}{N}+\log^2(\hat{P})\hat{P}^2\delta^2}
$$

### El efecto de diseño DEFF 

Cuando se selecciona una muestra utilizando un diseño de muestreo complejo es muy improbable que exista independencia entre las observaciones. Además, como el muestreo de las encuestas de hogares es complejo, la distribución de la variable de interés no es la misma para todos los individuos. Por lo anterior, cuando se analizan datos que provienen de encuestas de hogares la inferencia correcta debe tener en cuenta estas grandes desviaciones con respecto al análisis estadístico clásico, que considera muestras aleatorias simples. Por ello, en la mayoría de ocasiones se necesita aumentar el tamaño de muestra para obtener la precisión deseada.  

@Lumley_2010 afirma que el efecto del diseño compara la varianza de una media o total con la varianza de un estudio del mismo tamaño utilizando un muestreo aleatorio simple sin reemplazo y que su cálculo será incorrecto si los pesos de muestreo se han re-escalado o no son recíprocos a las probabilidades de inclusión. Además, en `R` se compara la varianza de la estimación con la varianza de una estimación basada en una muestra aleatoria simple del mismo tamaño que el de la subpoblación. Entonces, por ejemplo, en el muestreo aleatorio estratificado, el efecto de diseño calculado en un estrato será igual a uno.

### Tamaño de muestra 

El tamaño de muestra afecta de manera indirecta la amplitud del intervalo de confianza, a través del error estándar, que generalmente decrece a medida que el tamaño de muestra se hace más grande. Un adecuado tamaño de muestra garantiza la convergencia en distribución de los estimadores a la distribución teórica de donde se calculan los percentiles en el cálculo del intervalo de confianza. En la fase de diseño, es posible mostrar que el tamaño de muestra requerido para estimar el promedio de una variable de interés en una encuesta de hogares, con un error de muestreo relativo menor a $\delta \in (0,1)$ y una confianza estadística mayor a $1-\alpha$, está dado por la siguiente expresión.

$$ 
n \geq \dfrac{S^2_{y}\ DEFF}{\dfrac{\delta^2 \  \bar{y}^2}{z_{1-\alpha/2}^2}+\dfrac{S^2_{y}\ DEFF}{N}}
$$

En donde $z_{1-\alpha/2}$ es el percentil ($1- \alpha/2$) asociado a una distribución normal estándar. Por ejemplo, en un diseño de muestreo en varias etapas, si el valor del coeficiente de correlación intraclase es grande, entonces el valor del efecto de diseño DEFF también lo será y por consiguiente el tamaño de muestra deberá ser más grande. Por ejemplo, al medir ingresos en la región, debido a la realidad económica de los países, es común encontrar que las condiciones de la vivienda está altamente asociado con el ingreso de los individuos. Esto quiere decir que los ingresos no están uniformemente dispersos a través de todos los hogares, y por ende el coeficiente de correlación intraclase será alto. Por otro lado, si lo que se quiere estimar es una proporción $P$, entonces la expresión apropiada para calcular el tamaño de muestra estará dada por

$$ 
n \geq \dfrac{P\ (1-P)\ DEFF}{\dfrac{\delta^2}{z_{1-\alpha/2}^2 }+\dfrac{P\ (1-P) \ DEFF}{N}}
$$ 

Como se puede apreciar, el tamaño de muestra es un indicador de la calidad de la encuesta, el cual resulta ser muy importante en la etapa de planeación y diseño. Sin embargo se tiene que considerar que:

- Si el parámetro de interés **sí** fue tenido en cuenta en la planeación de la encuesta con el propósito de tener representatividad sobre una subpoblación, entonces el tamaño de muestra será apropiado y, por ende, el error de muestreo estará controlado, al igual que el coeficiente de variación, el intervalo de confianza y la precisión de la inferencia será óptima.
- Si el parámetro de interés **sí** fue tenido en cuenta en la planeación de la encuesta, pero hubo una alta tasa de no respuesta, entonces el tamaño de muestra será mucho menor al planeado inicialmente y, por ende, el error de muestreo será más alto, al igual que el coeficiente de variación, y el intervalo de confianza será muy ancho, haciendo que la precisión de la inferencia no sea apropiada. 
- Si el parámetro de interés **no** fue contemplado en la planeación y diseño de la encuesta de hogares, entonces es posible que el tamaño de muestra sea menor al necesario y, por ende, el error de muestreo será mayor, junto con el coeficiente de variación; por ende, el intervalo de confianza será más amplio y la precisión de la inferencia será deficiente.


### Tamaño de muestra efectivo 

El principio general detrás de esta medida está supeditado a que en la inferencia propia de las encuestas de hogares con diseños de muestreo complejos no existe una sucesión de variables que sean independientes e idénticamente distribuidas. Por lo tanto, si se piensa en la muestra $(y_1, \ldots, y_n)$ como un vector en el espacio $n$-dimensional, el estándar clásico de la teoría estadística asumiría que cada componente del vector puede variar por sí mismo. Sin embargo, debido a la forma jerárquica de la selección de los hogares y a la interrelación de la variable de interés con las UPM, la variabilidad de la inferencia en las encuestas complejas tiene un fuerte componente asociados al mismo conglomerado, por lo que la dimensión final del vector $(y_1, \ldots, y_n)$ es mucho menor que $n$. De esta forma, se ha definido el tamaño de muestra efectivo [@United_Nations_2005, capítulo 6] como sigue
$$
n_{eff} = \frac{n}{DEFF}
$$

En resumen, el diseño clásico de las encuestas de hogares consiste en seleccionar un conjunto de hogares dentro de una misma UPM y repetir esta estrategia de selección sistemáticamente en todo el país. Por lo tanto, se puede pensar en que, si la variable de interés tiene una alta correlación intraclase, entonces la realidad de las personas y de los hogares dentro de una misma UPM será muy homogénea, tanto que se podría interpretar como que la información estuviese repetida, y que los individuos u hogares de una misma UPM no estuvieran aportando de manera diferenciada. Por lo tanto, debido a los efectos del diseño de muestreo complejo, la cantidad de individuos que están aportando a la inferencia del indicador no es el número de personas, ni el número de hogares en la muestra, sino el tamaño de muestra efectivo $n_{eff}$, que deflacta los efectos de aglomeración. 

### Grados de libertad 

La amplitud del intervalo de confianza de un indicador no sólo está supeditada al error estándar, sino también al percentil de la distribución $t-student$ con sus correspondientes grados de libertad. De esta manera, entre más grados de libertad se consideren, menor será la amplitud del intervalo y mayor será la precisión de la inferencia. En el caso más general en donde la subpoblación sea toda la población objetivo, los grados de libertad se reducen a la siguiente expresión:

$$
gl = \# UPM - \# Estratos
$$

Los grados de libertad constituyen una medida de cuántas unidades independientes de información se tienen en la inferencia. Nótese que, en el caso extremo de realizar un censo en cada UPM, sin importar el número de individuos que componen el conglomerado, el número de unidades independientes será únicamente el número de UPM seleccionadas en la primera etapa de muestreo puesto que la UPM es la unidad de muestreo que contribuye en mayor medida a la variabilidad de las estimaciones. En las aplicaciones reales de encuestas de hogares, en donde se realiza un submuestreo dentro de la UPM, la variabilidad de la estimación puede verse como la contribución del conglomerado a la gran media, más una contribución (considerada insignificante) de la segunda etapa de muestreo. Nótese la importancia de utilizar la distribución $t-student$ como base inferencial para la construcción de los intervalos de confianza. Recuérdese además que el percentil 0.975 para la distribución $t-student$ varía con respecto a sus grados de libertad.

A nivel desagregado, los grados de libertad son determinantes a la hora de hacer inferencias dentro de subpoblaciones de interés. En este caso los grados de libertad no se consideran fijos sino variables. @Korn_Graubard_1999[p. 209] proponen el siguiente método de cálculo sobre los grados de libertad en una subpoblación $U_g$:

$$
gl_{g} = \sum_{h=1}^H v_h*(n_{Ih}^g - 1)
$$

En donde $v_h$ es una variable indicadora que toma el valor uno si el estrato $h$ contiene uno o mas casos de la subpoblación de interés y toma el valor cero en otro caso, $n_{Ih}^g$ es el número de unidades primarias de muestreo en el estrato $h$ $(h=1, \ldots, H)$ con uno o más casos de la subpoblación.



### Conteo de casos no ponderado 

El número de casos no ponderados en una muestra es simplemente el conteo de los individuos dentro de la muestra que son afectados por un fenómeno de interés en estudio. Esta cifra está supeditada únicamente a razones y proporciones y tiene un efecto indirecto en la determinación de la precisión del estimador de interés y está determinada por la siguiente expresión.

$$
n_y = \sum_{s}\delta_{k}^y
$$

En donde $\delta_{k}^y$ es una variable indicadora sobre cada individuo $k$ de la muestra $s$ que toma el valor de uno si el individuo está afectado por el fenómeno inducido por la variable de interés $y$. Nótese que esta es una cantidad aleatoria por definición, y también puede ser calculada en la muestra de un subgrupo poblacional específico $U_g$, de la siguiente manera:

$$
n_y^g = \sum_{s}z_{g_k}\delta_{k}^y = \sum_{s_g}\delta_{k}^y
$$

Si la incidencia del fenómeno es muy baja (cuando la proporción $P$ es cercana a cero), tanto el coeficiente de variación original y su transformación logarítmica tendrán magnitudes altas, puesto que:

$$
\lim_{n_y \rightarrow 0} CV(\hat \theta) = 
\lim_{n_y \rightarrow 0} CV(\hat L) = \infty
$$

En muchos países las encuestas de hogares son usadas por las autoridades gubernamentales para asignar recursos a una población potencial. En estos casos, es de particular interés conocer el número de personas que serán susceptible de participar en la repartición de recursos. Por ende, si la estimación de la incidencia total del fenómeno en la población no es precisa, difícilmente se podrá establecer un rubro presupuestal para atender a esta población. Por ejemplo, si la estimación del total de personas afectadas por el fenómeno es del orden de 5% y su margen de error es 5%, entonces el coeficiente de variación será de 100% y el intervalo de confianza de la proporción será $(0 \%, 10 \%)$, demasiado amplio para tomar algún tipo de decisión sobre los recursos públicos de un país. Nótese que esta amplitud se magnifica cuando el número de casos no ponderado no es suficiente. 

## Criterios de calidad en subpoblaciones

En esta sección se abordan temáticas referentes al procesamiento apropiado de los indicadores de interés en las subpoblaciones y, habiendo realizado las estimaciones y calculado sus respectivos criterios de calidad, se plantea la utilización de umbrales apropiados para la supresión, revisión o publicación de cifras.

El análisis apropiado de las estadísticas generadas a partir de las encuestas de hogares debe pasar por una definición clara tanto de las subpoblaciones sobre las cuales se quiere realizar la inferencia, como de las variables que generan el indicador de interés. De hecho, como se mostrará más adelante, algunas variables pueden definir una subpoblación y, por ende, es posible que se dé lugar a confusiones. Para aclarar esto, se proponen a continuación algunos ejemplos que permiten dilucidar el cálculo de las medidas de calidad sobre un conjunto no exhaustivo de indicadores de interés.

**Promedio del ingreso per cápita en el país**

En este caso la variable de interés es una característica continua $y_k \geq 0 \ \ \ (\forall k \in U)$ definida sobre toda la población del país, mientras que el indicador se escribe como una razón.

$$
\hat {\bar y}_{nacional} = \frac{\hat t_y}{\hat N} =\frac{\sum_h\sum_i\sum_k w_ky_{k}}{\sum_h\sum_i\sum_k w_k}
$$

En donde los subíndices $h$, $i$ y $k$, se refieren a los estratos, las UPM y los individuos, respectivamente. Nótese que la variable que define la población es siempre determinista puesto que $z_{g_k} = 1$ para todos los individuos que residen en el país, es decir para todos lo individuos de la muestra. En este caso se tiene que los grados de libertad corresponden a todas las UPM menos todos los estratos de la encuesta en el país.

**Promedio del ingreso per cápita en una ciudad**

En este caso la variable de interés está definida sobre un subgrupo poblacional $U_g$, correspondiente a la ciudad de interés. El estimador del indicador se escribe como una razón.

$$
\hat {\bar y}_{ciudad}= \frac{\hat t_{y_g}}{\hat N_g} =\frac{\sum_h\sum_i\sum_k w_kz_{g_k}y_{k}}{\sum_h\sum_i\sum_k w_kz_{g_k}}
$$

Nótese que la variable que define la subpoblación es dicotómica dada por

$$ 
z_{g_k}=
\begin{cases}
1, \ \text{Si $k$ reside en la ciudad $U_g$} \\
0, \ \text{en otro caso}
\end{cases}
$$

En este caso el tamaño de muestra es $n_g = \sum_s z_{g_k}$, es decir el tamaño de muestra de la ciudad; los grados de libertad corresponden a todas las UPM  en la ciudad menos todos los estratos en la ciudad.

**Proporción de personas pobres en el área urbana**

En este ejemplo, el estimador del indicador se escribe como una razón sobre el área urbana $U_g$.

$$
\hat{P}_{urbano} = \frac{\hat t_{y_g}}{\hat N_g} =\frac{\sum_h\sum_i\sum_k w_kz_{g_k}y_{k}}{\sum_h\sum_i\sum_k w_kz_{g_k}}
$$

En donde $y_{k}$ es la variable de interés que define una característica dicotómica de la siguiente manera
$$
y_k=
\begin{cases}
1, &\text{si el ingreso per cápita de la persona está por debajo de la línea de pobreza}\\
0, &\text{en otro caso.}
\end{cases}
$$

Las mediciones se realizan sobre la subpoblación definida por la siguiente variable

$$
z_{g_k}=
\begin{cases}
1, &\text{si la persona reside en el área urbana $U_g$}\\
0, &\text{en otro caso.}
\end{cases}
$$


En este caso el tamaño de muestra es $n_g = \sum_s z_{g_k}$, es decir el tamaño de muestra del área urbana; los grados de libertad corresponden a todas las UPM del área urbana menos todos los estratos del área urbana.

**Tasa de desocupación nacional**

Este indicador está definido como la división entre el total de personas desocupadas sobre el total de personas activas en la fuerza de trabajo. El estimador del indicador está definido como una razón de dos estimadores de totales poblacionales:

$$
\widehat{TD}_{nacional} =  \frac{\hat t_y}{\hat t_z} =\frac{\sum_h\sum_i\sum_k w_kz_{k}y_{k}}{\sum_h\sum_i\sum_k w_kz_{k}}
$$

En donde la variables de interés toman la siguiente forma
$$
y_{k}=
\begin{cases}
1, &\text{si el individuo es desocupado,}\\
0, &\text{si el individuo no es desocupado,}\\
NA, &\text{si no está en edad de trabajar.}
\end{cases}
$$

Y la variable que define la subpoblación es 
$$
z_{k}=
\begin{cases}
1, &\text{si el individuo es activo,}\\
0, &\text{si el individuo es inactivo,}\\
NA, &\text{si el individuo no está en edad de trabajar.}
\end{cases}
$$

En este caso el tamaño de muestra es $n = \sum_s z_{k}$, es decir el número de personas en la muestra que están en edad de trabajar y son activas. Los grados de libertad corresponden a todas las UPM menos todos los estratos de la encuesta en el país en los que se encontraron hogares con individuos en edad de trabajar y activas. Nótese que estos son los mismos grados de libertad inducidos por la tasa de ocupación. Además, el conteo de casos no ponderado corresponde al número de individuos desocupados en la muestra.

**Tasa de desocupación masculina en migrantes**

Este indicador está definido como la división entre el total de hombres migrantes desocupados sobre el total de hombres migrantes activos. El estimador del indicador está definido como una razón de dos estimadores de totales poblacionales:

$$
\widehat{TD}_{hombre-migrante} =  \frac{\hat t_{y_g}}{\hat t_{z_g}} =\frac{\sum_h\sum_i\sum_k w_kz_{g_k}y_{k}}{\sum_h\sum_i\sum_k w_kz_{g_k}}
$$

En donde la variables de interés toman la siguiente forma
$$
y_{k}=
\begin{cases}
1, &\text{si el individuo es desocupado,}\\
0, &\text{si el individuo no es desocupado,}\\
NA, &\text{si no está en edad de trabajar.}
\end{cases}
$$

Y la variable que define la subpoblación es 
$$
z_{g_k}=
\begin{cases}
1, &\text{si el individuo es activo, hombre y migrante,}\\
0, &\text{si el individuo es inactivo, hombre y migrante}\\
NA, &\text{si el individuo no está en edad de trabajar, o es mujer o es no migrante.}
\end{cases}
$$

En este caso el tamaño de muestra es $n = \sum_s z_{g_k}$, es decir el número de personas en la muestra que están en edad de trabajar, son hombres migrantes y están activos. El conteo no ponderado de casos corresponde al número de individuos en la muestra que son hombres migrantes y están desocupados. Además, los grados de libertad corresponden a todas las UPM menos todos los estratos de la encuesta en el país en los que se encontraron hogares con hombres migrantes y activos en la fuerza de trabajo.

## Secuencia lógica para crear reglas de supresión 

En esta sección se ha querido enfatizar el hecho de que la precisión de una estimación recae directamente en los intervalos de confianza, los cuales pueden ser descompuestos en elementos fundamentales que permiten crear una secuencia lógica de revisión, publicación o supresión de cifras. Nótese que lo anterior se basa en que la longitud de los intervalos de confianza induce la seguridad de que un estimador es o no es preciso. Considere los siguientes ejemplos prácticos:

- La incidencia de la pobreza en un departamento de un país se estimó en $5,2$%, con un intervalo de confianza de ($5,15$%, $5,25$%). 
- La tasa de desocupación en el país para los hombres se ubicó en $7,5$%, con un intervalo de confianza de ($7,1$%, $7,9$%); mientras que para las mujeres se ubicó en $9,2$%, con intervalo de confianza de ($8,8$%, $9,6$%). 
- La tasa de asistencia neta estudiantil en primaria para el último quintil de ingreso se estimó en $85$%, con un intervalo de confianza de ($48,2$%, $100,0$%). 

Claramente, en la última situación ejemplificada, el intervalo de confianza no brinda la precisión adecuada para que una Oficina Nacional de Estadística publique esta cifra confiadamente, o para que un gobierno pueda realizar algún tipo de política pública educativa, y mucho menos para estimar los recursos que una de intervención estatal sobre la población de interés. Como se ha descrito a lo largo de este documento, utilizar únicamente el coeficiente de variación como estándar para la supresión de cifras es un criterio que no tiene en cuenta toda las variantes asociadas a la inferencia en un muestreo complejo. A continuación se incorporan algunas recomendaciones internacionales que incorporan otros criterios adicionales a este.

- **Coeficiente de variación**: @CepalSAe2018 realizó una revisión de las experiencias internacionales, con base en la información publicada en las páginas web de los INE, para determinar cómo son usados los criterios de supresión de información y los umbrales que las oficinas nacionales de estadística definen para la validación de las cifras. Para encuestas de hogares, se encontró que Estados Unidos y los países del Mercosur utilizan un umbral de $CV > 30\%$, Canadá y México usan como referencia un umbral del $CV > 25\%$, Chile y Costa Rica utilizan un umbral del $CV > 20\%$, Ecuador y Perú utilizan un umbral del $CV > 15\%$, mientras que Colombia usa un umbral del $CV > 10\%$. De esta forma, cualquier cifra estimada cuyo coeficiente de variación sea mayor al umbral predefinido es suprimida o marcada como una cifra poco confiable. 
- **Tamaño de muestra**: este criterio debe ser considerado como uno de los más importantes a la hora de decidir la ruta de publicación de una cifra, puesto que los desarrollos teóricos en términos de inferencia estadística para encuestas dependen de este término. La cobertura de los intervalos de confianza y la distribución de los estimadores dependen de qué tanto el tamaño de la subpoblación como su tamaño de muestra asociado no sean pequeños. En este espíritu, @Barnett_Walker_Chromy_Davis_Emrich_Odom_Packer_2003 proponen que todas las estimaciones basadas en un tamaño de muestra menor a 100 unidades deberían ser suprimidas o marcadas como no confiables.
- **Tamaño de muestra efectivo**: al igual que con el anterior criterio, el tamaño de muestra efectivo induce que las aproximaciones teóricas, en términos de convergencia de las distribuciones de los estimadores y la cobertura de los intervalos de confianza, se cumplan.  @Hornik_Maklan_Cadell_Prado_Barmada_Jacobsohn_Orwin_Sridharan_Zador_Southwell_etal consideran que si el tamaño de muestra efectivo no es mayor a 140, entonces la cifra no debería ser considerada para publicación. Por otro lado, teniendo en cuenta el tamaño de muestra inducido por la transformación logarítmica, @Barnett_Walker_Chromy_Davis_Emrich_Odom_Packer_2003 afirman que cuando la proporción se encuentra entre $0.05$ y $0.95$, entonces el tamaño de muestra efectivo es máximo cuando $P = 0,5$, siendo su valor $n_{eff} = 68$. 
- **Conteo de casos no ponderado**: cuando la incidencia de un fenómeno es muy baja y el diseño de la encuesta no lo tuvo en cuenta, entonces es posible que las estimaciones asociadas a tamaños, totales y proporciones sobre este fenómeno no sean confiables. En particular, para las proporciones es posible restringir las estimaciones tales que $\hat P <0,001$, pero es más expedito crear una regla a partir del conteo de casos en la muestra. Por ejemplo, @AmericanCommunitySurvey plantea que si el número de casos no ponderados es menor a 50 unidades entonces la estimación no es publicada.
- **Grados de libertad**: este criterio apunta a aislar el efecto inflacionario del tamaño de muestra en una encuesta compleja y plantea una aproximación al número de unidades independientes en la inferencia. Además, a medida que crece, la amplitud del intervalo de confianza se estabiliza. @Parker_Talih_Malec_2017 consideran que si los grados de libertad inducidos por la subpoblación son menos de ocho, la cifra debería ser suprimida. 
- **Coeficiente de variación logarítmico**: Esta medida de suavizamiento toma valores altos cuando las proporciones estimadas están demasiado cercanas a cero o a uno. @Barnett_Walker_Chromy_Davis_Emrich_Odom_Packer_2003 proponen que la cifra debe ser suprimida si el coeficiente de variación logarítmico es mayor que 17.5%.

Nótese que los criterios mencionados en este documento no deberían ser aplicados de manera independiente, sino que tendrían que seguir cierta lógica, puesto que es posible, por ejemplo para una variable con poca homogeneidad en las UPM, que con un tamaño de muestra de $n=90$, se haya estimado un efecto de diseño de $DEFF=0,5$, lo cual implicaría un tamaño de muestra efectivo de  $n_{eff}=180$. En este caso, si los criterios de supresión se aplicaran de manera independiente, se concluiría que la cifra debería ser suprimida por tener un tamaño de muestra insuficiente, pero a la vez, que la cifra debería ser publicada, por tener un tamaño de muestra efectivo suficiente. Lo anterior, podría llevar a contradicciones por parte de los INE y malas interpretaciones por parte los usuarios finales de los datos.

De manera general, se recomienda que los INE estudien a profundidad sus políticas de supresión, revisión y publicación de cifras en cada una de las encuestas que realiza y, de manera independiente, defina las reglas apropiadas para cada caso y que los criterios de supresión sean plasmados en forma de diagrama de flujo en la documentación de las encuestas. Además, cada encuesta debería considerar un algoritmo de forma particular; es decir, los criterios de supresión no necesariamente deben coincidir para cada operación estadística, aunque sí debiesen acogerse unos mínimos en cada ONE para garantizar la calidad de la estimaciones publicadas provenientes de las encuestas de hogares. 

Teniendo en cuenta las particularidades de la región, en este documento se recomienda mantener un umbral del coeficiente de variación $CV > 20\%$ y del coeficiente de variación logarítmico $CV(\hat{L}) > 17.5%$ como generadores de alertas sobre la calidad de la estimación; además se recomienda tener mínimo 14 grados de libertad, los cuales implican al menos 15 UPM que inducirían una convergencia en la distribución del estimador [@Gutierrez_2016, figura 8.1]. A partir de esta cifra es posible continuar el análisis de las recomendaciones con las particularidades de cada encuesta en cada país. Por ejemplo, # si se espera un mínimo de 15 UPM, y en cada una se seleccionan 12 hogares, entonces la muestra esperada es de 180 hogares, y tomando una tasa de efectividad del 85%, esta se reduce a $n < 153$ como generados de alertas. Asimismo, tomando en cuenta un efecto de diseño promedio de 2.5 (calculado según el indicador de interés), se obtendría un tamaño de muestra efectivo de $n_{eff} = 61$ como generador de alertas. Asimismo, se recomienda mantener el conteo de casos no ponderado en $n_y < 40$ e inmediatamente generar una alerta sobre todas las cifras que reporten un efecto de diseño $DEFF < 1$. 

Por ejemplo, la figura \@ref(fig:figCSj1) muestra una propuesta preliminar, para la estimación de proporciones o razones, en cuanto a los criterios de supresión de cifras. En una primera instancia se realiza la estimación clásica de los parámetros de interés y se genera una tabla que adjunte el cálculo de todos los criterios descritos anteriormente. Luego, dependiendo de la naturaleza del fenómeno investigado, se deben establecer los criterios que se van a tener en cuenta y los umbrales en cada caso. El próximo paso es decidir, para cada cifra de la tabla generada, si se va a publicar o suprimir, y en algunos casos si se revisará la cifra con mayor detenimiento. Por ejemplo, en el diagrama propuesto se definen seis criterios como condiciones necesarias para la publicación inmediata de una cifra; los primeros cuatro, son condiciones necesarias para la revisión temática. Si alguno de los primeros cuatro criterios no se satisface, entonces la cifra es suprimida. 

\begin{figure}
\includegraphics[width=0.5\linewidth]{Pics/CSj1} \caption{Ejemplo de un diagrama de flujo para la publicación, supresión y revisión de estimaciones de proporciones o razones en encuestas de hogares.}(\#fig:figCSj1)
\end{figure}

