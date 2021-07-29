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

## Estimadores de calibración






