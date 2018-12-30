class GlossaryObject:
    name = None
    definition = None
    calculation = None
    id_ = 0
    Related = None

    def __init__(self, id_=None, n=None, d=None, c=None, r=None):
        self.id_ = id_
        self.name = n
        self.definition = d
        self.calculation = c
        self.Related = r
