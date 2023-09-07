Базовые принципы
================

Для любого вызова в ответ вы получите объект ответа httpx. Таким образом,
вы можете делать с ним все, что угодно в соответствии с `httpx docs <https://www.python-httpx.org/quickstart/>`_.
Вы можете разобрать ответ как json, читать код состояния http, заголовки ответа и прочее.

Обратите внимание, что ответы бывают только двух типов - успешные (< 400) и ошибки (>= 400). Формат ответа смотри в документации к API в каждом конкретном случае.

В отличии от успешных ответов, ошибки всегда приходят в одинаковом формате и могут быть легко обработаны. 
Например:

.. code:: python

    from serp import Client

    class NeuroIOFieldError:
        def __init__(self, name: str, message: str, error_code: int):
            self.name = name
            self.message = message
            self.error_code = error_code
            

    class NeuroIOException(Exception):
        def __init__(self, json_response: dict):
            self.error_codes = json_response["error_codes"]
            self.message = json_response["message"]
            self.fields = [NeuroIOFieldError(**f) for f in json_response["fields"]]

            
    if __name__ == '__main__':
        c = Client()
        response = c.spaces.create(name="test")
        if response.status_code >= 400:
            exc = NeuroIOException(json_response=response.json())
            raise exc

