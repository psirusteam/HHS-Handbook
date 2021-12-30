# Estimación del error de muestreo

Después de que la muestra fue seleccionada y luego de realizar el proceso de medición, es necesario realizar la estimación de los parámetros junto con la estimación de sus errores estándar, definido como la raiz cuadrada de la varianza.

Aunque la escogencia del diseño de muestreo y el estimador sean de libre elección para los investigadores, no lo es el cálculo de las medidas de confiabilidad y precisión. Dado que la base científica sobre la cual descansa el muestreo es la inferencia estadística, se deben respetar las normas básicas para la asignación y posterior cálculo del margen de error, que constituye una medida unificada del error total de muestreo que cuantifica la incertidumbre acerca de las estimaciones en una encuesta. La forma de estimar el error estándar depende de:

- La complejidad del diseño de muestreo: estratificación, selección proporcional al tamaño, múltiples etapas. 
- La complejidad del estimador: ajuste de pesos por ausencia de respuesta, calibración, razón de totales, medias, percentiles, coeficientes de regresión. 

En general, podría afirmase que existen tres alternativas para calcular el error estándar de las estimaciones en una encuesta. Basados en la estrategia de muestreo es posible encontrar las *fórmulas exactas* que describan la varianza del estimador; sin embargo cuando el estimador utilizado no es una función lineal de totales, puede ser posible utilizar un enfoque de *linealización de Taylor* para aproximar la varianza del estimador a una función lineal. Por último, es posible apoyarse en en los métodos computacionales moderno y aplicar los principios de los *pesos replicados* para aproximar la varianza de cualquier estimador en una encuesta de hogares. 

Actualmente, los softwares estadísticos más comúnmente utilizados incluyen
procedimientos para la estimación de la varianza teniendo en cuenta
diseños de muestreo complejos. Una forma sencilla de usarlos es
siguiendo estos pasos en una base de datos agregada:

1.  Modificar los pesos, de tal forma que cumplan las restricciones
    poblacionales básicas.
2.  Definir los estratos de interés en donde el diseño de muestreo se
    realiza de forma independiente.
3.  Definir estrictamente las UPM como aglomerados poblacionales que
    incluyen a los hogares y personas (con sus múltiples entrevistas).

## Fórmulas exactas y linealización de Taylor

En la mayoría de casos de interés se pueden encontrar las fórmulas exactas que aplican a cada diseño de muestreo y a cada estimador usado. Para diseños simples es posible implementarlas para calcular la estimación de los errores directamente. Sin embargo, en diseños multietápicos y con estimadores simples se pueden tornar extremadamente complicadas. Más aún, en diseños multietápicos y para estimadores complejos simplemente no son una opción plausible.

La estimación de la varianza en una estrategia de muestreo es una tarea no siempre sencilla. A partir de la teoría se establece un camino lógico basado en las probabilidades de inclusión de primer y segundo orden. En general, para cualquier diseño de muestreo sin reemplazo, la fórmula exacta para calcular una varianza del estimador de Horvitz-Thompson está dada por:

$$Var(\hat{t}_{y,\pi}) = \sum_U\sum_U \Delta_{kl}\frac{y_k}{\pi_k}\frac{y_l}{\pi_l}$$

En donde $\Delta_{kl} = \pi_{kl} - \pi_l \pi_l$. Además, la probabilidad de inclusión de segundo orden se denota análogamente como $\pi_{kl}$ y define la probabilidad de que los elementos $k$ y $l$ pertenezcan a la muestra al mismo tiempo; esto es,

$$
\pi_{kl}=Pr(k\in s, \  l\in s)=Pr(I_k\ I_l=1)=\sum_{s \ni k, l} p(s).
$$

En donde el subíndice ${s \ni k, l}$ se refiere a la suma sobre todas las muestras que contienen a los elementos $k$-ésimo y $l$-ésimo. Evidentemente, por razones computacionales y porque es imposible acceder a la observación de los registros sobre toda la población finita, hacer este cálculo para los estimadores de los indicadores de interés en las encuestas simplemente no es viable. 

En la práctica de las encuestas de hogares nunca se podrá contar con la varianza exacta de un estimador; por consiguiente, para tener una estimación de la precisión de la estrategia de muestreo se debe estimar la varianza del estimador. @Gutierrez_2016 afrima que un estimador insesgado para esta varianza está dada por la siguiente expresión:

$$
\widehat{Var}_1(\hat{t}_{y,\pi})=\sum\sum_S \dfrac{\Delta_{kl}}{\pi_{kl}}\frac{y_k}{\pi_k}\frac{y_l}{\pi_l}
$$

Asimismo, si el diseño es de tamaño de muestra fijo, un estimador insesgado está dado por
$$
\widehat{Var}_2(\hat{t}_{y,\pi})=-\frac{1}{2}\sum\sum_S\frac{\Delta_{kl}}{\pi_{kl}}\left(\frac{y_k}{\pi_k}-\frac{y_l}{\pi_l}\right)^2
$$

De esta forma, cuando el tamaño de muestra es suficientemente grande, se puede construir un intervalo de confianza de nivel $(1-\alpha)$ para el total poblacional $t_y$ como se indica a continuación:

$$
IC(1-\alpha)=\left[\hat{t}_{y,\pi}-z_{1-\alpha / 2}\sqrt{ Var(\hat{t}_{y,\pi})},\hat{t}_{y,\pi}+z_{1-\alpha / 2}\sqrt{Var(\hat{t}_{y,\pi})}\right]
$$

donde $z_{1-\alpha / 2}$ se refiere al percentil $(1-\alpha / 2)$ de una variable aleatoria con distribución normal estándar. Como cada diseño de muestreo induce una forma cerrada para las probabilidades de inclusión de primer y segundo orden, las fórmulas de la estimación de la varianza se reducen ostensiblemente. Por ejemplo, si el diseño de muestreo es aleatorio simple, la fórmula de la estimación de la varianza es
 
$$
\widehat Var(\hat{t}_{y\pi}) = \frac{N^2}{n} \left( 1- \frac{n}{N} \right) S^2_{y_s}
$$
 
En donde $S^2_{y_s}$ es la varianza de los valores de la característica de interés en la muestra aleatoria $s$, dada por

$$
S^2_{y_s}=\frac{1}{n-1}\sum_{k\in S}(y_k-\bar{y}_s)^2
$$

Por otro lado, si el diseño de muestreo es aleatorio estratificado y el parámetro de interés es una media, la fórmula del estimador de Horvitz-Thompson es $\bar{y}_{\pi} = \frac{1}{N}\sum_s d_k y_k = \sum_{h=1}^H W_h \bar{y}_h$; en donde $W_h = N_h/N$. Ahora, siendo $S^2_{yh}$ la varianza muestral en el estrato $h$ de los valores de la característica de interés y definiendo $w_h = n_h/n$, la fórmula de la estimación de la varianza es
 
 $$
\widehat Var(\bar{y}_{\pi}) = \sum_{h=1}^H w_h^2 \frac{1-f_h}{n_h}S^2_{yh}
 $$

Cuando el diseño de muestreo se complejiza, también lo hace la estimación de la varianza. Por ejemplo, si el diseño de muestreo es estratificada y bietápico, de tal forma que dentro de cada estrato $U_h$ $h=1,\ldots, H$ existen $N_{Ih}$ unidades primarias de muestreo, de las cuales se selecciona una muestra $s_{Ih}$ de $n_{Ih}$ unidades mediante un diseño de muestreo aleatorio simple; y además, se considera que el sub-muestreo dentro de cada unidad primaria seleccionada es también aleatorio simple, de tal manera que para cada unidad primaria de muestreo seleccionada $i\in s_{Ih}$ de tamaño $N_i$ se selecciona una submuestra $s_i$ de elementos de tamaño $n_i$, entonces la forma final del estimador de la varianza del estimador de Horvitz-Thompson para el total poblacional quedaría de la siguiente manera:

