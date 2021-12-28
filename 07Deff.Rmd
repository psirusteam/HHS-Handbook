---
output:
  pdf_document: default
  html_document: default
---

# El efecto de diseño

Cuando se selecciona una muestra utilizando un diseño de muestreo complejo es muy improbable que exista independencia entre las observaciones. Además, como el muestreo de las encuestas de hogares es complejo, la distribución de la variable de interés no es la misma para todos los individuos. Por lo anterior, cuando se analizan datos que provienen de encuestas de hogares la inferencia correcta debe tener en cuenta estas grandes desviaciones con respecto al análisis estadístico clásico, que considera muestras aleatorias simples. Por ello, en la mayoría de ocasiones se necesita aumentar el tamaño de muestra para obtener la precisión deseada. 

El efecto de diseño fue definido por @Kish_1965[, página 258] como *la relación entre la varianza real de una muestra y la varianza real de una muestra aleatoria simple del mismo número de elementos* y toma la siguiente expresión:

$$
DEFF=\frac{Var(\hat{\theta})}{Var_{MAS}(\hat{\theta})}
$$

En donde $Var(\hat{\theta})$ denota la varianza de un estimador $\hat{\theta}$ bajo un diseño de muestreo complejo $p(s)$ y $Var_{MAS}(\hat{\theta})$ denota la varianza del este estimador $\hat{\theta}$ bajo un diseño de muestreo aleatorio simple $MAS$. Esta cifra da cuenta del efecto de aglomeración causado por la utilización de un diseño de muestreo complejo $(p)$, frente a un diseño de muestreo aleatorio simple $MAS$, en la inferencia de un parámetro de la población finita $\theta$ (que puede ser un total, un promedio, una proporción, una razón, un percentil, etc.). 

## Estimación del efecto de diseño

En la expresión de efecto de diseño se debe notar dos hechos importantes, en primer lugar, DEFF depende del diseño muestral $p(s)$, y en segundo lugar, depende del estimador del parámetro $\theta$. De esta forma, no es correcto describir al $DEFF$ únicamente como una medidad de eficiencia del diseño muestral, puesto que bajo un mismo diseño, este puede tomar diferentes valores según el parámetro que se quiera estimar.

Nótese que ninguno de los componentes del efecto de diseño se conoce y por ende deben ser estimados. En particular, un estimador aproximadamente insesgado de la varianza poblacional $S^2_{y_U}$ es la varianza muestral ponderada, la cual está dada por la siguiente expresión:

$$
\hat{S}^2_{y_U} = \left(\frac{n}{n-1}\right)
\frac{\sum_s{ w_k ( y_k - \hat{\theta})^2}}{\sum_s{w_k} -1 }
$$

De esta forma, en el caso en el que $\theta$ corresponda a un promedio poblacional, una estimación de la varianza ${Var}_{MAS}(\hat{\theta})$ bajo muestreo aleatorio simple está dada por la siguiente expresión:

$$
\widehat{Var}_{MAS}(\hat{\theta}) = \frac{1}{n} \left(1-\frac{n}{\hat N}\right)  \hat{S}^2_{y_U}
$$

En donde $\hat N = \sum_s w_k$. Por lo tanto, la estimación del efecto de diseño DEFF está dada por

$$
\widehat{DEFF} = \frac{\widehat{Var}(\hat\theta)}{\widehat{Var}_{MAS}(\hat{\theta})}
$$

La idea central del efecto de diseño recae en la evaluación del mismo estimador bajo diferentes escenarios de muestreo. Como el estimador que se está estudiando $\hat \theta$ viene ponderado por los factores de expansión de la encuesta, entonces lo más conveniente es utilizar el mismo rasero para evaluar ambas estrategias de muestreo. Es posible encontrar una discusión más profunda sobre el efecto de diseño en @Gambino_2009[, sección 4.],  @Sarndal_Swensson_Wretman_2003[, página 188] y @Gutierrez_Zhang_Montano_2016[, página 101].

## Descomposición del efecto de diseño en las encuestas de hogares

