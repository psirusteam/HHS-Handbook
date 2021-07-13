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

En donde $Var(\hat{\theta})$ denota la varianza de un estimador $\hat{\theta}$ bajo un diseño de muestreo complejo $P$ y $Var_{MAS}(\hat{\theta})$ denota la varianza del este estimador $\hat{\theta}$ bajo un diseño de muestreo aleatorio simple $MAS$. Esta cifra da cuenta del efecto de aglomeración causado por la utilización de un diseño de muestreo complejo $(p)$, frente a un diseño de muestreo aleatorio simple $MAS$, en la inferencia de un parámetro de la población finita $\theta$ (que puede ser un total, un promedio, una proporción, una razón, un percentil, etc.). 

## Formas comunes del efecto de diseño

Por ejemplo, suponiendo que el parámetro de interés es la media poblacional ($\bar{y}$) de una variable de interés $y$ (por ejemplo, el ingreso per cápita mensual), es posible escribir la varianza del estimador bajo el diseño de muestreo complejo como 

$$
Var(\hat{\bar{y}}) = \frac{DEFF}{n}\left(1-\frac{n}{N}\right)S^2_{y}
$$

En donde $S^2_{y}$ corresponde a la varianza de la características de interés, $N$ es el tamaño de la población de interés y $n$ el tamaño de la muestra de individuos. Por otro lado, suponiendo que el parámetro de interés es la proporción poblacional ($P $) de una variable dicotómica $y$ (por ejemplo, el  porcentaje de individuos de bajo de la línea de pobreza en un país), es posible escribir la varianza del estimador bajo el diseño de muestreo complejo como 

$$
Var(\hat P) = \frac{DEFF}{n}\left(1-\frac{n}{N}\right)P(1-P)
$$

Cuando se trata de un diseño muestral multietápico, por ejemplo, es común seleccionar UPM en la primera etapa y posteriormente seleccionar hogares dentro de las áreas seleccionadas. En este contexto, el coeficiente de correlación intraclase está definido por 

$$
\rho=1-\frac{N_I}{N_I-1}\frac{WSS}{TSS}
$$

En donde $TSS=\sum_{U}{(y_k-{\bar{y}}_U)}^2$, $BSS=\sum_{U_I} N_I{({\bar{y}}_{U_I}-{\bar{y}}_U)}^2$ y $WSS=TSS-BSS$. Cuando la característica de interés $y$ es heterogénea entre los conglomerados, pero los conglomerados son homogéneos entre sí, entonces $\rho$ es cercano a 0; mientras que si los conglomerados son heterogéneos entre sí, pero homogéneos dentro de cada uno, entonces $\rho$ es cercano a 1. En este tipo de escenarios, el efecto de diseño se puede expresar de la siguiente manera
$$
DEFF = 1 + (\bar m-1)\rho
$$

donde $\bar m$ corresponde al promedio de hogares seleccionados por UPM y $\rho$ es el coeficiente de correlación intraclase entre la variable de interés y las UPM. En general, nótese que el efecto de diseño será mayor cuando:

1.  El coeficiente de correlación crezca, lo cual no puede ser controlado de antemano, puesto que se trata de la observación de la realidad. En general, $\rho_y$ será más grande cuando la distribución de la variable de interés sea explicada por las UPM en el país. Por ejemplo, si el indicador de interés es la pobreza y los hogares pobres están aglomerados, segregados y separados de los hogares más acaudalados, entonces $\rho_y$ será más grande; además, entre más segregación haya, mayor será su valor. 
2. El promedio de hogares seleccionados por UPM ascienda. Esto es controlado de antemano en la etapa de diseño y será un número fijo y transversal en la encuesta. 

## Estimación del efecto de diseño

En la expresión de efecto de diseño se debe notar dos hechos importantes, en primer lugar, Deff depende del diseño muestral $p(s)$, y en segundo lugar, depende del estimador del parámetro $\theta$. De esta forma, no es correcto describir al $Deff$ únicamente como una medidad de eficiencia del diseño muestral, puesto que bajo un mismo diseño, este puede tomar diferentes valores según el parámetro que se quiera estimar.

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

La idea del efecto de diseño trata de evaluar el mismo estimador bajo diferentes escenarios de muestreo. Como el estimador que se está estudiando $\hat \theta$ viene ponderado por los factores de expansión de la encuesta, entonces lo más conveniente es utilizar el mismo rasero para evaluar ambas estrategias de muestreo. Es posible encontrar una discusión más profunda sobre el efecto de diseño en @Gambino_2009[, sección 4.],  @Sarndal_Swensson_Wretman_2003[, página 188] y @Gutierrez_Zhang_Montano_2016[, página 101].