$$
\widehat{Var}(\hat{t}_{y,\pi})=
\sum_{h=1}^H\left[\frac{N_{Ih}^2}{n_{Ih}}\left(1-\frac{n_{Ih}}{N_{Ih}}\right)S^2_{\hat{t}_{yh}S_I}+
\frac{N_{Ih}}{n_{Ih}}\sum_{i\in S_{Ih}}\frac{N_i^2}{n_i}\left(1-\frac{n_i}{N_i}\right)S^2_{y_{S_i}}\right]
$$

En donde $S^2_{\hat{t}_{y}S_I}$ y $S^2_{y_{S_i}}$ son, respectivamente, las varianzas muestrales de los totales estimados en las UPM seleccionadas y las varianzas muestrales de los hogares incluidos en la submuestra dentro de las UPM seleccionadas en la muestra de la primera etapa. 

Las fórmulas computacionales requeridas para estimar la varianza de estadísticas descriptivas como la media muestral están disponibles para algunos diseños complejos que incorporan elementos como la estratificación y el muestreo por conglomerados. Sin embargo, en el caso de estadísticas analíticas más complejas, tales como coeficientes de correlación y coeficientes de regresión, no se encuentra fácilmente las fórmulas específicas en diseños muestrales que se aparten del muestreo aleatorio simple. Estas fórmulas son enormemente complicadas o, en última instancia, se resisten al análisis matemático. 

## La técnica del último conglomerado

Debido a las dificultades algebraicas y computacionales, estimar la varianza en encuestas complejas que contemplan esquemas de conglomeración, selección en varias etapas y estratificación, puede tornarse bastante tedioso, costoso y además muy demorado. En esta sección se explica por qué la técnica del último conglomerado resulta ser una buena opción a la hora de aproximar la varianza en una encuesta compleja.

Para la estimación de la varianza de los estimadores de interés en encuestas multietápicas, los programas computacionales existentes utilizan una aproximación conocida como la técnica del último conglomerado (*ultimate cluster*). Esta aproximación, que sólo tiene en cuenta la varianza de los estimadores en la primera etapa, supone que ese muestreo fue realizado con reemplazo. Los procedimientos de muestreo en etapas posteriores de la selección son ignorados a menos que el factor de corrección para poblaciones finitas no sea despreciable a nivel de la primera etapa de muestreo. 

En particular, considere cualquier estimador del total poblacional dado por la siguiente combinación lineal

$$
\hat{t}_{y,\pi}=\sum_{k\in s} d_k y_k = \sum_{k\in U} I_k d_k y_k 
$$

En donde $I_k$ son variables indicadoras de la pertenencia del elemento $k$ a la muestra $s$. Ahora, asumiendo que el factor de expansión de la encuesta $d_k$ cumple con los supuestos básicos de un ponderador que hace insesgado a $\hat{t}_{y}$, es decir:

$$
E_p(I_k d_k) = 1
$$

Suponiendo un diseño de muestreo en varias etapas (dos o más) en donde la primera etapa supone la selección de una muestra $s_I$ de $m_I$ unidades primarias de muestreo (UPM) $U_i$ ($i\in s_I$) de tal forma que

- Si la selección se realizó con reeemplazo, la $i$-ésima UPM tiene probabilidad de selección $p_{I_i}$.
- Si la selección se realizó sin reeemplazo, la $i$-ésima UPM tiene probabilidad de inclusión $\pi_{I_i}$.

En las subsiguientes etapas de muestreo, se procede a seleccionar una muestra de elementos para cada una de las UPM seleccionadas en la primera etapa de muestreo. Dentro de la $i$-ésima UPM se selecciona una muestra $s_i$ de elementos; en particular la probabilidad condicional de que el $k$-ésimo elemento pertenzca a la muestra dada que la UPM que la contiene ha sido seleccionada en la muestra de la primera etapa está dada por la siguiente expresión:

$$
\pi_{k|i} = Pr(k \in s_i | i \in s_I)
$$

Por ejemplo, si el muestreo es sin reemplazo en todas sus etapas, la probabilidad de inclusión del $k$-ésimo elemento a la muestra $s$ está dada por

\begin{align*}
\pi_k & = Pr(k \in s)\\ 
& = Pr(k \in s_i, i \in s_I) \\
& = Pr(k \in s_i | i \in s_I) Pr(i \in s_I) = \pi_{k|i} \times \pi_{I_i}
\end{align*}

Dado que el inverso de las probabilidades de inclusión son un ponderador natural, entonces se definen las siguientes cantidades:

1. $d_{I_i} = \frac{1}{\pi_{I_i}}$, que es el factor de expansión de la $i$-ésima UPM.
2. $d_{k|i} = \frac{1}{\pi_{k|i}}$, que es el factor de expansión del $k$-ésimo elemento dentro para la $i$-ésima UPM.
3. $d_k = d_{I_i} \times d_{k|i}$, que es el factor de expansión final del $k$-ésimo elemento para toda la población $U$.

Desde la teoría de muestreo, es posible evidenciar que si el diseño de muestreo es con reemplazo entonces, además del estimador HT, existe otro estimador insesgado que puede considerarse, conocido como el estimador de Hansen-Hurwitz (HH) [@Gutierrez_2016]. A diferencia del estimador HT, el estimador HH tiene una expresión de varianza muy sencilla de calcular, y por consiguiente las expresiones de la estimación de la varianza del estimador HH son más manejables desde el punto de vista computacional. En efecto, bajo un diseño de muestreo en varias etapas, el estimador de Hansen-Hurwitz para el total poblacional está dada por la siguiente expresión:

$$
\hat{t}_{y,p}=\frac{1}{m_I}\sum_{i=1}^{m_I}\frac{\hat{t}_{y_i}}{p_{I_i}}
$$

En donde $p_{Ii}$ corresponde a la probabilidad de selección de la unidad $i$, mientras que $m_I$ es el tamaño de muestra (con reemplazo) del muestreo en la primera etapa. En este caso, la varianza estimada del estimador HH es:

$$
\widehat{Var}(\hat{t}_{y,p})=\frac{1}{m_I(m_I-1)}\sum_{i=1}^{m_I}\left(\frac{\hat{t}_{y_i}}{p_{I_i}}-\hat{t}_{y,p}\right)^2
$$


En donde las cantidades $\hat{t}_{y_i}$ representan lo totales estimados de la variable de interés en la $i$-ésima UPM y están dados por:

$$
\hat{t}_{y_i} = \sum_{k \in s_i} \frac{y_k}{\pi_{k|i}}
= \sum_{k \in s_i} d_{k|i} y_k 
$$

El espíritu de la técnica del último conglomerado consiste en utilizar la expresión de la estimación de la varianza del estimador HH en vez de la expresión exacta en diseños de muestreo complejos que no contemplan selecciones con reemplazo en la primera etapa. Para lograrlo, algunas cantidades deben ser equiparadas antes de poder utilizar esta aproximación. 
Utilizar la aproximación de la varianza requiere equiparar los términos de manera apropiada. En primer lugar, fijémonos en los estimadores $\hat{t}_{y,p}$ y $\hat{t}_{y,\pi}$. Para realizar esta comparación, se requiere que
se asuma la siguiente igualdad en las probabilidades de inclusión de la primera etapa:

$$
\pi_{I_i} = p_{I_i} \times m_I 
$$

Por lo tanto, el estimador del total poblacional quedaría definido como un estimador tipo Hanwen-Hurwitz. En efecto,

