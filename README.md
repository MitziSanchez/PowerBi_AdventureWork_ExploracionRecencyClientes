# Análisis Exploratorio de Recency de Clientes - AdventureWorks (PowerBI)

## Descripción del proyecto
Este proyecto presenta un análisis exploratorio de calculo de recency de clientes de la base de datos [**AdventureWork2019**](https://learn.microsoft.com/es-es/sql/samples/adventureworks-install-configure?view=sql-server-ver17&tabs=ssms)  (Venta de bicicletas y accesorios) de Microsoft.

Considera el uso de SQL para extraer data para ser analizada con Power BI.

## Objetivos del proyecto
- Analizar clientes en base a Recency (Recencia, días desde última venta realizada)
    - Analizar Recency Historica (Considerando la totalidad de datos disponibles de ventas). Definir estados y categorización (Score) por quintiles.
    - Analizar clientes en riesgo en base a estado de recency historica.
    - Analizar recency historica con fechas de corte de último periodo disponible y su periodo anterior.
    - Visibilizar el comportamiento de los clientes de periodo anterior a periodo actual en base a estado de transición de recency entre periodos.

## Stack Tecnológico
- SQL Server
- PowerBI
- DAX
- Power Query
- Git/GitHub


## Modelo de datos Analítico
Modelo basado en esquema estrella compuesto por:
- **FactCustomerBase** Concentración de data historica por clientes. Considera fechas de primera y última venta, total de ordenes realizadas y valor monetario de compras realizadas.
- **FactCustomerMontly** Concentración de data de los clientes de los últimos 12 periodos (Cada periodo considera un mes, desde último periodo con ventas hacia atras). Considera fechas de primera y última ventaa, cantidad de ordenes y valor monetario total de ventas realizadas a cada cliente por cada periodo. 
- **DimCustomerRFM** Datos complementarios de clientes.
- **DimTerritoryRFM** Datos complementarios de territorios geográficos. (Ubicación de los clientes)
- **DimDateRFM** Datos complementarios de fechas de venta.

## Desarrollo
- Calculo de recency historica. Días desde última venta hasta la fecha de corte (última fecha de venta disponible)
- Definición de estados: Activo, Riesgo e Inactivo. (Calculados en base a la recency historica promedio)
- Definición de Score en base a quintiles de la recency historica. 
- Gráficas para visualizar la distribución de los clientes en base a las dos categorizaciones generadas. Estado y Score.
- Análisis centrado en clientes con estado de riesgo. Gráficas para distribución de clientes en riesgo en base a la score.
- Calculo de recency historica considerando último periodo disponible (mes) y su periodo anterior. Generación de nueva tabla a través de Power Query, calculando recency y estados con ambos periodos de corte. Integrados en una única tabla en el modelo.
- Calculo de estado de transición en base al estado de recency. Transición de periodo anterior a periodo actual (último periodo disponible).
- Gráfica para visualizar la composición de los clientes actuales en base al riesgo. (Clientes en riesgo del periodo anterior, entrantes y salientes).
- Gráfica para visualizar la distribución de clientes en base a estado del periodo actual (Activo, Riesgo e Inactivo.)
- Gráfica para visibilizar la transición de clientes desde el periodo anterior al periodo actual.

## Vistas previas de dashboards

>[!NOTE]
>
>Dentro del proyecto puede encontrar un archivo PDF con las páginas del informe de Power BI.






