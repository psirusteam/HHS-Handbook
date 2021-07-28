# (PART) Procesamiento transversal de las encuestas de hogares {-}

# Estimación de parámetros


## Estimadores puntuales

La mayoría de indicadores sociales a nivel nacional pueden verse como funciones de totales de una o más variables de interés. Por ejemplo, si el interés está en estimar un total $t_y=\sum_U y_k$, el estimador de expansión provee una metodología que induce insesgamiento.

$$
\hat{t}_y = \sum_s w_k y_k
$$

En donde la muestra $s$ hace referencia al subconjunto de la población que fue seleccionado siguiendo un diseño de muestreo probabilístico que induce los pesos de muestreo $w_k$ que expanden el valor de la variable de interés $y_k$ para el $k$-ésimo individuo. Nótese que $w_k$ es función de la probabilidad de inclusión de $k$-ésimo individuo en la muestra $\pi_k=Pr(k\in s)$. En presencia de esquemas de estratificación y selección de conglomerados y varias etapas, esta probabilidad resulta ser el producto de las probabilidades condicionales que surgen en los subsecuentes procesos de selección probabilística. Por tanto, el peso final de muestreo resulta ser por lo general una multiplicación de factores de expansión en cada etapa del esquema de muestreo. 

Por ejemplo, si el diseño de la encuesta es estratificado por regiones $h$ (agrupaciones de municipios), con tres etapas de selección dentro de cada estrato (la primera etapa con selección de municipios $i$ dentro del estrato, la segunda con selección de segmentos cartográficos $j$ y la última con selección de hogares $k$), entonces el peso de muestreo final y el estimador del total estará dado por la siguiente expresión

$$
\hat{t}_y = \sum_s w_j y_k = \sum_h \sum_{i \in s_h} \sum_{j \in s_{hi}} \sum_{k \in s_{hij}} w_{hijk} y_{hijk}
$$

En presencia de información auxiliar es posible mejorar la eficiencia de la estimación acudiendo a diferentes formas funcionales que estiman el total, por ejemplo, con el estimador de Hájek:

$$
\hat{t}_y = t_x \frac{\sum_s w_k y_k}{\sum_s w_k x_k}
$$

En donde $t_x$ denota el total poblacional, que se supone conocido para toda la población, de una variable auxiliar $x$ que es preguntada en la encuesta de hogares. Por supuesto, en el análisis de este tipo de encuestas es común realizar inferencias sobre parámetros que tienen una forma no lineal. Uno de los más básicos es la razón poblacional $R_U = t_{y_1} / t_{y_2}$ cuya estimación se lleva a cabo estimando ambos componentes de la fracción 

$$
\hat{R}= \frac{\hat{t}_{y_1}}{\hat{t}_{y_2}}
= \frac{\sum_s w_k y_{1k}} {\sum_s w_k y_{2k}}
$$

La estimación de un promedio poblacional $\bar{y}_U = t_y / N$, se lleva a cabo de forma eficiente estimando el tamaño de la población y se puede ver como un caso particular de la estimación de una razón

$$
\hat{\bar{y}}_s= \frac{\hat{t}_y}{\hat{N}} 
= \frac{\sum_s w_k y_k}{\sum_s w_k}
$$

Las encuestas de hogares con diseños panel o rotativos, tienen un mayor interés en la estimación del cambio de indicadores en dos periodos tiempo $\Delta = t_y^{(t)} - t_y^{(t-1)}$. Nótese que un estimador de este parámetro está dado por

$$
\hat{\Delta} = \hat{t}_{y^{(t)}} - \hat{t}_{y^{(t-1)}}
$$

Además, es posible mejorar la estimación del total actual $t_y^{(t)}$ al tener en cuenta la información inducida por el traslape de la encuesta en el segundo periodo, así:

$$
\tilde{t}_{y^{(t)}} = \alpha \hat{t}_{y^{(t)}} 
+ (1 -\alpha) (\tilde{t}_{y^{(t-1)}} - \hat{\Delta})
$$

En donde $0 < \alpha < 1$. Por otro lado, si el interés está en estimar algunas características asociadas con la pobreza, es posible utilizar estimadores más complejos. Siendo $y_k$ el ingreso del individuo $k$ y $l$ el umbral de pobreza, entonces el siguiente estimador puede ser utilizado 

$$
\hat{F}_{\alpha}=\frac{1}{N}\sum_{k\in s} w_k 
\left(\frac{l-y_k}{l}\right)^{\alpha}I(y_k<l)
$$