## El efecto de diseño en subpoblaciones

La estimación del efecto de diseño es un problema común cuando se trabaja con estimaciones desagregadas en subpoblaciones de interés. Luego, cuando las subpoblaciones constituyen estratos (o agregaciones de estratos) planeados de antemano, para los cuales se conoce previamente su tamaño poblacional, se tiene el siguiente efecto de diseño:

$$
DEFF_h= \frac{Var (\hat\theta_h) }{Var_{MAS}^h(\hat\theta_h) }
$$

En donde $Var_{MAS}^h(\hat\theta_h)$ es la varianza restringida al estrato $h (h=1,\ldots, H)$; en el caso en el que $\hat\theta_h$ corresponda al estimador del promedio poblacional en el estrato $h$, su valor es el siguiente:
$$
Var_{MAS}^h(\hat\theta_h)=\frac{1}{n_h}\left(1-\frac{n_h}{N_h}\right)S_{y_h}^2
$$

Siendo $n_h$ el tamaño de la muestra en el estrato $h$, $N_h$ el tamaño poblacional del estrato $h$ y $S_{y_h}^2$ la varianza muestral de la variable de interés restringida al subgrupo $h$. Cuando la subpoblación de interés no es un estrato o un post-estrato sino un subgrupo aleatorio - como por ejemplo las personas pobres, las personas ocupadas, o cualquier otro subgrupo no planeado en el diseño de la encuesta o en la etapa de calibración - cuyo tamaño de muestra no es fijo (o condicionalmente fijo por la calibración) sino aleatorio, entonces la estimación correcta del efecto de diseño es la siguiente:

$$
DEFF= \frac{Var (\hat\theta_h) }{Var_{MAS}^U(\hat\theta_h) }
$$

En donde $Var_{MAS}^U(\hat\theta_h)$ es la varianza poblacional del estimador de interés. En el caso en el que $\hat\theta_h$ corresponda al estimador del promedio poblacional en el estrato $h$, entonces su varianza estaría dada por la siguiente expresión:

$$
Var_{MAS}^U(\hat\theta_h)=\frac{1}{n}\left(1-\frac{n}{N}\right)S_{y_{hU}}^2
$$

En donde $S_{y_{hU}}^2$ es la varianza muestral de la variable de interés calculada en toda la población. Por lo tanto, en ambos efectos de diseño, la estimación de la varianza del diseño de muestreo complejo $Var (\hat\theta_h)$ es la misma, pero el denominador cambia dependiendo de si el subgrupo es un estrato o no. Es por esta razón que en los software computacionales las cifras relacionadas con la estimación puntual, errores estándar, intervalos de confianza y coeficientes de variación coinciden plenamente. Sin embargo, tanto los software `Stata` como `SPSS` estiman por defecto el DEFF. Nótese que, en este caso, las estimaciones de $Var_{MAS}^U(\hat\theta_h)$ y $Var_{MAS}^h(\hat\theta_h)$  serán diferentes, puesto que la primera involucra a toda la muestra, mientras que la segunda involucra únicamente a la muestra del estrato. 

Cuando los subgrupos de interés son agregaciones de los estratos de diseño, no es correcto utilizar el enfoque que `Stata` trae por defecto. En efecto, @Lumley_2010 afirma que el efecto del diseño compara la varianza de una media o total con la varianza de un estudio del mismo tamaño utilizando un muestreo aleatorio simple sin reemplazo y que su cálculo será incorrecto si los pesos de muestreo se han re-escalado o no son recíprocos a las probabilidades de inclusión. Además, en `R` se compara la varianza de la estimación con la varianza de una estimación basada en una muestra aleatoria simple del mismo tamaño que el de la subpoblación. Entonces, por ejemplo, en el muestreo aleatorio estratificado, el efecto de diseño calculado en un estrato será igual a uno.



## Otras consideraciones

### El efecto de diseño general

Suponga que el diseño muestral es estratificado con $H$ estratos; entonces por la independencia de la selección en los estratos, la varianza del estimador de un total poblacional $t_y$ está dada por

$$
Var\left(\widehat{t_{y,\pi}}\right)=\sum_{h=1}^{H}Var_h\left(\widehat{t_{y,\pi}}\right)
$$

donde 

$$
{Var}_h\left(\widehat{t_{y,\pi}}\right)={Deff}_h \times {Var}_{MAS,h}\left(\widehat{t_{y,\pi}}\right)
$$