$$
\hat{t}_{y,\pi} =\sum_{k\in s} d_k y_k  
= \sum_{i=1}^{m_I}\sum_{k \in s_i} d_k y_k 
= \sum_{i=1}^{m_I}\sum_{k \in s_i} \frac{1}{\pi_{I_i} \pi_{k|i}} y_k 
= \sum_{i=1}^{m_I}\frac{\hat{t}_{y_i}}{\pi_{I_i}} 
\approx \frac{1}{m_I}\sum_{i=1}^{m_I}\frac{\hat{t}_{y_i}}{p_{I_i}}
$$

Ahora, dado que la forma del estimador ha sido equiparada con un estimador tipo Hanwen-Hurwitz, es posible utilizar su estimación de varianza. Aún más, después de un poco de álgebra es posible tener la siguiente aproximación, cuya gran ventaja es que sólo hace uso de los factores de expansión finales $d_k$, que suelen ser reportados por los INE cuando liberan los microdatos de sus encuestas, en vez de los factores de expansión de la primera etapa o los factores de expansión condicionales dentro de las UPM. 

\begin{align*}
\widehat{Var}(\hat{t}_{y,p})&=\frac{1}{m_I(m_I-1)}\sum_{i=1}^{m_I}\left(\frac{\hat{t}_{y_i}}{p_{I_i}}-\hat{t}_{y}\right)^2\\
&=\frac{m_I}{m_I-1}\sum_{i=1}^{m_I}\frac{1}{m_I^2}\left(\frac{\sum_{k \in s_i} d_{k|i} y_k }{p_{I_i}}-\sum_{i=1}^{m_I}\sum_{k \in s_i} d_k y_k \right)^2 \\
&=\frac{m_I}{m_I-1}\sum_{i=1}^{m_I}\left(\frac{\sum_{k \in s_i} d_{k|i} y_k }{m_I p_{I_i}}-\frac{1}{m_I}\sum_{i=1}^{m_I}\sum_{k \in s_i} d_k y_k \right)^2 \\
&=\frac{m_I}{m_I-1}\sum_{i=1}^{m_I}\left(\frac{\sum_{k \in s_i} d_{k|i} y_k }{\pi_{I_i}}-\frac{1}{m_I}\sum_{i=1}^{m_I}\sum_{k \in s_i} d_k y_k \right)^2 \\
&=\frac{m_I}{m_I-1}\sum_{i=1}^{m_I}\left( \sum_{k \in s_i} d_k y_k -\frac{1}{m_I}\sum_{i=1}^{m_I}\sum_{k \in s_i} d_k y_k \right)^2 
\end{align*}

Basado en lo anterior, al definir $\breve{t}_{y_i} = \sum_{k \in s_i} d_k y_k$ como la contribución^[Note que la suma de estas contribuciones en la muestra de la primera etapa da como resultado la estimación $\hat{t}_y$.] de la $i$-ésima UPM a la estimación del total poblacional y $\bar{\breve{t}}_{y}=\frac{1}{m_I}\sum_{i=1}^{m_I}\breve{t}_{y_i}$ como la contribución promedio en el muestreo de la primera etapa, entonces el estimador de varianza toma la siguiente forma, conocida como el estimador de varianza del *último conglomerado*.

\begin{align}
\label{UC}
\widehat{Var}(\hat{t}_{y,p})
=\frac{m_I}{m_I-1}\sum_{i=1}^{m_I}\left( \breve{t}_{y_i} -\frac{1}{m_I}\sum_{i=1}^{m_I}\breve{t}_{y_i} \right)^2 
=\frac{m_I}{m_I-1}\sum_{i=1}^{m_I}\left( \breve{t}_{y_i} - \bar{\breve{t}}_{y} \right)^2
\end{align}


Por ejemplo, si el escenario de muestreo planteado en la encuesta es estratificado, con tres etapas de selección dentro de cada estrato, entonces al utilizar la técnica del último conglomerado, la aproximación del estimador de la varianza estaría dada por

$$
\widehat{Var}(\hat{t}_{y,p}) = 
\sum_h\frac{n_h}{n_h-1}\sum_{i\in s_h}\left(\hat{t}_{y_i}-\bar{\hat{t}}_{y_h}\right)^2
$$

En donde $\hat{t}_{y_i} = \sum_{k \in s_{hi}} w_k y_k$, $\bar{\hat{t}}_{y_h}=(1/n_h)\sum_{i \in s_h}\hat{t}_{y_i}$ y $n_h$ es el número de UPMs seleccionadas en el estrato $h$. Este procedimiento, propuesto por @hansen1953sample tiende a sobrestimar la varianza verdadera, aunque resulta ser una técnica apetecida por los investigadores puesto que utiliza directamente los pesos finales de muestreo o factores de expansión que son publicados por los INE.

Utilizar la técnica del último conglomerado es una salida práctica al problema de la estimación de la varianza que, para la mayoría de encuestas que brindan estadísticas oficiales a los países, puede tornarse bastante complejo. Si bien, la expresión del estimador de la varianza no constituye un estimador estrictamente insesgado, sí se considera una aproximación bastante precisa. 

Por último, es importante reflexionar acerca de la definición práctica y el concepto que envuelven esta aproximación ¿Qué es un **último conglomerado**? Es la primera unidad de muestreo en un diseño complejo. Por ejemplo, considere el siguiente diseño de muestreo en cuatro etapas:

\begin{equation*}
\underbrace{\textbf{Municipio}}_{\text{UPM}} \Rrightarrow
\underbrace{\textbf{Sector}}_{\text{USM}} \Rrightarrow
\underbrace{\textbf{Vivienda}}_{\text{UTM}} \Rrightarrow
\underbrace{\textbf{Hogar}}_{\text{UFM}}
\end{equation*}

En la primera las unidades primarias de muestreo (UPM) son los municipios; dentro de cada municipio, se seleccionan unidades secundarias de muestreo (USM) que corresponden a sectores cartográficos; de esta forma, el submuestreo continua hasta seleccionar las unidades finales de muestreo (UFM) que son los hogares. 

Ahora, por lo general, la primera etapa de muestreo de una encuesta está inducida por dos tipos de diseños: estratificado o con probabilidad de selección proporcional al tamaño del municipio. En cualquiera de los dos casos, se crean subgrupos de inclusión forzosa. En el muestreo estratificado serán las ciudades grandes y en el muestreo proporcional también, puesto que la medida de tamaño inducirá probabilidades de inclusión mayores a uno. Luego, para poder aplicar la aproximación en este caso, los municipios pertenecientes a este subgrupo de inclusión forzosa no serán considerados UPM, sino que inducirán un estrato de ciudades grandes. En cada ciudad de este estrato se realizará un muestreo de la siguiente manera:

\begin{equation*}
\underbrace{\textbf{Sector}}_{\text{UPM}} \Rrightarrow
\underbrace{\textbf{Vivienda}}_{\text{USM}} \Rrightarrow
\underbrace{\textbf{Hogar}}_{\text{UFM}}
\end{equation*}

Es necesario tener en cuenta esta particularidad de algunas encuestas para poder aplicar correctamente esta técnica de aproximación de varianzas. En resumen, para aquellas ciudades que pertenecen al estrato de inclusión forzosa, las UPM serán los sectores cartográficos, y para el resto del país, las UPM serán los municipios cuya probabilidad de inclusión en la muestra de la primera etapa es menor a uno. 

## Linealización de Taylor

Cuando se trata de estimar parámetros que tienen una forma no lineal, es posible recurrir al uso de las herramientas del análisis matemático para aproximar sus varianzas con el fin de publicar las cifras oficiales con sus respectivos errores estándar. @Valliant_Dever_Kreuter_2013 mencionan que esta técnica se basa en expresar el estimador como función de estimadores lineales de totales. Por ejemplo, si el interés recae en estimar un parámetro poblacional $\theta$ que a su vez depende de $Q$ estimadores de totales $(t_1, t_2, \ldots, t_Q)$, entonces su estimador de muestreo se debe expresar como $\hat{\theta}=f(\hat{t}_1, \ldots, \hat{t}_Q)$.