En donde $I(y_k<l)$ es una variable indicadora que toma el valor uno si $y_k<l$ o cero, en cualquier otro caso. Note que si $\alpha = 0$, se tiene una estimación de la incidencia de la pobreza y si $\alpha = 1$, se obtiene un estimación de la brecha de la pobreza [@Foster_Greer_Thorbecke_1984].

La selección del estimador está altamente relacionada con el diseño de la encuesta. Por ejemplo, si se pretende estimar un indicador para un periodo de tiempo definido, el diseño de la encuesta no debería inducir un esquema de rotación que tenga traslape de hogares, puesto que la correlación del indicador induciría un aumento de su varianza y por ende pérdida de eficiencia. Sin embargo, si se desea estimar el cambio del indicador entre dos periodos de tiempos, es necesario contar con un esquema de rotación que asegure un tamaño de muestra suficiente para estimar con precisión este cambio. @Cochran_1977[sección 12.13] afirma que, cuando el interés se centra tanto en la estimación del indicador en el periodo actual como en la estimación del cambio entre periodos, es recomendable tener una tasa de traslape de 2/3, 3/4 o 4/5 de una ronda a otra.

## Estimación de las varianzas y del efecto de diseño (DEFF)

Denotando como $y_k$ al resultado de la observación de la variable de interés (pobreza) en el individuo $k$, la estimación de la proporción de personas en condición de pobreza a nivel nacional está dada por la siguiente expresión:
$$ 
\hat \theta =\frac{\sum_h\sum_i\sum_{k \in s} w_{k}\ y_{k}}{\sum_h\sum_i\sum_{k \in s} w_k} =
\frac{\hat t_{y}}{\hat N}
$$

Nótese que las tres sumatorias corresponden a los estratos de muestreo ($h=1\ldots, H$), las unidades primarias de muestreo ($i= 1, \ldots, n_{Ih}$) y los individuos ($k= 1, \ldots, n_i$). Este estimador corresponde a una razón, puesto que, tanto el numerador como el denominador son aleatorios, y el ponderador $w_k$ corresponde al peso de muestreo óptimo. La estimación para la proporción en subgrupo de interés $U_d$ es:

$$
\hat \theta_d = 
\frac{\sum_h\sum_i\sum_{k \in s_d} w_k\ y_{k}}
{\sum_h\sum_i\sum_{k \in s_d} w_k}
=
\frac{\hat t_{y_d}}{\hat N_d}
$$

En donde $s_d$ hace referencia a la muestra observada en el dominio. El efecto de diseño fue definido por @Kish_1965[página 258] como *la relación entre la varianza real de una muestra y la varianza real de una muestra aleatoria simple del mismo número de elementos* y toma la siguiente expresión

$$
DEFF = \frac{Var(\hat{\theta})}{Var_{MAS}(\hat{\theta})}
$$

En donde $Var(\hat{\theta})$ es la varianza del diseño de muestreo complejo con el estimador $\tilde{\theta}$, mientras que $Var_{MAS}(\hat{\theta})$ es el estimador de la varianza bajo un muestreo aleatorio simple sin reemplazo para el estimador $\tilde{\theta}$. En particular, bajo muestreo aleatorio simple, se tiene que

$$
{Var}_{MAS}(\hat{\theta}) = \frac{1}{n} \left(1-\frac{n}{N}\right)  S^2_U
$$

En donde $N$ es el número de elementos en la población,  $n$ es el tamaño de muestra efectivo y $S^2_U$ es la varianza poblacional de la variable de interés, dada por

$$
S^2_U = 
\frac{\sum_U{  ( y_k - \theta)^2}}{N-1}
$$

Nótese que ninguno de los componentes del efecto de diseño se conoce y por ende deben ser estimados. Un estimador aproximadamente insesgado de esta varianza $S^2_U$ es la varianza muestral ponderada, la cual está dada por la siguiente expresión:

$$
\hat{S}^2_U = \left(\frac{n}{n-1}\right)
\frac{\sum_s{ w_k ( y_k - \hat{\theta})^2}}{\sum_s{w_k} -1 }
$$

De esta forma, una estimación de la varianza ${Var}_{MAS}(\hat{\theta})$ bajo muestreo aleatorio simple está dada por la siguiente expresión:

$$
\widehat{Var}_{MAS}(\hat{\theta}) = \frac{1}{n} \left(1-\frac{n}{\hat N}\right)  \hat S^2_U
$$

En donde $\hat N = \sum_s w_k$. Por lo tanto, la estimación del efecto de diseño DEFF está dada por

