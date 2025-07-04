@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement - Root Entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZBKSUPP_r_7673_A
  as select from zbksupp_7673_a
  
  association to parent ZBOOKING_r_7376_A as _Booking on $projection.BookingUUID = _Booking.BookingUUID
  association [1..1] to ZTRAVEL_r_7376_A as _travel on $projection.TravelUUID = _travel.TravelUUID
  association [1..1] to /DMO/I_Supplement as _Product on $projection.SupplementID = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText as _SupplementText on $projection.SupplementID = _SupplementText.SupplementID
{
  key booksuppl_uuid        as BooksupplUUID,
      root_uuid             as TravelUUID,
      parent_uuid           as BookingUUID,
      booking_supplement_id as BookingSupplementID,
      supplement_id         as SupplementID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      // Local ETag Field
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at       as LastChangedAt,
      _Booking,
      _travel,
      _Product,
      _SupplementText
      
}
