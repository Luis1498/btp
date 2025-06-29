@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZC_CLIENTE_7376
  as select from ztb_cliente_7376 as Clientes
    inner join   ztb_cln_lib_7376 as Clienteslibros on Clienteslibros.id_cliente = Clientes.id_cliente
{
  key Clienteslibros.id_libro as Idlibro,
  key Clientes.id_cliente     as IdCliente,
  key Clientes.tipo_acceso    as Acceso,
      Clientes.nombre         as Nombre,
      Clientes.apellidos      as Apellidos,
      Clientes.email          as Email,
      Clientes.url            as Imagen,
      concat_with_space(Clientes.nombre, Clientes.apellidos, 1) as NombreCompleto
}