En donde $\hat{t}_j=\sum_{k\in s}w_k y_{jk}$ es un estimador del $j$-ésimo total. Por consiguiente, si el estimador de interés no es una función lineal de totales, entonces las propiedades estadísticas comunes como insesgamiento, eficiencia y precisión de los estimadores deben ser aproximadas. Es común usar la técnica de la linealización de Taylor para encontrar aproximaciones lineales de primer orden. @Gutierrez_2016[, capitulo 8] presenta una explicación detallada de esta técnica aplicada a diferentes escenarios de estimación, en donde se consideran los siguientes pasos para construir un estimador linealizado de la varianza de una función no lineal de totales:

1. Expresar el estimador del parámetro de interés $\hat{\theta}$ como una función de estimadores de totales insesgados. Así, 
$$
\hat{\theta}=f(\hat{t}_1, \hat{t}_2,\ldots,\hat{t}_Q).
$$
2. Determinar todas las derivadas parciales de $f$ con respecto a cada total estimado $\hat{t}_{q}$ y evaluar el resultado en las cantidades poblacionales $t_q$. Así
$$
a_q=\left.\dfrac{\partial f(\hat{t}_1,\ldots,\hat{t}_Q)}{\partial \hat{t}_{q}}\right|_{\hat{t}_1=t_1,\ldots,\hat{t}_Q=t_Q}
$$
3. Aplicar el teorema de Taylor para funciones vectoriales para linealizar la estimación $\hat{\theta}$ con $\mathbf{a}=(t_1,t_2,\cdots,t_Q)'$. En el paso anterior, se vio que $\bigtriangledown\hat{\theta}=(a_1,\cdots,a_Q)$. Por consiguiente se tiene que
$$
\hat{\theta}=f(\hat{t}_1,\ldots,\hat{t}_Q) \cong \theta +\sum_{q=1}^Qa_q(\hat{t}_{q}-t_q)
$$
4. Definir una nueva variable $E_k$ con $k\in s$ al nivel de cada elemento observado en la muestra aleatoria, así:
$$
E_k=\sum_{q=1}^Qa_qy_{qk}
$$
5. Si los estimadores $\hat{t}_{q}$ son estimadores de Horvitz-Thompson, una expresión que aproxima la varianza de $\hat{\theta}$ está dada por
$$
AVar(\hat{\theta})=Var\left(\sum_{q=1}^Qa_q\hat{t}_{q,\pi}\right)
=Var\left(\sum_S\frac{E_k}{\pi_k}\right)=\sum_U\sum_U\Delta_{kl}\frac{E_k}{\pi_k}\frac{E_l}{\pi_l}.
$$

Tal como se advirtió anteriormente, @Gutierrez_2016 afirma que, para encontrar una estimación de la varianza de $\hat{\theta}$, no es posible utilizar directamente los valores $E_k$, porque éstos dependen de los totales poblacionales (las derivadas $a_q$ se evalúan en los totales poblacionales que son desconocidos). Por consiguiente, los valores $E_k$ se aproximan reemplazando los totales desconocidos por los estimadores de los mismos. Siendo $e_k$ la aproximación de la variable linealizada dada por
$$
e_k=\sum_{q=1}^Q\hat{a}_qy_{qk}
$$

donde $\hat{a}_q$ corresponde a un estimador de $a_q$. La aproximación de Taylor para el estimador la varianza del estimador de Horvitz-Thompson para un total está dado por la siguiente expresión 

$$
    \widehat{Var}(\hat{t}_{y,\pi})=\sum\sum_S \dfrac{\Delta_{kl}}{\pi_{kl}}\frac{e_k}{\pi_k}\frac{e_l}{\pi_l}
$$

Por ejemplo, bajo este contexto, si se quisiera estimar la tasa de desocupación (función no lineal de totales) definida como el cociente entre el total poblacional de personas que se encuentran en edad laboral pero que carecen de un empleo $({t}_{y})$ sobre la cantidad de personas que pertenecen a la población económicamente activa  $({t}_{z})$, entonces, la estimación de la aproximación de la varianza del estimador de esta razón $\hat{\theta}=\dfrac{\hat{t}_{y,\pi}}{\hat{t}_{z,\pi}}$ estaría definida como sigue en términos de las variables linealizadas 
$$
e_k=\dfrac{1}{\hat{t}_{z,\pi}}(y_k-\hat{\theta}z_k)
$$

Si, además, el muestreo de la encuesta es bietápico con selección aleatoria simple sin reemplazo en cada etapa, entonces este estimador de la varainza tomaría la siguiente forma:

$$
\widehat{Var}(\hat{\theta})=\frac{N_{I}^2}{n_{I}}\left(1-\frac{n_{I}}{N_{I}}\right)S^2_{\hat{t}_{e}S_I}+
\frac{N_{I}}{n_{I}}\sum_{i\in S_{I}}\frac{N_i^2}{n_i}\left(1-\frac{n_i}{N_i}\right)S^2_{e_{S_i}}
$$

En donde $S^2_{\hat{t}_{e}S_I}$ es la varianza muestral de los totales estimados $t_{ei}$ de las UPM seleccionadas en la primera etapa del muestreo y $S^2_{e_{S_i}}$ es la varianza muestral entre los valores $e_k$ para los elementos incluidos en la submuestra dentro de cada UPM seleccionada en la primera etapa. De la misma manera, para el caso particular de la estimación de un promedio utilizando el estimador de Hájek, las anteriores expresiones pueden adaptarse convenientemente.

Si se utiliza un estimador de calibración para el total poblacional de la característica de interés $t_y$, entonces siguiendo los lineamientos de @Gutierrez_2016[sección 10.6], la varianza estimada del estimador utilizando la técnica de linealización de Taylor haría uso de las siguientes variables linealizadas

$$
e_k=y_k-\mathbf{x}_k'\mathbf{\hat{\theta}}
$$ 

En donde $\mathbf{x}_k$ son las variables relacionadas con el vector de totales auxiliares $\mathbf{t}_{\mathbf{x}}$, medidas en la misma encuesta y $\mathbf{\hat{\theta}}$ es el vector estimado de coeficientes de regresión entre los valores que toman la característica de interés $y_k$ y el vector de información auxiliar $\mathbf{x}_k$.

En la región, tanto la *Pesquisa Nacional por Amostra de Domicilios Continua*, en Brasil, como la *Encuesta de Caracterización Socioeconómica Nacional*, en Chile, utilizan esquemas de linealización de Taylor en conjunción con el acercamiento del último conglomerado. En resumen, la linealización de Taylor supone que es posible definir una aproximación lineal de $\hat{\theta}$ así

$$
\hat{\theta} - \theta 
\approx \sum_{j=1}^p \frac{\partial f(\hat{t}_1, \ldots, \hat{t}_p) }{\partial \hat{t}_j}(\hat{t}_j - t_j)
= \sum_{k\in s} w_k e_k + c
$$

En donde $e_k= \sum_{j=1}^p \frac{\partial f(\hat{t}_1, \ldots, \hat{t}_p) }{\partial \hat{t}_j} y_{jk}$ son variables linealizadas, mientras que las cantidad $c$ representa una constante determinística que no aporta a la varianza de $\hat{\theta}$. Nótese lo conveniente de expresar esta aproximación de esta manera puesto que al final, las cantidades que intervienen en la varianza se pueden expresar como una suma ponderada de las variables $e_k$ y por consiguiente es posible aplicar todos los principios establecidos anteriormente. De esta forma, asumiendo el escenario de muestreo planteado en las secciones anteriores, el estimador de la varianza de la  aproximación lineal de $\hat{\theta}$ está dado por

$$
\widehat{Var}(\hat{\theta}) = 
\sum_h\frac{n_h}{n_h-1}\sum_{i\in s_h}\left(\hat{t}_{e_i}-\bar{\hat{t}}_{e_h}\right)^2
$$