@Park_2003 propone que el efecto de diseño de cualquier encuesta se puede descomponerse en tres partes que se relacionan entre sí de forma multiplicativa. En primer lugar está el efecto debido a la ponderación desigual, $DEFF^W$; en segundo lugar se encuentra el efecto debido a la estratificación, $DEFF^S$; y por último se tiene el efecto debido al muestreo en varias etapas, $DEFF^C$. Por lo tanto:

$$
DEFF = DEFF^W \times DEFF^S \times DEFF^C
$$

La primera componente $DEFF^W$ del efecto de diseño general tiende a aumentar ligeramente la variación de las estrategias de muestreo. @Valliant_Dever_Kreuter_2018 afirman que esta componente puede ser estimada por medio de la siguiente expresión:

$$
DEFF^W = 1 + cv^2(w_k)
$$

En donde $cv(w_k)$ representa el coeficiente de variación de los pesos de muestreo $w_k$ de las unidades en la encuesta. Si los pesos de muestreo son uniformes, entonces no habrá un incremento significativo en la varianza de la estrategia. Es por esto que los esquemas autoponderados son deseables en los diseños de muestreo de las encuestas de hogares. Por otra parte, si los pesos de muestreo tienen una variación grande, entonces habrá un incremento significativo en la varianza y, por ende, en el tamaño de muestra. Como se verá más adelante, los ajustes en el factor de expansión pueden inducir una alta variabilidad y por consiguiente se recomienda, en la medida de lo posible, crear clases o subgrupos de ajuste para mitigar y acotar la dispersión de los pesos finales de la encuesta. 

Al encontrar la mejor estratificación, nos aseguramos de que la segunda componente $DEFF^S$ de esta descomposición sea menor a uno (es decir que la varianza se reduce). Lamentablemente, la reducción de la varianza no suele ser tan grande y no mitiga los efectos de aglomeración debido a las múltiples etapas de los diseños de muestreo complejos. Como lo indica @Gutierrez_2016, el efecto de diseño en el muestreo aleatorio estratificado sin reemplazo con asignación proporcional está dado por

$$
DEFF^S \cong\frac{\text{Varianza dentro de los estratos}}{\text{Varianza Total}}
$$

Ahora, intuitivamente tenemos que la varianza total es la suma de la varianza dentro de los estratos con la varianza entre los estratos. Por tanto se concluye que, casi siempre, esta estrategia de muestreo arrojará mejores resultados que una estrategia aleatoria simple. Por otro lado, recordando que el efecto de diseño debido a la conglomeración de la población finita en las UPM está dado por la siguiente expresión:

$$
DEFF^C = 1 + (\bar{n}_{II}-1)\rho_y
$$ 

En donde, $\bar{n}_{II}$ es el número de hogares promedio que se seleccionan en cada UPM, y $\rho_y$ es el coeficiente de correlación intraclase, calculado para la variable de interés sobre las UPM. Habiéndose definido el marco de muestreo en el momento del levantamiento de la información primaria censal, ya no se tendrá control sobre el valor del coeficiente de correlación intraclase ($\rho_y$); únicamente se tiene control sobre el número de viviendas que serán seleccionadas en promedio en las UPM ($\bar{n}_{II}$). Si el marco de muestreo quedó correctamente definido, entonces el valor de $\rho_y$ será tan pequeño como fue posible establecerlo al proponer las UPM; de la misma manera, es recomendable que el equipo técnico dentro de los INE defina el menor número promedio posible de encuestas dentro de las UPM $\bar{n}_{II}$ para que el efecto de aglomeración sea mínimo. 

En general, la disminución del $DEFF$ debido a la estratificación se matiza con el aumento del $DEFF$ debido a la desigualdad de los pesos de muestreo. Es por esto que $DEFF^C$ predomina en el efecto de diseño general y es la razón por la cual se le presta mucha atención. @United_Nations_2008 propone que, para mitigar los efectos del muestreo multietápico, se consideren las siguientes estrategias:

1. Seleccionar tantas UPM como sea posible. 
1. Definir las UPM tan pequeñas como sea posible, en términos del número de viviendas que las componen. 
1. Seleccionar un número fijo de viviendas dentro de las UPM seleccionadas, en vez de un número variable. 
1. Utilizar un muestreo sistemático en la UPM, en vez de seleccionar segmentos de viviendas contiguas. 

