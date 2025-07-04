@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking - Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZBOOKING_i_7376_A as projection on ZBOOKING_r_7376_A
{
    key BookingUUID,
    TravelUUID,
    BookingID,
    BookingDate,
    CustomerID,
    AirlineID,
    ConnectionID,
    FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    FlightPrice,
    CurrencyCode,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _BookingSupplement: redirected to composition child ZBKSUPP_i_7673_A,
    _Carrier,
    _Connection,
    _Customer,
    _Travel: redirected to parent ZTRAVEL_i_7376_A
}
