#import "@preview/tablem:0.3.0": tablem, three-line-table
#import "@preview/booktabs:0.0.4": *
#import "@preview/mitex:0.2.5": *

#show: booktabs-default-table-style


= Model calibration and parametrization

The model considers two types of parameters: those that can be directly observed in the data and those that can be estimated indirectly. The first group of parameters includes variables such as survival probabilities and capital ratios. The second group of variables includes those that are estimated through a calibration procedure. The calibration procedure usually consists of adjusting the parameter values ​​until one or more model outputs are sufficiently close to their observed real-world values.

== Exogenous parameters

Each period in the model corresponds to 5 years in real life. Households are assumed to begin their economic life at age 20 $(j=1)$ and face a life expectancy of 100 years, so the life cycle in the model covers $J J=16$ periods. The mandatory retirement age is defined as 65, which in the model means that the retirement age corresponds to $J R=10$ periods, so households spend the last 7 periods as retirees and receive a pension.

Since we are considering a period to correspond to 5 years, some annual rates must be converted. Considering the case of the population growth rate, assuming an annual growth rate of 1 percent, the conversion to a 5-year compound annual growth rate would be equal to $n_p=1.01^5-1 ~ 0.05$.

The capital-to-product ratio and the labor-to-income ratio were obtained from PWT 10.01, Penn World Table. The age-specific productivity profile was calculated using the National Survey of Occupation and Employment (ENOE) for the second quarter of 2021.

Total government spending as a fraction of GDP is obtained from the World Bank and corresponds to government final consumption expenditure#footnote[https://data.worldbank.org/indicator/NE.CON.GOVT.ZS], while the public debt-GDP ratio was obtained from the ECLAC database.

For the calibration of the model we consider 2021 as the base year, so that all exogenous parameters correspond to this year.


== Calibrated parameters

The parameters to be calibrated corresponding to production were the level of technology $Omega$ and the depreciation rate $delta$. At the authors' suggestion, the wage rate is normalized to one, $w=1$. The parameter $Omega$ It was numerically calibrated until the wage rate values ​​closest to one were obtained. Meanwhile, The depreciation rate did not need to be calibrated because the rate for all three countries is presented in PWT 10.01, Penn World Table.

The parameter $nu$ It represents the trade-off of individual preferences regarding consumption and leisure. The larger the value of $nu$, It is more attractive for households to consume goods and services that are paid for in the market than to consume leisure time. The parameter $nu$, Therefore, it has a significant influence on the number of hours a household works in the market. It adjusts $nu$ to a target of an average ratio of work time to total allocated time that represents approximately 33 percent. This value is calculated for each country assuming a maximum weekly work time allocation of 110 hours, as well as 50 work weeks per week. This annual average of hours worked per employee, which is available in PWT 10.01, Penn World Table for the countries under study, is then compared.

The following parameters to be calibrated correspond to the formation process and variance of the logarithm of wage income over the household life cycle. Empirical studies indicate that around age 25, the variance of income is 0.3 and tends to increase almost linearly to a value of 0.9 by age 60. In the model presented here, the variance of the logarithm of labor earnings is determined by two components: through exogenous processes that affect labor productivity in an idiosyncratic way $theta$ and $eta_j$, as well as by individual decisions about how many hours of work are offered in the market. We have information about the structure of the labor productivity process and how this might influence the variance of the logarithm of labor earnings. The logarithm of an individual's labor earnings is defined as

==  Tax system and pension system
The tax and pension systems still need to be defined. The government has four tax schemes to define in order to balance its budget:
1. Define exogenously the value of $tau_t^w$ and $tau_t^r$, calculate the value of $tau_t^c$.
2. Define exogenously the value of $tau_t^c$, calculate the value of $tau_t^w$ and $tau_t^r$
3. Define exogenously the value of $tau_t^c$ and $tau_t^r$, calculate the value of $tau_t^w$.
4. Define exogenously the value of $tau_t^c$ and $tau_t^w$, calculate the value of $tau_t^r$.

Para las ejecuciones del modelo se definió el esquema 4 , es decir, de forma exógena asignamos un valor de la tasa de impuesto al consumo y al ingreso laboral, y el modelo calcula la tasa de impuesto del capital. Se utilizaron los cálculos de las tasas efectivas de los impuestos al consumo y al ingreso realizados por el CIEP.