Al encontrar la mejor estratificación, los funcionarios de los INE permiten que la segunda componente $DEFF^S$ de la descomposición del efecto de diseño general sea mínima para los indicadores estudiados. También es tarea de los INE asegurar que los efectos de diseño dados por el efecto de conglomeración y el uso del muestreo en varias etapas $DEFF^C$ sea mínimo. En este caso, se deberá estudiar, para cada encuesta y operación estadística que haga uso del marco de muestreo estratificado, la relación entre UPM y hogares a la luz de los indicadores de interés; en particular, es necesario decidir cuántos hogares serán seleccionados en cada UPM y cuántas UPM serán seleccionadas dentro de cada estrato

De la mima manera, y como se verá en los siguientes capítulos, el efecto debido al uso de factores de ponderación desiguales $DEFF^W$ puede ser minimizado al decidir, a la luz de la correlación entre los indicadores particulares de cada encuesta de hogares, cuáles variables de control serán utilizadas en la calibración de los estimadores. De esta forma, en esta estrategia tripartita, se asegura que el efecto de diseño general de las encuestas sea pequeño. 

## Formas comunes del efecto de diseño

Suponiendo que el parámetro de interés es la media poblacional ($\bar{y}$) de una variable de interés $y$ (por ejemplo, el ingreso per cápita mensual), es posible escribir la varianza del estimador bajo el diseño de muestreo complejo como 

$$
Var(\hat{\bar{y}}) = \frac{DEFF}{n}\left(1-\frac{n}{N}\right)S^2_{y_U}
$$

En donde $S^2_{y_U}$ corresponde a la varianza poblacional de la características de interés, $N$ es el tamaño de la población de interés $U$ y $n$ el tamaño de la muestra de individuos. Por otro lado, suponiendo que el parámetro de interés es la proporción poblacional ($P$) de una variable dicotómica $y$ (por ejemplo, el  porcentaje de individuos de bajo de la línea de pobreza en un país), es posible escribir la varianza del estimador bajo el diseño de muestreo complejo como 

$$
Var(\hat P) = \frac{DEFF}{n}\left(1-\frac{n}{N}\right)P(1-P)
$$

Cuando se trata de un diseño muestral multietápico, por ejemplo, es común seleccionar UPM en la primera etapa y posteriormente seleccionar hogares dentro de las áreas seleccionadas. En este contexto, el coeficiente de correlación intraclase está definido por 

$$
\rho_y=1-\frac{N_I}{N_I-1}\frac{SCD}{SCT}
$$

En donde, apelando a la notación clásica de los análisis de varianza, $SCT=\sum_{U}{(y_k-{\bar{y}}_U)}^2$ hace referencia a la suma de cuadrados total, $SCE=\sum_{U_I} N_I{({\bar{y}}_{U_I}-{\bar{y}}_U)}^2$ es la suma de cuadrados entre, y $SCD=SCT-SCE$ es la suma de cuadrados entre. Cuando la característica de interés $y$ es heterogénea entre los conglomerados, pero los conglomerados son homogéneos entre sí, entonces $\rho_y$ es cercano a 0; mientras que si los conglomerados son heterogéneos entre sí, pero homogéneos dentro de cada uno, entonces $\rho_y$ es cercano a 1. En este tipo de escenarios, el efecto de diseño se puede expresar como $DEFF = 1 + (\bar{n}_{II}-1)\rho_y$. En general, nótese que el efecto de diseño será mayor cuando:

1.  El coeficiente de correlación crezca, lo cual no puede ser controlado de antemano, puesto que se trata de la observación de la realidad. En general, $\rho_y$ será más grande cuando la distribución de la variable de interés sea explicada por las UPM en el país. Por ejemplo, si el indicador de interés es la pobreza y los hogares pobres están aglomerados, segregados y separados de los hogares más acaudalados, entonces $\rho_y$ será más grande; además, entre más segregación haya, mayor será su valor. 
2. El promedio de hogares seleccionados por UPM ascienda. Esto es controlado de antemano en la etapa de diseño y será un número fijo y transversal en la encuesta. 