En donde $\hat{t}_{e_i} = \sum_{k \in s_{hi}} w_k e_k$ y $\bar{\hat{t}}_{e_h}=(1/n_h)\sum_{i \in s_h}\hat{t}_{e_i}$. Por ejemplo, si el interés estuviera en estimar una razón, entonces las nuevas variables linealizadas son $e_k=(1/\hat{t}_{y_2})(y_{1k}-\hat{\theta} \ y_{2k})$.

## Pesos replicados

Las complicaciones en el cálculo de los errores de muestreo pueden ser mayores dependiendo de la escogencia del estimador y del diseño de muestreo asumido para la recolección de la información primaria. En algunas ocasiones, el proceso de linealización puede resultar complicado, por lo que es posible optar por una estrategia computacional aproximada que permite pasar por alto el proceso teórico de definición de las cantidades que estiman la varianza del estimador. Este conjunto de métodos supone la idea de la selección sistemática de *submuestras* que son utilizadas para estimar el parámetro de interés, utilizando los mismos principios de estimación que con la muestra completa. Por lo anterior, se obtienen estimaciones puntuales para cada réplica, las cuales son utilizadas para estimar la varianza del estimador de interés. 

En ausencia de fórmulas adecuadas, en los últimos años han aparecido una variedad de técnicas empíricas que proporcionan *varianzas aproximadas que parecen satisfactorias para fines prácticos* [@Kish_1965]. Estos métodos utilizan una muestra de datos para construir submuestras y generar una distribución para las estimaciones de los parámetros de interés utilizando cada submuestra. Los resultados de la submuestra se analizan para obtener una estimación del parámetro, así como intervalos de confianza para esa estimación. El enfoque general de esta técnicas computacional se basa en:

1. Dividir la toda la muestra en pequeños subconjutnos (réplicas).
2. Repetir los mismos procesos de ajuste de ponderadores en cada réplica. 
3. Hacer la estimación en cada subgrupo.
4. La varianza del estimador se calcula de manera simple como la varianza muestral de todas las estimaciones en cada réplica.

Usando esta metodología, no se requiere que las bases de datos públicas contengan la información asociada a los estratos o UPM y esto protege la anonimización de los respondientes. Además, no se requiere conocer el diseño de muestreo utilizado en la encuesta, puesto que al proveer los pesos replicados en las bases de datos, los investigadores pueden estimar el error de muestreo de forma automatizada y sin necesidad de intrincadas fórmulas matemáticas. Estos métodos ha demostrado ser eficientes y precisos para la mayoría de parámetros de interés, algunas encuestas que utilizan estas metodologías son la American Community Survey, la American Housing Survey y la Current Population Survey. En América Latina la PNADC de Brasil, la ENE de Chile y la ENEMDU de Ecuador han hecho uso de estas técnicas para la estimación de la varianza de algunos estimadores complejos. 

En particular, hay tres metodologías que abordan este problema: los pesos replicados repetidas balanceadas [@McCarthy_1969; @Judkins_1990], el Jackknife [@Krewski_Rao_1981] y el Bootstrap [@Rao_Wu_1988]. La idea general detrás de estos métodos es que, partiendo de la muestra completa, en cada réplica se seleccione un conjunto de UPMs manteniendo todas las unidades que hayan sido seleccionadas dentro de esas UPMs. Luego, es necesario reponderar los pesos de muestreo para que se conserve la representatividad; de esta manera, para cada réplica se obtendrá un nuevo conjunto de pesos de muestreo. Con estos pesos, se calcula la estimación de interés, obteniendo tantas estimaciones como réplicas definidas. @Wolter_2007 provee todos los detalles teóricos referentes al problema de la estimación de la varianza utilizando los pesos replicados. 

En lo concerniente con las técnicas de remuestreo y la utilización de los pesos replicados para el cálculo de los errores de muestreo se recalca que la técnica de *Jackknife* es útil para estimar parámetros lineales, pero no tiene un buen comportamiento cuando se trata de estimar percentiles o funciones de distribución. La técnica de *réplicas repetidas balanceadas* es útil para estimar parámetros lineales y no lineales, pero puede ser deficiente cuando se tienen dominios pequeños que pueden inducir estimaciones nulas en la configuración de los pesos. Sin embargo, como se explicará más adelante, el ajuste de Fay a la técnica anterior resulta palear todos los anteriores inconvenientes. En este caso es importante utilizar una matriz de Hadammard que induzca no más de 120 conjuntos de pesos replicados para que la publicación de la base de datos no se sobrecargue. Por último, el *bootstrap* debe ser utilizado con con detenimiento porque debe replicar el diseño de muestreo exacto y esto se logra construyendo una población a partir de los pesos de muestreo. 

#### La técnica de Jackknife {-}

Este método provee estimaciones eficientes para estimadores lineales y no lineales (a excepción de los percentiles). En su forma más básica, los pesos replicados se crean al retirar una UPM del análisis. Por ende, se tendrán tantos pesos replicados como UPM existan en la muestra. Además, cuando una UPM se retira en la réplica, todas las unidades dentro de esa UPM también se retiran. El desarrollo del procedimiento de Jackknife se remonta a un método utilizado por @Quenouille para reducir el sesgo de las estimaciones. El refinamiento ulterior del método [@mosteller1968data] llevó a su aplicación en una serie de situaciones de las ciencias sociales en las que las fórmulas no están fácilmente disponibles para el cálculo de errores de muestreo. 

Este procedimiento ofrece mayor flexibilidad, pues el Jackknife puede implementarse en una amplia variedad de diseños muestrales; además de facilidad de uso, puesto que no requiere de software especializado. El concepto principal de esta técnica parte de una muestra de tamaño $n$, la cual se divide en $A$ grupos de igual tamaño $m=n/A$, a partir de esta división, la varianza de un estimador $\hat{\theta}$ se estima a partir de la varianza observada en los $A$ grupos.

Para cada grupo $(a=1,2,...,A)$, se calcula $\hat{\theta}_{(a)}$, una estimación para el parámetro $\theta$, calculada de la misma forma que la estimación $\hat{\theta}$ obtenida con la muestra completa, pero solo con la información restante (luego de la eliminación del grupo $a$). Para $a=1,2,...,A$ se define 

$$\hat{\theta}_{a}=A\hat{\theta}-(A-1)\hat{\theta}_{(a)}$$

como un pseudovalor de $\theta$. El estimador obtenido mediante Jackknife se presenta como una alternativa a $\hat{\theta}$ y se define como:

$$\hat{\theta}_{JK}=\dfrac{1}{A}\sum_{a=1}^{A}\hat{\theta}_{a}$$

mientras que el estimador de la varianza obtenido mediante Jackknife se obtiene como: 

$$\widehat{Var}_{JK1}=\dfrac{1}{A(A-1)}\sum_{a=1}^{A}\left(\hat{\theta}_{a}-\hat{\theta}_{JK}\right)^{2}$$

También es posible utilizar como estimador alternativo: 

$$\widehat{Var}_{JK2}=\dfrac{1}{A(A-1)}\sum_{a=1}^{A}\left(\hat{\theta}_{a}-\hat{\theta}\right)^{2}$$

Para diseños estratificados y multietápicos en los cuales las unidades primarias de muestreo han sido seleccionadas en el estrato $h$, para $h=1, \ldots, H$, el estimador de varianza de Jackknife para la estimación de un parámetro poblacional  está dado por

$$ 
\widehat{Var}_{JK}(\hat{\theta}) = \sum_{h=1}^H \frac{n_{Ih} - 1}{n_{Ih}} \sum_{i=1}^{n_{Ih}}
(\hat{\theta}_{h(i)}-\hat{\theta})^2
$$

