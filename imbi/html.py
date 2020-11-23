from sprockets.mixins.mediatype import transcoders


class HTMLTranscoder(transcoders.JSONTranscoder):

    def __init__(self, content_type='text/html', default_encoding='utf-8'):
        super().__init__(content_type, default_encoding)
        self.dump_options = {
            'default': self.dump_object,
            'separators': (',', ':')
        }

    def dumps(self, value):
        """Just pass through the value if it's a string, otherwise dump it as
        JSON.

        :rtype: str

        """
        if not isinstance(value, (bytes, str)):
            value = '<html><body><pre>{}</pre></body></html>'.format(
                super().dumps(value))
        return value

    @staticmethod
    def loads(value):
        """Just pass through the value."""
        return value