## Otras consideraciones

### El efecto de diseño en subpoblaciones {-}

La estimación del efecto de diseño es un problema común cuando se trabaja con estimaciones desagregadas en subpoblaciones de interés. Por un lado, cuando las subpoblaciones constituyen estratos (o agregaciones de estratos) planeados de antemano, para los cuales se conoce previamente su tamaño poblacional, se tiene el siguiente efecto de diseño:

$$
DEFF_h= \frac{Var (\hat\theta_h) }{Var_{MAS}^h(\hat\theta_h) }
$$

En donde $Var_{MAS}^h(\hat\theta_h)$ es la varianza del estimador restringida al estrato $h (h=1,\ldots, H)$; en el caso en el que $\hat\theta_h$ corresponda al estimador del promedio poblacional en el estrato $h$, su valor es el siguiente:

$$
Var_{MAS}^h(\hat\theta_h)=\frac{1}{n_h}\left(1-\frac{n_h}{N_h}\right)S^2_{y_{U_h}}
$$

Siendo $n_h$ el tamaño de la muestra en el estrato $h$, $N_h$ el tamaño poblacional del estrato $h$ y $S^2_{y_{U_h}}$ es la varianza poblacional de la variable de interés restringida al subgrupo $h$. Por lo tanto, los efectos de diseño para las medias muestrales en un diseño aleatorio estratificado, serán por definición iguales a uno.  

Por otro lado, cuando la subpoblación de interés no es un estrato o un post-estrato sino un subgrupo aleatorio (como por ejemplo las personas pobres, las personas ocupadas, o cualquier otro subgrupo no planeado en el diseño de la encuesta o en la etapa de calibración), en adelante notado con la letra $g$, cuyo tamaño de muestra no es fijo (o condicionalmente fijo por la calibración) sino aleatorio, entonces la estimación correcta del efecto de diseño es la siguiente:

$$
DEFF_g = \frac{Var (\hat\theta_g) }{Var_{MAS}^U(\hat\theta_g) }
$$

En donde $Var_{MAS}^U(\hat\theta_g)$ es la varianza del estimador de interés. En el caso en el que $\hat\theta_g$ corresponda al estimador del promedio poblacional en el subgrupo $g$, entonces su varianza estaría dada por la siguiente expresión:

$$
Var_{MAS}^U(\hat\theta_g)=\frac{1}{n}\left(1-\frac{n}{N}\right)S^2_{y_{gU}}
$$

En donde $S^2_{y_{gU}}$ es la varianza poblacional de una nueva variable calculada en toda la población, que toma el valor de $y_k$, cuando la unidad $k$ pertence al subgrupo $g$, y toma el valor de cero, en cualquier otro caso. Por lo tanto, en ambos efectos de diseño, la estimación de la varianza del diseño de muestreo complejo $Var (\hat\theta_h)$ o $Var (\hat\theta_g)$ es la misma, pero el denominador cambia dependiendo de si el subgrupo es un estrato o no. Es por esta razón que, al analizar una encuesta de hogares, hay coincidencia en las cifras relacionadas con la estimación puntual, errores estándar, intervalos de confianza y coeficientes de variación entre los diferentes softwares computacionales. Sin embargo, es necesario percatarse de las opciones que estos adjuntan para calcular correctamente la cifra apropiada. Nótese que, en resumen, las estimaciones de $Var_{MAS}^U(\hat\theta_g)$ y $Var_{MAS}^h(\hat\theta_h)$  serán diferentes, puesto que la primera involucra a toda la muestra, mientras que la segunda involucra únicamente a la muestra del estrato. 

@Lumley_2010 afirma que el efecto del diseño compara la varianza de una media o total con la varianza de un estudio del mismo tamaño utilizando un muestreo aleatorio simple sin reemplazo y que su cálculo será incorrecto si los pesos de muestreo se han re-escalado o no son recíprocos a las probabilidades de inclusión. Por ejemplo, en el caso de las subpoblaciones, la librería `survey` de `R` compara la varianza de la estimación con la varianza de una estimación basada en una muestra aleatoria simple del mismo tamaño que el de la subpoblación. Entonces, por ejemplo, en el muestreo aleatorio estratificado, el efecto de diseño calculado en un estrato será igual a uno.