donde $\hat{\theta}_{h(i)}$ es la estimación de $\theta$ usando los datos de la muestra excluyendo las observaciones en la $i$-ésima unidad primaria de muestreo [@Korn_Graubard_1999, pg. 29 – 30]. @shao2012jackknife[, Teorema 6.2] garantiza la convergencia en probabilidad de este estimador hacia la varianza teórica, de donde se puede concluir que es un estimador aproximadamente insesgado para la varianza teórica. Los pesos de la unidad $k$ que pertenece a la UPM $U_i$, en el estrato $U_h$ están dados por la siguiente expresión:

$$
d_{hk}^i = 
\begin{cases}
0, \ \text{si $U_i \in U_h$ y $k \in U_i$ }\\
d_k, \ \text{si $k \notin U_h$}\\
\frac{n_{Ih}}{n_{Ih}-1}d_k, \ \text{si $U_i \in U_h$ y $k \notin U_i$}
\end{cases}
$$

En donde $n_{Ih}$ es el número de UPM seleccionadas en el estrato $U_h$. Por último, para reducir el número de pesos replicados, se pueden conformar *unidades de varianza*, uniendo varias UPM dentro de un mismo estrato, y también *estratos de varianza*, colapsando estratos dentro de la muestra. En el primer caso, se podrían emparejar las UPM en cada estrato de acuerdo a la medida de tamaño. En este caso, el estimador de varianza está dado por la siguiente expresión

$$
\widehat{Var}_{JK}(\hat{\theta}) = \sum_h \frac{n_{Ih}-n_{Ihg}}{n_{Ih}} 
\sum_{i \in s_{hg}} (\hat{\theta}_{h(g)} - \hat{\theta})^2
$$

En donde $\hat{\theta}_{hg}$ es el estimador del parámetro retirando el $g$-ésimo subgrupo del estrato $U_h$ y $n_{Ihg}$ es el tamaño del subgrupo en la muestra denotado como $s_{hg}$. A continuación se ejemplifica la estructura final de una base de datos de pesos replicados con esta técnica en un conjunto reducido de tan solo ocho unidades muestrales divididas en cuatro UPM y dos estratos. Se enfatiza que habrán tantos conjuntos (columnas) de pesos replicados Jackknife como UPM existentes en la muestra de la primera etapa.

| $k$ |  Estrato |  UPM | $d_k^{(1)}$ | $d_k^{(2)}$ | $d_k^{(3)}$ | $d_k^{(4)}$ |
|:---:|:--------:|:----:|:-----------:|:-----------:|:-----------:|:-----------:|
|  1  | Estrato1 | UPM1 |      0      |     1,03    |     1,03    |     1,03    |
|  2  | Estrato1 | UPM1 |      0      |     1,03    |     1,03    |     1,03    |
|  3  | Estrato1 | UPM2 |     1,03    |      0      |     1,03    |     1,03    |
|  4  | Estrato1 | UPM2 |     1,03    |      0      |     1,03    |     1,03    |
|  5  | Estrato2 | UPM3 |     1,03    |     1,03    |      0      |     1,03    |
|  6  | Estrato2 | UPM3 |     1,03    |     1,03    |      0      |     1,03    |
|  7  | Estrato2 | UPM4 |     1,03    |     1,03    |     1,03    |      0      |
|  8  | Estrato2 | UPM4 |     1,03    |     1,03    |     1,03    |      0      |


#### El método de las réplicas repetidas balanceadas {-}


Esta técnica conocida como BRR se desarrolló para diseños en donde dos UPM son seleccionadas por estrato. Este método funciona consistentemente para la estimación de parámetros lineales y no lineales (incluidos los percentiles) y, además, asegura máxima dispersión de las UPM a través de las regiones geográficas (estratos) [@Valliant_Dever_2017]. Nótese que si el submuestreo en cada estrato es $n_{Ih} = 2$, entonces al utilizar la técnica de Jackknife deberíamos definir $2^H$ posibles réplicas al seleccionar aleatoriamente una UPM en cada estrato, lo cual puede ser intratable computacionalmente. 

Es posible lograr la misma eficiencia reduciendo el número de pesos replicados utilizando un enfoque ortogonal con matrices de Hadamard, que son matrices cuadradas cuyas columnas deben ser ortogonales. Por ejemplo, considere la siguiente matriz: 

$$
\begin{pmatrix}
+1 & +1 & +1 & +1 \\
+1 & -1 & +1 & -1 \\
+1 & +1 & -1 & -1 \\
+1 & -1 & -1 & +1
\end{pmatrix}
$$

Asumiendo que el valor +1 implica que la primera UPM se mantiene como parte de la réplica y la segunda UPM es retirada de la réplica; el valor -1 implica que la segunda UPM se mantiene como parte de la réplica y la primera UPM es retirada de la réplica. Por tanto, en cada réplica se retira una UPM por estrato. Esto implica que el producto punto entre cualquier combinación de dos columnas deber ser igual a cero. Por ejemplo, tomando las columnas 2 y 4, se tiene que

$$
(+1, -1, +1, -1)' \cdot (+1, -1, -1, +1) 
=  1 + 1 - 1 -1 = 0 
$$

De esta forma, el número de réplicas ortogonales será igual al *menor múltiplo de 4 mayor o igual al número de estratos*. Las UPM que se mantienen en cada réplica se conocen como *half-samples*. Por consiguiente, el peso de los individuos en la UPM que se mantiene se multiplica por un factor de 2. Entonces, se tiene que

$$
d_{k} = 
\begin{cases}
0, \ \text{si $k$ pertence a la UPM que fue retirada}\\
2d_k, \ \text{en otro caso.}
\end{cases}
$$

Bajo esta metodología BRR, el estimador de la varianza toma la siguiente forma:

$$
\widehat{Var}_{BRR}(\hat{\theta}) = \frac{1}{A}\sum_{a=1}^A(\hat{\theta}_a - \hat\theta )^2
$$

En donde $\hat{\theta}_a$ es el estimador del parámetro de interés en la réplica $a$. A continuación se ejemplifica la estructura final de una base de datos de pesos replicados con esta técnica en el mismo conjunto reducido, considerando que hay dos estratos.

| $k$ |  Estrato |  UPM | $d_k^{(1)}$ | $d_k^{(2)}$ |
|:---:|:--------:|:----:|:-----------:|:-----------:|
|  1  | Estrato1 | UPM1 |      2      |      0      |
|  2  | Estrato1 | UPM1 |      2      |      0      |
|  3  | Estrato1 | UPM2 |      0      |      2      |
|  4  | Estrato1 | UPM2 |      0      |      2      |
|  5  | Estrato2 | UPM3 |      2      |      0      |
|  6  | Estrato2 | UPM3 |      2      |      0      |
|  7  | Estrato2 | UPM4 |      0      |      2      |
|  8  | Estrato2 | UPM4 |      0      |      2      |


Una desventaja de este método BRR es que las unidades en dominios con muestra pequeña pueden estar ausentes en algunas combinaciones de pesos replicados por el diseño ortogonal. Lo anterior conlleva una pérdida de precisión en el cálculo del error estándar. Una solución a este problema es modificar los pesos en los pesos replicados. Para la aplicación de la Réplicas Repetidas Balanceadas es recomendable usar el método de Fay, en donde se siguen los lineamientos basados en la matriz de Hadamard, aunque las UPM no son retiradas completamente, sino que su peso se modifica de la siguiente manera:

$$
d_k^a=
\begin{cases}
\rho*d_k,\ \ \ \  \ \ \ \ \ \ \text{si $k$ pertence a la UPM que fue retirada} \\
(2-\rho)d_k, \ \ \ \ \text{en otro caso.}
\end{cases}
$$

En donde $0<\rho<1$. Algunos estudios por simulación han mostrado una buena eficiencia para valores de $\rho$ iguales a 0.3, 0.5 o 0.7. Bajo la metodología BRR con el ajuste de Fay, el estimador de la varianza toma la siguiente forma:
$$
\widehat{Var}_{Fay}(\hat{\theta}) = \frac{1}{A(1-\rho)^2}\sum_{a=1}^A(\hat{\theta}_a - \hat\theta )^2
$$

