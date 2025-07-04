CLASS zcl_data_travel_7376 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_data_travel_7376 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: lt_travel  TYPE TABLE OF ztravel_7376_a,
          lt_booking TYPE TABLE OF zbooking_7376_a.

     out->write( 'Adding Travel data' ).

    delete from ztravel_7376_a.

    insert ztravel_7376_a from (
    select from /dmo/travel
      fields
        " client
        uuid( ) as travel_uuid,
        travel_id,
        agency_id,
        customer_id,
        begin_date,
        end_date,
        booking_fee,
        total_price,
        currency_code,
        description,
        case status when 'B' then 'A'
                    when 'P' then 'O'
                    when 'N' then 'O'
                    else 'X' end as overall_status,
        createdby as local_created_by,
        createdat as local_created_at,
        lastchangedby as local_last_changed_by,
        lastchangedat as local_last_changed_at,
        lastchangedat as last_changed_at

    ).




   out->write( 'Adding Booking data' ).

    delete from zbooking_7376_a.

    insert zbooking_7376_a from (

        select
          from /dmo/booking
          join ztravel_7376_a on /dmo/booking~travel_id = ztravel_7376_a~travel_id
          join /dmo/travel on /dmo/travel~travel_id = /dmo/booking~travel_id
          fields  "client,
                  uuid( ) as booking_uuid,
                  ztravel_7376_a~travel_uuid as parent_uuid,
                  /dmo/booking~booking_id,
                  /dmo/booking~booking_date,
                  /dmo/booking~customer_id,
                  /dmo/booking~carrier_id,
                  /dmo/booking~connection_id,
                  /dmo/booking~flight_date,
                  /dmo/booking~flight_price,
                  /dmo/booking~currency_code,
                  case /dmo/travel~status when 'P' then 'N'
                                                   else /dmo/travel~status end as booking_status,
                  ztravel_7376_a~last_changed_at as local_last_changed_at ).


delete from zbksupp_7673_a.

    out->write( 'Adding Booking Supplements data' ).

    insert zbksupp_7673_a from (
       select from /dmo/book_suppl as supp
              join ztravel_7376_a  as trvl on trvl~travel_id = supp~travel_id
              join zbooking_7376_a as book on book~parent_uuid = trvl~travel_uuid
                                         and book~booking_id = supp~booking_id
              fields
              uuid( )                 as booksuppl_uuid,
              trvl~travel_uuid        as root_uuid,
              book~booking_uuid       as parent_uuid,
              supp~booking_supplement_id,
              supp~supplement_id,
              supp~price,
              supp~currency_code,
              trvl~last_changed_at    as local_last_changed_at

    ).




  ENDMETHOD.
ENDCLASS.