### El efecto de diseño general {-}

Suponga que el diseño muestral es estratificado con $H$ estratos; entonces por la independencia de la selección en los estratos, la varianza del estimador de un total poblacional $t_y$ está dada por

$$
Var\left(\widehat{t_{y,\pi}}\right)=\sum_{h=1}^{H}Var_h\left(\widehat{t_{y,\pi}}\right)
$$

donde 

$$
{Var}_h\left(\widehat{t_{y,\pi}}\right)={DEFF}_h \times {Var}_{MAS,h}\left(\widehat{t_{y,\pi}}\right)
$$

Por otro lado, 

$$
Var\left(\widehat{t_{y,\pi}}\right)=DEFF \times {Var}_{MAS}\left(\widehat{t_{y,\pi}}\right)
$$

De esta forma, se tiene que

$$
DEFF=\frac{\sum_{h=1}^{H}DEFF_h{Var}_{MAS,h}\left(\widehat{t_{y,\pi}}\right)}{Var_{MAS}\left(\widehat{t_{y,\pi}}\right)}=\frac{\sum_{h=1}^{H}DEFF_h\frac{N_h^2}{n_h}(1-\frac{n_h}{N_h})S_{y,U_h}^2}{\frac{N^2}{n}(1-\frac{n}{N})S_{y,U}^2}
$$

Es decir, el efecto de diseño puede ser visto como una combinación lineal de los efectos de diseño de los $H$ estratos $(DEFF=\sum_{h=1}^{H} DEFF_h \ w_h)$. En donde el peso $w_h$ está dado por

$$
w_h=\frac{\frac{N_h^2}{n_h}(1-\frac{n_h}{N_h})S_{y,U_h}^2}{\frac{N^2}{n}(1-\frac{n}{N})S_{y,U}^2}
$$

Es claro que los pesos $w_h$ son todos positivos, pero no necesariamente son menores a 1, y la suma de ellos tampoco es igual a 1. A continuación, examinamos la forma de $w_h$ en el caso especial de muestras autoponderadas en todos los estratos. En este caso, se tiene que $\frac{n_h}{N_h}=\frac{n}{N}$ para todo $h=1,\ldots,H$, y se puede ver que 

$$
w_h=\frac{N_hS_{y,U_h}^2}{NS_{y,U}^2}=\frac{\sum_{U_h}{(y_k-{\bar{y}}_{U_h})}^2}{\sum_{U}{(y_k-{\bar{y}}_U)}^2}
$$

Aunque $\sum_{h=1}^{H}w_h\neq 1$, el peso del estrato $h$ sí tiene una interpretación interesante, pues queda definido como la suma de cuadrados dentro del estrato, dividido por la suma de cuadrados totales de la variable de interés. Y podemos concluir que cuando los estratos están bien construidos, esto es, la variable de interés es homogénea dentro de cada estrato y los diferentes estratos son heterogéneos entre sí, los pesos $w_h$ serán muy pequeños y el $DEFF$ general resultará mucho más pequeño que los $DEFF$ de los estratos. 

Por otro lado, si los estratos no fueron construidos teniendo en cuenta la variabilidad de la característica de interés, entonces $S_{y,U_h}^2\approx S_{y,U}^2$ y $w_h=N_h/N$. De esta forma, la suma de los pesos es igual a 1, y se puede concluir que el $DEFF$ del diseño general es un promedio ponderado de los efectos de los $H$ estratos, y el estrato que tiene mayor peso será aquel que tiene mayor representación del universo.

Finalmente, alguno de los pesos $w_h$  puede resultar ser mayor a 1 cuando para algún estrato $\frac{n_h}{N_h}\neq\frac{n}{N}$, y cuando los estratos no están bien construidos. 


### El efecto de diseño en las encuestas de hogares de la región {-}

