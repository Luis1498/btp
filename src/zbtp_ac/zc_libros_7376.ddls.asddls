@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Libros'
@Search.searchable: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZC_LIBROS_7376
  as select from    ztb_libros_7376 as Libros
    inner join      ztb_catego_7376 as categoria on Libros.bi_categ = categoria.bi_categ
    left outer join ZC_CLN_LIB_7376 as Ventas    on Libros.id_libro = Ventas.IdLibro
  association [0..*] to ZC_CLIENTE_7376 as _Clientes on $projection.IdLibro = _Clientes.Idlibro
{
  key Libros.id_libro       as IdLibro,
      Libros.titulo         as Titulo,
      Libros.bi_categ       as Categoria,

      Libros.autor          as Autor,
      Libros.editorial      as Editorial,
      Libros.idioma         as Idioma,
      Libros.paginas        as Paginas,
      @Semantics.amount.currencyCode: 'Moneda'
      Libros.precio         as Precio,
      Libros.moneda         as Moneda,

      case
      when Ventas.Ventas  < 1 then 0
      when Ventas.Ventas  = 1 then 1
      when Ventas.Ventas  = 2 then 2
      when Ventas.Ventas  > 2 then 3
      else 0
      end                   as Ventas,
      categoria.descripcion as Descripcion,

      Libros.formato        as Formato,
      Libros.url            as Imagen,
      _Clientes
}