En donde $\hat{\theta}_a$ es el estimador del parámetro de interés en la réplica $a$. A continuación se ejemplifica la estructura final de una base de datos de pesos replicados con el ajuste de Fay en el mismo conjunto reducido.

| $k$ |  Estrato |  UPM | $d_k^{(1)}$ | $d_k^{(2)}$ |
|:---:|:--------:|:----:|:-----------:|:-----------:|
|  1  | Estrato1 | UPM1 |     1.5     |     0.5     |
|  2  | Estrato1 | UPM1 |     1.5     |     0.5     |
|  3  | Estrato1 | UPM2 |     0.5     |     1.5     |
|  4  | Estrato1 | UPM2 |     0.5     |     1.5     |
|  5  | Estrato2 | UPM3 |     1.5     |     0.5     |
|  6  | Estrato2 | UPM3 |     1.5     |     0.5     |
|  7  | Estrato2 | UPM4 |     0.5     |     1.5     |
|  8  | Estrato2 | UPM4 |     0.5     |     1.5     |

En general, para la aplicación de estos métodos, los pesos de muestreo se ajustan para generar los pesos replicados y, posteriormente, se repiten los ajustes por ausencia de respuesta  y calibración para estos nuevos pesos. Con esta metodología se estiman los errores de muestreo y la varianza de muestreo, incluyendo el impacto de la ausencia de respuesta, el cual se espera que sea pequeño, pero relevante en el momento de calcular estimadores más precisos. Retomando las observaciones hechas anteriormente, en el caso en el que la encuesta cuente con estratos en donde se encuentre una sola UPM, el método de los pesos replicados repetidas balanceadas no es aplicable puesto que al eliminar una unidad, algunos estratos quedarán vacíos. 

#### Método de Bootstrap {-}

En este apartado se presenta el método de Bootstrap [@EfroTibs93], el cual es muy utilizado por su fácil implementación; además de ser flexible en términos del número de pesos replicados que se crean. Teniendo los pesos muestrales se procede a crear los pesos replicados con el método de remuestreo con el fin de poder calcular estimaciones de indicadores junto con las estimación de las varianzas. En el contexto de las encuestas de hogares, se trata de realizar un remuestreo a las unidades primarias de muestreo seleccionadas desde el marco de áreas. 

El Bootstrap es el método basado en réplicas más versatil para el cálculo de errores estándar. @Valliant_Dever_2017 mencionan que es muy eficiente en la estimación de parámetros lineales y no lineales, a diferencia del Jackknife que no es eficiente en la estimación de percentiles. Funciona también para tamaños de muestra pequeños, a diferencia del método BRR que requiere una muestra de mínimo dos UPM por estrato. Este método requiere una cantidad de pesos replicados grande, usualmente mayor a 200. 

Siendo $s_{BS}$ la submuestra Bootstrap, el peso replicado del individuo $k$ perteneciente a la UPM $i$ del estrato $h$ sigue la siguiente expresión:
$$
d_k^b = 
\begin{cases}
0, \text{\ si la UPM $i$ no pertence a $s_{BS}$} \\
d_k\left[1 - \sqrt{\frac{n_{Ih}^*}{n_{Ih}-1}}+\sqrt{\frac{n_{Ih}^*}{n_{Ih}-1}}
\frac{n_{Ih}}{n_{Ih}^*}n_{Ihi}^*
\right], \text{\ en otro caso} 
\end{cases}
$$

En donde $n_{Ih}$ es el úmero de UPM en la muestra original del estrato $h$, $n_{Ih}^*$ es el número de UPM en la muestra Bootstrap y $n_{Ihi}^*$ es el número de veces que la UPM $i$ fue seleccionada en la muestra Bootstrap. En este caso se selecciona una muestra Bootstrap con $m^*_h = m_h - 1$, y los pesos toman la siguiente forma

$$
d_k^a = 
\begin{cases}
0,  \ \ \  \ \ \ \ \ \  \ \ \  \ \ \  \ \ \  \ \ \  \ \ \  \ \ \  \ \ \  \ \ \  \ \ \  \ \ \  \ \ \  \ \ \  \ \ \ \ \ \  \ \ \  \ \ \  \ \ \  \ \ \ \text{si la UPM $i$ no pertence a $s_{BS}$} \\
d_k\left[1 - \sqrt{\frac{n_{Ih}^*}{n_{Ih}-1}}+\sqrt{\frac{n_{Ih}^*}{n_{Ih}-1}}
\frac{n_{Ih}}{n_{Ih}^*}n_{Ihi}^*
\right],  \ \ \  \ \ \text{en otro caso} 
\end{cases}
$$

Bajo la metodología Bootstrap (BS), el estimador de la varianza toma la siguiente forma:
$$
\widehat{Var}_{BS}(\hat{\theta}) = \frac{1}{B}\sum_{b=1}^B(\hat{\theta}_b - \hat\theta )^2
$$
En donde $\hat{\theta}_b$ es el estimador del parámetro de interés en la réplica $b$ inducida por la muestra Bootstrap. En resumen, para la $b$-ésima réplica con los pesos resultantesse podrán calcular las estimaciones de totales, proporciones, promedios y razones y sus respectivas varianzas o desviaciones. En general, es necesario reflejar el ajuste de los pesos en los pesos replicados, por esto es necesario trabajar con la muestra originalmente seleccionada, la cual contendrá unidades no elegibles y unidades que no respondieron. Los mismos ajustes que se hicieron a la muestra original se deben realizar en cada réplica. Si hubo calibración de pesos también debe ser incluida como un proceso en cada réplica, para asegurar que el error estándar inducido por estos métodos incluirá el incremento (o decremento) de la varianza inducida por estos ajustes a los pesos. A continuación se ejemplifica la estructura final de una base de datos de pesos replicados con la metodología de bootstrap en el mismo conjunto reducido.



| $k$ |  Estrato |  UPM | $d_k^{(1)}$ | $d_k^{(2)}$ | $d_k^{(3)}$ | $d_k^{(4)}$ |
|:---:|:--------:|:----:|:-----------:|:-----------:|:-----------:|:-----------:|
|  1  | Estrato1 | UPM1 |      2      |      0      |      1      |      1      |
|  2  | Estrato1 | UPM1 |      2      |      0      |      1      |      1      |
|  3  | Estrato1 | UPM2 |      0      |      2      |      1      |      1      |
|  4  | Estrato1 | UPM2 |      0      |      2      |      1      |      1      |
|  5  | Estrato2 | UPM3 |      1      |      1      |      2      |      0      |
|  6  | Estrato2 | UPM3 |      1      |      1      |      2      |      0      |
|  7  | Estrato2 | UPM4 |      1      |      1      |      0      |      2      |
|  8  | Estrato2 | UPM4 |      1      |      1      |      0      |      2      |




@Rao_Wu_1984 y @Rao_Wu_1988 aconsejan seleccionar una muestra con reemplazo de $n_I - 1$ de las $n_I$ UPM de la muestra, teniendo en cuenta la probabilidad de selección del diseño complejo en la primera etapa. Dado que la selección es con reemplazo, una UPM puede ser seleccionada más de una vez en esta nueva muestra. Por otro lado, también es posible realizar una selección sin reemplazo; en este caso, @Preston_2009 recomiendan seleccionar una muestra con reemplazo de $n_I/2$ de las $n_I$ UPM de la muestra, teniendo en cuenta la probabilidad de selección del diseño complejo en la primera etapa.

## Consideraciones adicionales  

