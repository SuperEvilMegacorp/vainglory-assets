# Recibiendo Respuestas
 
## Payload

Todas las respuestas de servidor contienen un objeto raíz JSON.  

~~~.language-json
{
  "data": {
    "type": "match",
    "id": "skarn",
    "attributes": {
      // ... this matches attributes
    },
    "relationships": {
      // ... this matches relationships
    }
  }
}
~~~

~~~.language-json
{
  "data": {
    "type": "match",
    "id": "1"
  }
}
~~~

Una respuesta contendrá al menos uno de los siguientes miembros top-level:
 
  * `data`: los “datos primarios” de la respuesta
  * `errors`: una colección de objetos error
 
Una respuesta puede contener cualquiera de estos miembros top-level:
 
  * `links`: un objeto enlace relacionado a los datos primarios.
  * `included`: Una colección de objetos recurso que están relacionados a los datos primarios y/o entre sí (“included resources”).

Si un documento no contiene una llave de datos top-level, el miembro incluido no estará presente tampoco.
 
Datos primarios serán uno de los siguientes:
 
  * Un único [resource object][resource objects], Un único [resource identifier object], o `null`
  * Una colección de [resource objects], una colección de [resource identifier objects][resource identifier object],o una colección vacía (`[]`)
 
Por ejemplo, los siguientes datos primarios son un único objeto recurso (single resource object):

Los siguientes datos primarios son un único [resource identifier object] que refiere al mismo recurso:
 
Un grupo de recursos lógico siempre será representada como una colección, incluso si solo contiene un item o si está vacío.
 
## Límites De Ratio
>Las cabeceras de límite de ratio son definidas de la siguiente manera:

~~~
X-RateLimit-Limit - Límite de peticiones por día / minuto 
X-RateLimit-Remaining - El número de peticiones que quedan en ese periodo de tiempo
X-RateLimit-Reset - El tiempo que queda antes que se rellene el límite de ratio en época UTC nanosegundos.
* Tokens de límite son incrementalmente llenados por 60(seg)/ límite de ratio. ejemplo: 60(seg)/10(ratio) consigue un token de ratio cada 6 segundos hasta llegar al límite de ratio máximo.    
~~~
Se bueno. Si envías demasiadas peticiones demasiado rápido, enviaremos un código de error `429` (servidor no disponible).
 
<aside class="notice">
Gratis para uso no comercial para un máximo de 10 peticiones por minuto! Para incrementar tu límite, por favor contacta api@superevilmegacorp.com
</aside>