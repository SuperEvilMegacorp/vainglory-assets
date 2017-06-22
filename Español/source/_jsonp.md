# JSON-P Callbacks
 
Puedes enviar un parámetro ?callback para cualquier llamada GET para tener los resultados envueltos en una función JSON. Esto es típicamente utilizado cuando navegadores quieren empotrar contenido en páginas web pasando problemas de dominio cruzado. La respuesta incluye el mismo output de datos del API regular, más la relevante información de cabecera HTTP.


```shell
curl https://api.dc01.gamelockerapp.com/status?callback=foo
```

```javascript
foo({
  "meta": {  
    "content-length":34,
    "content-type":"application/json; charset=utf-8",
    "status":200
  },
  "data": {
    ...  // the data
  }
})
```