$$
\widehat{DEFF} = \frac{\widehat{Var}(\hat\theta)}{\widehat{Var}_{MAS}(\hat{\theta})}
$$

La idea del efecto de diseño trata de evaluar el mismo estimador bajo diferentes escenarios de muestreo. Como el estimador que se está estudiando $\hat \theta$ viene ponderado por los factores de expansión de la encuesta, entonces lo más conveniente es utilizar el mismo rasero para evaluar ambas estrategias de muestreo. Es posible encontrar una discusión más profunda sobre el efecto de diseño en @Gambino_2009[sección 4.],  @Sarndal_Swensson_Wretman_2003[página 188] y @Gutierrez_Zhang_Montano_2016[página 101].

## Estimación estratificada

La estimación del efecto de diseño es un problema común cuando se trabaja con estimaciones desagregadas en subpoblaciones de interés. Cuando las subpoblaciones constituyen estratos (o agregaciones de estratos) planeados de antemano, para los cuales se conoce previamente su tamaño poblacional, el efecto de diseño toma laa siguiente forma:

$$
DEFF_h= \frac{Var_p (\hat\theta_h) }{Var_{MAS}^h(\hat\theta_h) }
$$

En donde $Var_{MAS}^h(\hat\theta_h)$ es la varianza restringida al estrato $h (h=1,\ldots, H)$, cuyo valor es el siguiente:
$$
Var_{MAS}^h(\hat\theta_h)=\frac{1}{n_h}\left(1-\frac{n_h}{N_h}\right)S_{y_h}^2
$$

Siendo $n_h$ el tamaño de la muestra en el estrato $h$, $N_h$ el tamaño poblacional del estrato $h$ y $S_{y_h}^2$ la varianza muestral de la variable de interés restringida al subgrupo $h$. Por otro lado, cuando la subpoblación de interés no es un estrato sino un subgrupo aleatorio, no planeado en el diseño de la encuesta, cuyo tamaño de muestra es aleatorio, entonces la estimación correcta del efecto de diseño es la siguiente:

$$
DEFF_U= \frac{Var_p (\hat\theta_h) }{Var_{MAS}^U(\hat\theta_h) }
$$

En donde $Var_{MAS}^U(\hat\theta_h)$ es la varianza poblacional del estimador de interés, cuyo valor es el siguiente:

$$
Var_{MAS}^U(\hat\theta_h)=\frac{1}{n}\left(1-\frac{n}{N}\right)S_{y_{hU}}^2
$$

En donde $S_{y_{hU}}^2$ es la varianza muestral de la variable de interés calculada en toda la población. Por lo tanto, en ambos casos el denominador cambia dependiendo de si el subgrupo es un estrato o no. Es por esta razón que en los softwares considerados (STATA y R) las cifras relacionadas con la estimación puntual, errores estándar, intervalos de confianza y coeficientes de variación coinciden plenamente.

Para solventar este inconveniente es posible utilizar la opción srssubpop, la cual calcula el DEFF usando una estimación de la varianza bajo muestreo aleatorio simple dentro de la subpoblación. Por defecto, el DEFF se calcula utilizando una estimación de la varianza bajo muestreo aleatorio simple en toda la población. Normalmente, se debería utilizar esta opción al calcular las estimaciones de subpoblación en estratos o en grupos de estratos [@STATA].

## Comparabilidad entre los softwares `R` y `STATA`

1. La forma en la que STATA calcula la estimación de la varianza por defecto está definida bajo un esquema de aproximación con reemplazo. Lo cual quiere decir que todas las expresiones de varianza omiten el factor de corrección para poblaciones finitas dado por $\left(1-\frac{n}{N}\right)$. Por ende, los resultados en poblaciones grandes, no diferirán significativamente; sin embargo, en las áreas pequeñas, los resultados pueden diferir de forma importante.

2. Por otro lado, el software Stata estima por defecto el $DEFF_U$. Nótese que, en este caso, las estimaciones de $Var_{MAS}^U(\hat\theta_h)$ y $Var_{MAS}^h(\hat\theta_h)$  serán diferentes, puesto que la primera involucra a toda la muestra, mientras que la segunda involucra únicamente a la muestra del estrato. Retomando el ejemplo, debido a que los subgrupos de interés son agregaciones de los estratos de diseño, no es correcto utilizar el enfoque que Stata trae por defecto y debe ser corregido mediante la incorporación de la sentencia `deff srssubpop`, tal como se ejemplifica más adelante. 

## Estimadores de calibración