Con respecto al sistema de pensiones, tenemos que definir la tasa de reemplazo $kappa$. El valor observado de la tasa de reemplazo para los tres países fue obtenido de OECD-Founded Pension Indicators-Contributions.

El valor del factor de descuento intertemporal $beta$ fue el mismo que el usado por los autores.

Para el equilibrio inicial, consideramos que el sistema de pensiones es regresivo, es decir el factor de progresividad $lambda=0$.

Las tasas de probabilidad de muerte fueron estimadas con las pirámides poblacionales por cohorte de edad del Censo de Población y Vivienda de 2020.  

== Resumen de parámetros exógenos (*E*), calibrados (*C*) y objetivos (*T*) 

La siguiente tabla presenta los parámetros del modelo. Se clasifican de acuerdo a parámetros que son obtenidos directamente de los datos (parámetro exógenos) y aquellos que son calibrados. Se describe de forma breve el proceso de calibración. Para más detalle, véase la sección de Parametrización y calibración del modelo.

Se muestra también las salidas del modelo que son definidas como targets de calibración. Para el caso de estos targets así como de los parámetros exógenos, se señala la fuente de consulta de datos que se utilizó en el presente análisis.


#three-line-table[
| *Parámetro* | *Descripción* | *E* | *C* | *T* | *Descripción* |
| :---: | :--- | :--- | :--- | :--- | :--- |
| TT | Número de periodos de transición. Cada periodo equivale a 5 años en la vida real. | X |  |  | Definido por criterio numérico |
| JJ | Número de años que vive un hogar. Los hogares empiezan su vida económica a los 20 años ( $j=1$ ). Viven hasta los 100 años ( $J J=16$ ). | X |  |  | |
| JR | Edad obligatoria de retiro. Los hogares se retiran a los 65 años ( $j_r=10$ ) | X |  |  |  |
| $gamma$ | Coeficiente de aversión relativa al riesgo (recíproco de la elasticidad de sustitución intertemporal) |  | X |  | El parámetro fue calibrado hasta obtener las salidas más cercanas a los valores observados de las razones del Consumo e Inversión con respecto al PIB. |
| $nu$ | Parámetro de la intensidad de preferencia de ocio. | X |  |  | Se consultó PWT 10.01, Penn World Table |
| $beta$ | Factor de descuento de tiempo. |  | X |  | Calibrado por Fehr y Kindermann (2018). |
| $sigma_theta^2$ | Varianza del efecto fíjo $theta$ sobre la productividad. |  | X |  | Calibrado por Fehr y Kindermann (2018). |
| $sigma_epsilon^2$ | Varianza del componente autoregresivo $eta$. | X | |  | Calibrado por Fehr y Kindermann (2018). |
| $alpha$ | Elasticidad del capital en la función de producción. Corresponde a la razón capital en el producto. | X | | | Se consultó PWT 10.01, Penn World Table |
| $delta$ | Tasa de depreciación de capital. | X | | | Se consultó PWT 10.01, Penn World Table |
| $Omega$ | Nivel de tecnología. |  | | | Calibrado numéricamente para ajustar la tasa de salarios a $w_t=1$. |
| $n_p$ | Tasa de crecimiento poblacional. | X | | | Se consultó OECD, Fertility rates |
| gy | Gasto público como porcentage del PIB. | X | | | Se consultó Banco Mundial, General government final consumption expenditure (% of GDP) |
| by | Endeudamiento público como porcentage del PIB. | X | | | Banco de datos de CEPAL |
| $kappa$ | Tasa de reemplazo de sistema de pensiones. | X | | | Se consultó OECD-Founded Pension Indicators-Contributions |
| $psi_j$ | Tasas de supervivencia por cohorte de edad. | X | | | Calculado con las pirámides poblacionales del Censo de Población de 2020 |
| $e_j$ | Perfil de eficiencia de ingresos laborales por cohorte de edad. | X | | | ENOE Q2 2021 |
| $tau_t^c$ | Tasa de impuesto al consumo. | X |  | | Tasa efectiva calculada por CIEP |
| $tau_t^w$ | Tasa de impuesto al ingreso laboral. | X |  | | Tasa efectiva calculada por CIEP |
| $tau_t^r$ | Tasa de impuesto al ingreso de capital. |  | X | | Se consultó OECD Tax Database |
| $tau_t^p$ | Tasa de contribución sobre nómina al sistema de pensiones. |  | X | | Se consultó OECD-Founded Pension Indicators-Contributions |
| $tau_(j, t)^(i m p l)$ | Tasa de impuestos implícita de la contribución sobre nómina al sistema de pensiones. |  | X | |  |
| $lambda$ | Factor de progresividad del sistema de pensiones. | X |  | |  |
| PEN/GDP | Pago a pensiones como porcentaje del PIB. |  | X | | Se consultó OECD-Pensions at Glance-Public expenditure on pensions |
| C/GDP. | Consumo privado como porcentaje del PIB. |  | X | | Se consultó PWT 10.01, Penn World Table |
| I/GDP | Inversión como porcentaje del PIB. |  | X | | Se consultó PWT 10.01, Penn World Table |
]

