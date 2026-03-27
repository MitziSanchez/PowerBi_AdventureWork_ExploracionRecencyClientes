# Análisis Exploratorio de Recency de Clientes - AdventureWorks (Power BI)

## Descripción del proyecto
Este proyecto presenta un análisis exploratorio de cálculo de recency de clientes de la base de datos [**AdventureWork2019**](https://learn.microsoft.com/es-es/sql/samples/adventureworks-install-configure?view=sql-server-ver17&tabs=ssms)  (Venta de bicicletas y accesorios) de Microsoft.

## Objetivos del proyecto
- Generar un análisis de los clientes basado en recency (Recencia, días desde última venta realizada). Por medio de 2 puntos de vista:
    - Análisis de clientes considerando Recency Histórica. (Todas las ventas realizadas a los clientes).
        - Segmentar los clientes en estados y conocer la proporción de clientes por cada uno de ellos: Activos, en riesgo e inactivos.
        - Segmentar los clientes en base a una categorización (Score) por quintiles.
        - Identificar la proporción de clientes en riesgo y visualizar la distribución en Scores.
    - Análisis de clientes considerando las ventas del último año.    
        - Analizar recency histórica con fechas de corte de último mes disponible y mes anterior.
        - Visibilizar el movimiento de los clientes en riesgo desde mes anterior a mes actual.
        - Visibilizar el comportamiento de los clientes del período anterior y el período actual en base a estado de transición de recency entre períodos.

## Stack Tecnológico
- SQL Server
- Power BI
- DAX
- Power Query
- Git/GitHub

## Modelo de datos Analítico
Modelo basado en esquema estrella compuesto por:
- **FactCustomerBase:** Resumen histórico de ventas de los clientes. Considera fechas de primera y última venta, total de ordenes realizadas y valor monetario de ventas realizadas.
- **FactCustomerMonthly:** Resumen de los últimos 12 períodos de las ventas de los clientes (Cada período considera un mes, desde último período con ventas hacia atrás). Considera fechas de primera y última venta, cantidad de ordenes y valor monetario del total de ventas realizadas a cada cliente por cada período. 
- **DimCustomerRFM:** Datos complementarios de clientes.
- **DimTerritoryRFM:** Datos complementarios de territorios geográficos. (Ubicación de los clientes)
- **DimDateRFM:** Datos complementarios de fechas de venta.

## Desarrollo
- Definir los datos necesarios y su estructura para modelo análitico. (Esquema estrella).
- Se generan vistas en SQL que posteriormente se cargan en Power BI.
- Se define fecha de corte para cálculo de recency (última fecha de venta disponible).
- Calculo de recency histórica. Días desde última venta hasta la fecha de corte 
- Definición de estados: Activo, Riesgo e Inactivo. (Calculados en base a la recency histórica promedio).
- Definición de Score en base a quintiles de la recency histórica.
- Se genera página de análisis para recency histórica, se definen KPIs y se incorporan gráficas para visualizar la distribución de los clientes en base a las dos categorizaciones generadas. Estado y Score.
- Se genera página de análisis centrado en clientes con estado de riesgo. Se definen KPIs y se incorporan gráficas para visibilizar la composición de los clientes en riesgo en base al score. Es decir, poder vislumbrar dentro del riesgo, cuantos clientes han comprado más recientemente que otros y el valor monetario que representan.
- Se genera página de análisis basado en los registros del último año. Donde se compara con corte al último mes disponible y su mes anterior.
- Se generan tablas auxiliares en Power Query para cálculo de recency y evaluación de estados y score para ambos períodos de corte y se unifican en una nueva tabla.
- Se incorporan los estados de transición.
- Se incorporan las siguientes gráficas en la página de transición de estados:
    - Gráfica para visualizar el comportamiento de los clientes en riesgo desde mes anterior al actual. Clientes en riesgo del período anterior + entrantes - salientes.
    - Gráfica para visualizar distribución de los clientes en el período actual. Considera estados de recency.
    - Gráfica para visualizar la transición de los clientes: Mejora, empeora, sin ambios o clientes nuevos.

## Vistas previas de dashboards

>[!NOTE]
>
>Dentro del proyecto puede encontrar un archivo PDF con las páginas del informe de Power BI.

<img width="1415" height="790" alt="image" src="https://github.com/user-attachments/assets/c27c4bb1-8c94-456d-ba76-c31e4fcc9fb1" />
<img width="1410" height="794" alt="image" src="https://github.com/user-attachments/assets/9911bae1-ad26-4d64-9584-4b3f893cc55f" />
<img width="1408" height="791" alt="image" src="https://github.com/user-attachments/assets/6fb2fcff-28a5-4460-8aea-9faf151a4bf2" />
<img width="1407" height="789" alt="image" src="https://github.com/user-attachments/assets/3521f900-d8e3-46a8-bd55-9ffb571a1230" />
<img width="1407" height="791" alt="image" src="https://github.com/user-attachments/assets/fb73b094-e498-4fdc-95c1-620ca0e17d3b" />
<img width="1411" height="789" alt="image" src="https://github.com/user-attachments/assets/7c5a9b97-7087-4ea9-af13-b341d538e0c4" />
<img width="1403" height="788" alt="image" src="https://github.com/user-attachments/assets/6a8691dc-55d2-4695-bf08-8ebda3d44aff" />


