En la práctica del muestreo, existen algunos paradigmas que inducen la planeación y diseño de las encuestas. En esta sección se muestran ejemplos y contra-ejemplos que permiten ilustrar algunas mitos en la estimación del error de muestreo de las encuestas de hogares. Para esto, consideremos la varianza del esimador HT, dada a continuación:

$$
Var(\hat{t}_{y, \pi})=
\sum_{k\in U}\sum_{l\in U} \Delta_{kl}\frac{y_k}{\pi_k}\frac{y_l}{\pi_l}
$$

En donde $\Delta_{kl} = (\pi_{kl}-\pi_k\pi_l)$ y $\pi_{kl}$ denota la probabilidad de inclusión conjunta de los elementos $k$ y $l$ pertenezcan a la muestra $s$. Bajo diseños de muestreo de tamaño fijo, existen dos estimadores insesgados para esta varianza, el primero originalmente propuesto por @HT y dado por

$$
\widehat{Var}_1(\hat{t}_{y, \pi})=
\sum_{k\in s}\sum_{l\in s} \frac{\Delta_{kl}}{\pi_{kl}}\frac{y_k}{\pi_k}\frac{y_l}{\pi_l}
$$

El segundo estimador propuesto por @Sen y @YG, está dado por la siguiente expresión:

$$
\widehat{Var}_2(\hat{t}_{y, \pi})=-\frac{1}{2}
\sum_{k\in s}\sum_{l\in s} \frac{\Delta_{kl}}{\pi_{kl}}\left(\frac{y_k}{\pi_k}-\frac{y_l}{\pi_l}\right)^2
$$

#### Estimaciones negativas de varianza {-}

La idea de que no pueden existir estimaciones negativas de la varianza se ha instalado como un razonamiento bastante lógico e intuitivo: dado que la varianza es un parámetro positivo, entonces no puede ser estimada con cantidades negativas. Sin embargo, en la inferencia basada en el diseño de muestreo, sí es posible obtener estimativas negativas de varianza para algunas estructuras poblacionales particulares y es por esto que se requiere una experiencia mayor por parte del equipo de muestreo, que debe conocer bajo qué condiciones se podría presentar esta situación para evadirla. 

Nótese que se debe diferenciar entre estimador (que es una función de variables aleatorias) y parámetro (que es un valor real desconocido). En efecto, para la varianza del estimador HT (parámetro desconocido y siempre positivo) hay estimadores (función de variables aleatorias) que pueden arrojar estimaciones negativas. Es posible que las estimaciones de la varianza arrojen resultados negativos, que no pueden ser utilizados ni interpretados. Considere el siguiente diseño de muestreo de tamaño fijo e igual a $n=2$, el cual induce seis posibles muestras.


| $s$| $I_1$| $I_2$| $I_3$| $I_4$|  $p(s)$|
|---:|---:|---:|---:|---:|----:|
|   $s_1$|   1|   1|   0|   0| 0.31|
|   $s_2$|   1|   0|   1|   0| 0.20|
|   $s_3$|   1|   0|   0|   1| 0.14|
|   $s_4$|   0|   1|   1|   0| 0.03|
|   $s_5$|   0|   1|   0|   1| 0.01|
|   $s_6$|   0|   0|   1|   1| 0.31|

En el anterior ejemplo, la probabilidad de obtener una muestra compuesta por los dos primeros elementos se fijó en 0.31; mientras que la probabilidad de obtener una muestra compuesta por el primer y el tercer elemento se fijó en 0.20 y así sucesivamente. Para esta configuración se obtienen las estimaciones puntuales para cada una de las seis posibles muestras, así como las dos posibles estimaciones de la varianza. Nótese que para ambos escenarios existen estimaciones negativas.

|$s$|$I_1$|$I_2$|$I_3$|$I_4$|$p(s)$|$\hat{t}_{y, \pi}$|$\widehat{Var}_1(\hat{t}_{y, \pi})$|$\widehat{Var}_2(\hat{t}_{y, \pi})$|
|---:|---:|---:|---:|---:|----:|--------:|-----------:|-----------:|
|   $s_1$|   1|   1|   0|   0| 0.31| 9.560440|   38.099984|  -0.9287681|
|   $s_2$|   1|   0|   1|   0| 0.20| 5.883191|   -4.744190|   2.4710422|
|   $s_3$|   1|   0|   0|   1| 0.14| 4.933110|   -3.680428|   8.6463858|
|   $s_4$|   0|   1|   1|   0| 0.03| 7.751323| -100.252974|  71.6674365|
|   $s_5$|   0|   1|   0|   1| 0.01| 6.801242| -165.715154| 323.3238494|
|   $s_6$|   0|   0|   1|   1| 0.31| 3.123994|    3.426730|  -0.1793659|

A pesar de los resultados negativos para las varianzas, tanto el estimador del total como los dos estimadores de su varianza siguen siendo insesgados. En efecto al multiplicar la estimación puntual por la probabilidad del diseño de muestreo se obtienen los valores poblacionales. La varianza del estimador HT para este diseño en particular es 6.744442, la cual corresponde con la esperanza de ambos estimadores de varianza. Para evitar estas estimativas negativas, @Gutierrez_2016 afirma que es necesario garantizar que la covarianza ($\Delta_{kl}$) sea negativa para cada par de elementos en la población ($k \neq l$), lo cual no sucede con este esquema de muestreo, puesto que:

$$
\Delta_{kl} =
\begin{bmatrix}
0.2275  & 0.0825  & -0.1510 & -0.1590 \\
0.0825  & 0.2275  & -0.1590 & -0.1510 \\
-0.1510 & -0.1590 & 0.2484  & 0.0616 \\
-0.1590 & -0.1510 & 0.0616  &  0.2484
\end{bmatrix}
$$

#### Disminución de la varianza ante el aumento del tamaño de muestra {-}

Por otro lado, Tal vez la idea de que la varianza deberá disminuir a medida que el tamaño de muestra crece se ha venido de la lógica intuitiva en donde el error de muestreo no debería existir si se realiza una medición completa de la población. Sin embargo, para algunas estrategias de muestreo es posible encontrar que existen situaciones en donde el tamaño de muestra crece, y con él la varianza del estimador. En esta sección se mostrará un ejemplo en donde sucede exactamente eso. 

Para poder mostrar este hecho, vamos a utilizar un ejemplo reducido. Supongamos una población de $N = 3$ elementos $U=\{1, 2, 3\}$ y comparemos dos diseños de muestreo, el primero con un tamaño de muestra fijo de $n=1$ y el segundo con un tamaño de muestra fijo de $n=2$. En ambos casos la variable de interés es dicotómica que denota la presencia o ausencia del fenómeno en los individuos de la población. En el primer caso, el diseño de muestreo de tamaño de muestra $n=1$ es el siguiente:

| $s$| $I_1$| $I_2$| $I_3$|   $p(s)$|
|--:|---:|---:|---:|---:|
|  $s_1$|   1|   0|   0| 0.5|
|  $s_2$|   0|   1|   0| 0.1|
|  $s_3$|   0|   0|   1| 0.4|

En este esquema de muestreo, la varianza del estimador de Horvitz-Thompson es igual a $Var(\hat t_{y, \pi}) = 1.5$. Sin embargo, en un segundo caso, considere el siguiente diseño de muestreo de tamaño de muestra $n=2$:

| $s$| $I_1$| $I_2$| $I_3$|   $p(s)$|
|--:|---:|---:|---:|---:|
| $s_1$|   1|   1|   0| 0.7|
| $s_2$|   1|   0|   1| 0.2|
| $s_3$|   0|   1|   1| 0.1|

Nótese que en este esquema de muestreo, la varianza del estimador de Horvitz-Thompson es igual a $Var(\hat t_{y, \pi}) = 2.3$. Por tanto, no es exacto afirmar que siempre que un diseño de muestreo contemple un tamaño de muestra más grande se tendrá obligatoriamente una reducción de la varianza. 