== Parámetros del modelo
La siguiente tabla resume los valores de los parámetros del modelo:
#table(
  columns: 3,
  align: (left, center, center),
  toprule(), // added by this package
  table.header(
    [*Descripción*],
    [*Parámetro*],
    [*México*],
  ),
  midrule(), // added by this package
  table.cell(colspan: 3)[*Función de Utilidad*],
  
  [Coeficiente de aversión relativa al riesgo (recı́proco de la elasticidad de sustitución intertemporal)],
  [$gamma$],
  [0.18],

  [Parámetro de la intensidad de preferencia de ocio.],
  [$nu$],
  [0.45],

  [Factor de descuento de tiempo.], 
  [$beta$],
  [0.998],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Función de Producción*],
  
  [Elasticidad del capital en la función de producción. Corresponde a la razón capital-producto.],
  [$alpha$],
  [0.619],

  [Tasa de depreciación de capital.],
  [$delta$],
  [3.8 %],

  [Nivel de tecnologı́a.],
  [$Omega$], 
  [1.65], 

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Riesgo en productividad laboral*],
  [Componente autoregresivo del shock en productividad.],
  [$rho$],
  [0.98],

  [Varianza del componente autoregresivo $eta$], 
  [$sigma_epsilon^2$], 
  [0.05],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Gobierno*],
  [Gasto público como porcentage del PIB.], 
  [gy], 
  [11.02 %],

  [Endeudamiento público como porcentaje del PIB.], 
  [by], 
  [52.3 %],

  [Tasa de impuesto al consumo.], 
  [$tau_t^c$], 
  [5.73 %],

  [Tasa de impuesto al ingreso.], 
  [$tau_t^w$], 
  [12.73 %],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Sistema de Pensiones*],

  [Tasa de reemplazo de sistema de pensiones.],
  [$kappa$],
  [64.3%],

  [Factor de Progresividad del sistema de pensiones.],
  [$lambda$],
  [0.0],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Demografía*],

  [Tasa de crecimiento poblacional],
  [$n_p$],
  [1.8 %],

  bottomrule() // added by this package
)

== Equlibrio Inicial 

#table(
  columns: 3,
  align: (left, center, center),
  toprule(), // added by this package
  table.header(
    [],
    [Modelo],
    [Observado],
  ),
  midrule(), // added by this package
  table.cell(colspan: 3)[*Mercado de Bienes ( % PIB)*],
  
  [- Consumo Privado],
  [69.04],
  [70.2],
  [- Gasto Público],
  [11.02],
  [11.02],

  [- Inversión], 
  [19.94],
  [18.39],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Tasas de impuestos (en %)*#footnote[Tasas Efectivas vs Tasa Nominal]],
  
  [- Consumo],
  [5.73],
  [16.0],

  [- Ingreso],
  [12.73],
  [1.92 - 35.0],

  [- Capital],
  [14.58],
  [12.13#footnote[Tasa Efectiva]],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Ingresos por impuestos ( % PIB)*],
  
  [- Consumo],
  [3.96],
  [4.07],

  [- Ingreso],
  [4.85],
  [3.91#footnote[Impuestos al ingreso aplicados a remuneraciones a asalariados e ingresos mixtos]],

  [- Capital], 
  [8.14],
  [5.33],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Sistema de pensiones*],
  
  [- Tasa de reemplazo],
  [64.3],
  [64.3],

  [- Pagos a pensiones ( % PIB)],
  [2.44],
  [18.2],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Demografía*],
  
  [- Tasa de crecimiento poblacional],
  [1.82],
  [1.82],


  bottomrule() // added by this package
)
