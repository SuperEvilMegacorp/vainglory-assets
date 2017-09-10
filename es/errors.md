# Errores
 
El servidor dejará de procesar si un problema es encontrado y devuelve el HTTP error status code correcto.
Errores podrían incluir error objects,que son devueltos como una colección llamado `errors` en el top level de un documento JSON API.
 
Error objects tienen los siguientes miembros:
 
* `title`: (Necesario) el HTTP status code aplicable a este problema, expresado como un string value
  string value.
* `description`: (Opcional) un resumen corto del problema.
 
El servidor utiliza estos códigos de error:

Error Code | Significado
---------- | -------
400 | Bad Request -- Tu petición apesta
401 | Unauthorized -- Tu llave API está mal
403 | Forbidden -- El object pedido está solo para administradores
404 | Not Found -- El objeto especificado no fue encontrado
405 | Method Not Allowed -- Intentaste acceder a un object con un metodo invalido
406 | Not Acceptable -- Pediste un formato que no es JSON
410 | Gone -- El objeto pedido ha sido removido de nuestros servidores
418 | I'm a teapot
429 | Too Many Requests -- Estás pidiendo demasiados datos! Despacio!
500 | Internal Server Error -- Tuvimos un problema con nuestro servidor. Prueba más tarde.
503 | Service Unavailable -- Estamos temporalmente offline por mantenimiento. Por favor prueba más tarde.