Por otro lado, 

$$
Var\left(\widehat{t_{y,\pi}}\right)=Deff \times {Var}_{MAS}\left(\widehat{t_{y,\pi}}\right)
$$

De esta forma, se tiene que

$$
Deff=\frac{\sum_{h=1}^{H}Deff_h{Var}_{MAS,h}\left(\widehat{t_{y,\pi}}\right)}{Var_{MAS}\left(\widehat{t_{y,\pi}}\right)}=\frac{\sum_{h=1}^{H}Deff_h\frac{N_h^2}{n_h}(1-\frac{n_h}{N_h})S_{y,U_h}^2}{\frac{N^2}{n}(1-\frac{n}{N})S_{y,U}^2}
$$

Es decir, el efecto de diseño puede ser visto como una combinación lineal de los efectos de diseño de los $H$ estratos $(Deff=\sum_{h=1}^{H} Deff_h \ w_h)$. En donde el peso $w_h$ está dado por

$$
w_h=\frac{\frac{N_h^2}{n_h}(1-\frac{n_h}{N_h})S_{y,U_h}^2}{\frac{N^2}{n}(1-\frac{n}{N})S_{y,U}^2}
$$

Es claro que los pesos $w_h$ son todos positivos, pero no necesariamente son menores a 1, y la suma de ellos tampoco es igual a 1. A continuación, examinamos la forma de $w_h$ en el caso especial de muestras autoponderadas en todos los estratos. En este caso, se tiene que $\frac{n_h}{N_h}=\frac{n}{N}$ para todo $h=1,\ldots,H$, y se puede ver que 

$$
w_h=\frac{N_hS_{y,U_h}^2}{NS_{y,U}^2}=\frac{\sum_{U_h}{(y_k-{\bar{y}}_{U_h})}^2}{\sum_{U}{(y_k-{\bar{y}}_U)}^2}
$$

Aunque $\sum_{h=1}^{H}w_h\neq 1$, el peso del estrato $h$ sí tiene una interpretación interesante, pues queda definido como la suma de cuadrados dentro del estrato, dividido por la suma de cuadrados totales de la variable de interés. Y podemos concluir que cuando los estratos están bien construidos, esto es, la variable de interés es homogénea dentro de cada estrato y los diferentes estratos son heterogéneos entre sí, los pesos $w_h$ serán muy pequeños y el $Deff$ general resultará mucho más pequeño que los $Deff$ de los estratos. 

Por otro lado, si los estratos no fueron construidos teniendo en cuenta la variabilidad de la característica de interés, entonces $S_{y,U_h}^2\approx S_{y,U}^2$ y $w_h=N_h/N$. De esta forma, la suma de los pesos es igual a 1, y se puede concluir que el $Deff$ del diseño general es un promedio ponderado de los efectos de los $H$ estratos, y el estrato que tiene mayor peso será aquel que tiene mayor representación del universo.

Finalmente, alguno de los pesos $w_h$  puede resultar ser mayor a 1 cuando para algún estrato $\frac{n_h}{N_h}\neq\frac{n}{N}$, y cuando los estratos no están bien construidos. 


### El efecto de diseño en las encuestas de hogares de la región

La estructura de cálculo del tamaño de muestra tiene como insumo central al efecto de diseño. Una expresión generalizada que da cuenta del efecto de aglomeración en los diseños de muestreo en varias etapas [@Park_Lee_2006] es la siguiente:

$$
DEFF \approx 1 + (\bar{m} - 1)\rho
$$

En donde $\bar{m}$ representa el número promedio de hogares seleccionados dentro de cada UPM y $\rho$ es el coeficiente de correlación intraclase, que representa el grado de homogeneidad de la variable de interés dentro de cada hogar. Sin embargo, esta cifra cambia dependiendo de si la inferencia de la encuesta de hogares se quiere realizar a nivel nacional o a nivel regional. Por ejemplo, @United_Nations_2005[capítulo 7] presenta el comportamiento de esta medida a lo largo de tres encuestas de hogares en Brasil: la *Pesquisa Nacional por Amostra de Domicílios* (PNAD), la *Pesquisa Mensal de Emprego* (PME) y la *Pesquisa de Padrões de Vida* (PPV). En general, estas encuestas utilizan estratificación y selección de UPM con probabilidades desiguales; además, el tamaño promedio de las UPM es de 250 viviendas, de las cuales son seleccionadas 13 por la PNAD, 20 en la PME y 16 y 8 viviendas en la PPV en la zona rural y urbana, respectivamente. 

