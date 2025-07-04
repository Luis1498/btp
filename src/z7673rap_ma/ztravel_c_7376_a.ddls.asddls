@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel - Consumption Entity'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZTRAVEL_c_7376_A
  provider contract transactional_query
  as projection on ZTRAVEL_r_7376_A
{
  key TravelUUID,
      @Search.defaultSearchElement: true
      TravelID,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'AgencyName' ] //atar Id con el texto
      @Consumption.valueHelpDefinition: [{ entity: { name:  '/DMO/I_Agency_StdVH', //Se agrega una ayuda de busqued
                                                     element: 'AgencyID'},
                                           useForValidation: true}] //Validar que el valor introducido por el usuario es correcto
      AgencyID,
      _Agency.Name as AgencyName,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'CustomerName' ] //atar Id con el texto
      @Consumption.valueHelpDefinition: [{ entity: { name:  '/DMO/I_Customer_StdVH', //Se agrega una ayuda de busqued
                                                     element: 'CustomerID'},
                                           useForValidation: true}] //Validar que el valor introducido por el usuario es correcto
      CustomerID,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
       @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'CustomerName' ] //atar Id con el texto
      @Consumption.valueHelpDefinition: [{ entity: { name:  'I_CurrencyStdVH', //Se agrega una ayuda de busqued
                                                     element: 'Currency'},
                                           useForValidation: true}] //Validar que el valor introducido por el usuario es correcto
      CurrencyCode,
      
      Description,
      OverallStatus,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking,
      _Currency,
      _Customer,
      _OverallStatus
}