En general, para las encuestas de hogares en la región, se planean esquemas de estratificación, aglomeración y selección de UPM con probabilidades desiguales. @Heeringa_West_Berglund_2017 anotan que el efecto de estratificación reduce la varianza de las estrategias de muestreo, mientras que el efecto de selección desigual tiende a aumentarla. En general, estos dos efectos tienden a anularse entre sí. Por lo tanto, el efecto de diseño de una encuesta compleja estará únicamente en función del efecto de aglomeración, el cual puede llegar a ser grande, en comparación con los otros dos. Como ya se había comentado antes, la expresión generalizada que da cuenta del efecto de aglomeración en los diseños de muestreo complejos de las encuestas de hogares es la siguiente:

$$
DEFF \approx 1 + (\bar{n}_{II} - 1)\rho_y
$$

En donde se recalca que $\bar{n}_{II}$ representa el número promedio de hogares seleccionados dentro de cada UPM y $\rho_y$ es el coeficiente de correlación intraclase, que representa el grado de homogeneidad de la variable de interés dentro de cada hogar. 

Este efecto cambiará dependiendo de si la inferencia de la encuesta de hogares se quiere realizar a nivel nacional o a nivel regional. Por ejemplo, @United_Nations_2005[capítulo 7] presenta el comportamiento de esta medida a lo largo de tres encuestas de hogares en Brasil: la *Pesquisa Nacional por Amostra de Domicílios* (PNAD), la *Pesquisa Mensal de Emprego* (PME) y la *Pesquisa de Padrões de Vida* (PPV). En general, estas encuestas utilizan estratificación y selección de UPM con probabilidades desiguales; además, el tamaño promedio de las UPM es de 250 viviendas, de las cuales son seleccionadas 13 por la PNAD, 20 en la PME y 16 y 8 viviendas en la PPV en la zona rural y urbana, respectivamente. 

Basado en @United_Nations_2005[capítulo 7], se nota que los efectos de diseño no solo son diferentes para cada parámetro que se desea estimar sino que varían de acuerdo a la subpoblación en la que se realice la estimación. Por ejemplo, considere al considerar el parámetro *proporción de hogares con electricidad*, se estimó que el efecto de diseño para este parámetro fue de 7.92 a nivel nacional, de 1.03 en las áreas metropolitanas, de 4.43 en las ciudades grandes y de 7.27 en las áreas rurales. Por lo anterior, y basado en la expresión que define el efecto de diseño, se observó que, fijando $\bar{n}_{II}$, el coeficiente de correlación intraclase varío dependiendo de la zona. En efecto, $\rho_y= 0.76$ a nivel nacional, $\rho_y= 0.0033$ en las zonas metropolitanas, $\rho_y= 0.38$ en las ciudades grandes y $\rho_y= 0.69$ en las áreas rurales. Lo anterior implicó que hay una mayor heterogeneidad de los hogares con electricidad entre las UPM a nivel nacional y en las áreas rurales, es decir algunos hogares tienen electricidad y otros no entre las UPM. Sin embargo, en las zonas metropolitanas la variación de esta variable entre las UPM es casi nula, es decir que todos lo hogares tienen electricidad entre las UPM de estas zonas. 

Por otro lado, para la misma encuesta PNAD, los efectos de diseño para el número promedio de cuartos usados como dormitorios es de 2.14 a nivel nacional, de 2.37 en las áreas metropolitanas, de 1.72 en las ciudades grandes y de 2.09 en las áreas rurales. Considerando que $\bar{n}_{II}=10$, el coeficiente de correlación intraclase es de $\rho_y= 0.12$ a nivel nacional, $\rho_y= 0.15$ en las zonas metropolitanas, $\rho_y= 0.08$ en las ciudades grandes y $\rho_y= 0.12$ en las áreas rurales. Lo anterior implica que hay una mayor homogeneidad del número de cuartos utilizados como dormitorio entre las UPM del país y de las zonas que lo componen. 

Como se verá en los capítulos posteriores, al conocer el valor que toma el efecto de diseño para la estimación de un parámetro de interés, es posible crear escenarios de simulación que permitan establecer el tamaño de muestra en la planeación de las encuestas de hogares o en su rediseño después de la ronda de censos en una década particular. 