Basado en lo anterior, se nota que los efectos de diseño no solo son diferentes para cada parámetro que se desea estimar sino que varían de acuerdo a la subpoblación en la que se realice la estimación. Por ejemplo, considere el parámetro *proporción de hogares con electricidad*; en la PNAD se ha estimado que el efecto de diseño para este parámetro es de 7.92 a nivel nacional, de 1.03 en las áreas metropolitanas, de 4.43 en las ciudades grandes y de 7.27 en las áreas rurales. Por lo anterior, y basado en la expresión que define el efecto de diseño, se observa que, fijando $\bar{m}=10$, el coeficiente de correlación intraclase varía dependiendo de la zona. En efecto, $\rho= 0.76$ a nivel nacional, $\rho= 0.0033$ en las zonas metropolitanas, $\rho= 0.38$ en las ciudades grandes y $\rho= 0.69$ en las áreas rurales. Lo anterior implica que hay una mayor heterogeneidad de los hogares con electricidad entre las UPM a nivel nacional y en las áreas rurales, es decir algunos hogares tienen electricidad y otros no entre las UPM. Sin embargo, en las zonas metropolitanas la variación de esta variable entre las UPM es casi nula, es decir que todos lo hogares tienen electricidad entre las UPM de estas zonas. 

Por otro lado, para la misma encuesta PNAD, los efectos de diseño para el número promedio de cuartos usados como dormitorios es de 2.14 a nivel nacional, de 2.37 en las áreas metropolitanas, de 1.72 en las ciudades grandes y de 2.09 en las áreas rurales. Considerando que $\bar{m}=10$, el coeficiente de correlación intraclase es de $\rho= 0.12$ a nivel nacional, $\rho= 0.15$ en las zonas metropolitanas, $\rho= 0.08$ en las ciudades grandes y $\rho= 0.12$ en las áreas rurales. Lo anterior implica que hay una mayor homogeneidad del número de cuartos utilizados como dormitorio entre las UPM del país y de las zonas que lo componen. 

como se verá en los capítulos poasteriores, al conocer el valor que toma el efecto de diseño para la estimación de un parámetro de interés, es posible crear escenarios de simulación que permitan establecer el tamaño de muestra en la planeación de las encuestas de hogares. Las anteriores expresiones corresponden al número de individuos que deberían ser seleccionados en cada subgrupo de interés. Por lo tanto, estos cálculos deben ser hechos tantas veces como subgrupos de interés exista en la encuesta, adecuando cada expresión a su contraparte poblacional. Por ejemplo, si el interés está en hacer inferencia en dos estratos: el rural y el urbano, entonces se debe calcular estas expresiones dos veces, una para cada estrato. Al final, el tamaño de muestra nacional será la sumatoria de los tamaños de muestra en cada uno de los estratos del país. 


### Efecto de la estratificación en las estrategias de muestreo

@Park_2003 propone que el efecto de diseño de cualquier encuesta se puede descomponerse en tres partes que se relacionan entre sí de forma multiplicativa. En primer lugar está el efecto debido a la ponderación desigual, $deff^W$; en segundo lugar se encuentra el efecto debido a la estratificación, $deff^S$; y por último se tiene el efecto debido al muestreo en varias etapas, $deff^C$. Por lo tanto:

$$
DEFF = deff^W \times deff^S \times deff^C
$$

Al encontrar la mejor estratificación, el equipo del INE ha permitido que la segunda componente de esta descomposición sea mínima, en cuanto se han seguido los pasos necesarios para ello y se ha escogido la estratificación en tres particiones que aseguró un menor $deff^S$ para los indicadores estudiados. Ahora, cuando el marco se entregue al área de producción estadísticas, será tarea del INE asegurar que los efectos de diseño dados por el efecto de conglomeración y el uso del muestreo en varias etapas $deff^C$ sea mínimo, así como el efecto debido al uso de factores de ponderación desiguales, $deff^W$. 

En el primer caso, se deberá estudiar, para cada encuesta y operación estadística que haga uso del marco de muestreo estratificado, la relación entre UPMs y hogares a la luz de los indicadores de interés; en particular, es necesario decidir cuántos hogares serán seleccionados en cada UPM y cuántas UPMs serán seleccionadas dentro de cada estrato. De la mima manera, en el segundo caso, también se debe decidir, a la luz de la correlación entre los indicadores particulares de cada encuesta de hogares, cuáles variables de control serán utilizadas en la calibración de los estimadores. De esta forma, en esta estrategia tripartita, se asegura que el efecto de diseño de una encuesta levantada por el INE sea pequeño. 










