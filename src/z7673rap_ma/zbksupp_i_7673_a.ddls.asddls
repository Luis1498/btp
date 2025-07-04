@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement - Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZBKSUPP_i_7673_A as projection on ZBKSUPP_r_7673_A
{
    key BooksupplUUID,
    TravelUUID,
    BookingUUID,
    BookingSupplementID,
    SupplementID,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Price,
    CurrencyCode,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    LastChangedAt,
    /* Associations */
    _Booking: redirected to parent ZBOOKING_i_7376_A,
    _Product,
    _SupplementText,
    _travel: redirected to ZTRAVEL_i_7376_A
}
